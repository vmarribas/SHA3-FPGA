----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:46:21 01/25/2019 
-- Design Name: 
-- Module Name:    keccak_fsm - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;
library work;
use work.keccak_globals.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keccak_fsm is
    Port ( keccak_in : in  k_row;
			  clk : in  STD_LOGIC;
--           load : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           keccak_out : out  k_row
           );
end keccak_fsm;

architecture Behavioral of keccak_fsm is

	--Permutations modules
	component theta_row
		 Port ( theta_row_in : in  k_row;
				  parity_this : in k_row;
				  parity_prev : in k_row;
				  theta_row_out : out  k_row
				 );
	end component;
	
	component theta_parity_adresses
		 Port ( clk : in  STD_LOGIC;
				  we : in  STD_LOGIC;
				  parity_row_in : in  k_row;
				  address : in  STD_LOGIC_VECTOR(5 downto 0);
				  parity_row_out : out  k_row);
	end component;
	
	component rho_lane_opt
		 Port ( count_reg : in  unsigned(9 downto 0);
				  state_rho_en : out  k_slice);
	end component;
	
	component chi_iota_row
		 Port ( chi_iota_row_in : in  k_row;
				  Rcon : in std_logic;
				  chi_iota_row_out : out  k_row);
	end component;
	
	-- State register
	component state_reg
		 Port ( clk : in  STD_LOGIC;
				  en_slice : in  k_slice;
				  slice_shift : in  STD_LOGIC;
				  pi_shift : in  STD_LOGIC;
				  keccak_in : in  k_row;
				  row_in : in  k_row;
				  first_slice : out  k_slice;
				  last_slice : out  k_slice;
				  row_out : out  k_row);
	end component;
	
	component slice_parity
		 Port ( slice_p_in : in  k_slice;
				  parity_out : out  k_row);
	end component;
	
	----------- Datapath signals ----------
	-- State
	signal state_row_in, state_row_out : k_row;
	signal first_slice, last_slice : k_slice;
	
	--Constant
	signal r_con : std_logic;
	
	--Theta
	signal parity_last_next, parity_last_reg : k_row;
	signal parity_second_last_next, parity_second_last_reg : k_row;
	signal parity_next, parity_reg : k_row;
	signal parity_reg_next, parity_reg_reg : k_row;
	signal parity_saved : k_row;
	signal address_parity : std_logic_vector(5 downto 0);
	signal parity_this, parity_prev, parity_out : k_row; --Choose the stored parity from the last slice to use in the first one
	signal slice_p_in : k_slice;
	signal theta_out : k_row;
	
	--Chi
	signal chi_out : k_row;
	
	----------- Control signals -----------
	-- State shift
	signal slice_shift : std_logic;
	signal pi_shift: std_logic;
	-- "00" : normal row-shift for theta and chi calcs ----
	-- "10" : slice-shift for feeding inputs --------------
	-- "01" : slice-shift with PI wiring ------------------
	-- "11" : slice-shift for RHO, use 'state_rho_en' -----
	
	--Enable state and for rho calculation
	signal state_en, state_rho_en : k_slice; 
	
	--Theta
	signal stop_state_last_parity : std_logic;
	signal we_parity_mem : std_logic;
	
	--Rho
	signal computing_rho : std_logic;
	
	--Pi
	signal computing_pi : std_logic;
	
	--Chi
	signal computing_chi : std_logic;
	
	
	signal count_next, count_reg : unsigned(9 downto 0);
	signal round_next, round_reg : unsigned(4 downto 0);
	
	signal rcon_buf : std_logic_vector(0 to 63);
	
begin

	------------- DATAPATH -------------
	--Output
	keccak_out <= state_row_in when (computing_chi = '1') else (OTHERS => '0');
	
	--State instantiations
	state_regss : state_reg -- PINK
	 Port map( 
		clk => clk,
		en_slice => state_en,
		slice_shift => slice_shift,
		pi_shift => pi_shift,
		keccak_in => keccak_in,
		row_in => state_row_in,
		first_slice => first_slice,
		last_slice => last_slice,
		row_out => state_row_out
	);
	
	state_row_in <= chi_out when (computing_chi = '1') else theta_out;
	
	--Theta
	get_parity_theta_prev : slice_parity
	Port map( 
		slice_p_in => first_slice,
		parity_out => parity_out
	);
	
	parity_next <= parity_out when ((we_parity_mem = '1') or (rst = '1')) else parity_saved;
	parity_reg_next <= parity_reg;
	
	theta_perm : theta_row
	Port map( 
		theta_row_in => state_row_out,
		parity_this => parity_this,
		parity_prev => parity_prev,
		theta_row_out => theta_out
	);
	parity_this <= parity_reg_reg when (we_parity_mem = '1') else 
						parity_last_reg when (count_reg = 63) else
						parity_reg;
	parity_prev <= parity_last_reg when (count_reg = 62) else
						parity_reg when (we_parity_mem = '1') else
						parity_saved;
	--Save the last slice parity until the first one arrives
	parity_last_next <= parity_reg_reg when ((count_reg = 767) or (rst='1')) else parity_last_reg;
	
	--Save the parities
	we_parity_mem <= '1' when ((count_reg >= 0 and count_reg < 63) or (count_reg = 766) or (count_reg = 767) or (count_reg = 765)) else '0';
	address_parity <= std_logic_vector(count_reg(5 downto 0)+1)when (we_parity_mem = '1') else 
							std_logic_vector(count_reg(5 downto 0)+2);
	parities : theta_parity_adresses 
	Port map( 
		clk => clk,
		we => we_parity_mem,
		parity_row_in => parity_reg_reg,
		address => address_parity,
		parity_row_out => parity_saved
	);
	
	--Rho
	rho_perm : rho_lane_opt
	Port map( 
		count_reg => count_reg,
		state_rho_en => state_rho_en
	);
	
	--Chi & Iota
	chi_n_iota_perms : chi_iota_row -- GREEN
	Port map( 
		chi_iota_row_in => state_row_out,
		Rcon => r_con,
		chi_iota_row_out => chi_out
	);
	--Round constant
	r_con <= RC(to_integer(round_reg))(to_integer((count_reg+1) mod 64)) when ((computing_chi = '1') and (count_reg < 511)) else '0';
	rcon_buf <= RC(to_integer(round_reg));
	---------------------------------------
	
	------------- CONTROLPATH -------------
	--Control signals
	slice_shift <= rst or computing_rho;
	pi_shift <= computing_pi or computing_rho;
	state_en <= state_rho_en when (computing_rho = '1') else (others =>(others => ('1')));
	
	--Computing rho
	computing_rho <= '1' when ((count_reg > 318) and (count_reg < 383)) else '0';
	
	--Computing pi
	computing_pi  <= '1' when ((count_reg > 382) and (count_reg < 447)) else '0';
	
	--Computing chi
	computing_chi <= '1' when ((count_reg > 446) and (count_reg <767)) else '0';

	count_next <= (others => '0') when (count_reg = 767) else
					  count_reg + 1;
	round_next <= round_reg + 1 when (count_reg = 767) else
					  round_reg;
	regs_proc: process(clk)
   begin		
      -- hold reset state for 100 ns.
      if rising_edge(clk) then
			parity_reg <= parity_next;
			parity_reg_reg <= parity_reg_next;
			parity_last_reg <= parity_last_next;
			if (rst = '1') then
				count_reg <= (others => '0');
				round_reg <= (others => '0');
			else
				count_reg <= count_next;
				round_reg <= round_next;
			end if;
		end if;
	end process;
	

end Behavioral;

