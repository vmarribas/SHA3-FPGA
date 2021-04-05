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
	component theta_fpga
		 Port ( clk, rst : in std_logic;
				  count_reg : in  unsigned(9 downto 0);
				  first_slice : in  k_slice;
				  state_row_out : in  k_row;
				  theta_out : out  k_row);
	end component;
	
	component rho_lane
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
	
	
	----------- Datapath signals ----------
	-- State
	signal state_row_in, state_row_out : k_row;
	signal first_slice, last_slice : k_slice;
	
	--Constant
	signal r_con : std_logic;
	
	--Theta
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
	theta_perm : theta_fpga
	Port map( 
		clk => clk, rst => rst,
		count_reg => count_reg,
		first_slice => first_slice,
		state_row_out => state_row_out,
		theta_out => theta_out
	);
	
	--Rho
	rho_perm : rho_lane
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

