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
library UNISIM;
use UNISIM.VComponents.all;

entity keccak_fsm is
    Port ( keccak_in : in  k_row;
			  clk, rst : in  STD_LOGIC;
           absorpt : in  STD_LOGIC;
           keccak_out : out  k_row
           );
end keccak_fsm;

architecture Behavioral of keccak_fsm is

	constant I0 : BIT_VECTOR(63 downto 0) := X"AAAAAAAAAAAAAAAA";
   constant I1 : BIT_VECTOR(63 downto 0) := X"CCCCCCCCCCCCCCCC";
   constant I2 : BIT_VECTOR(63 downto 0) := X"F0F0F0F0F0F0F0F0";
   constant I3 : BIT_VECTOR(63 downto 0) := X"FF00FF00FF00FF00";
   constant I4 : BIT_VECTOR(63 downto 0) := X"FFFF0000FFFF0000";
   constant I5 : BIT_VECTOR(63 downto 0) := X"FFFFFFFF00000000";

	--Permutations modules
	component theta_fpga
		 Port ( clk, absorpt : in std_logic;
				  count_reg : in  unsigned(5 downto 0);
				  first_slice : in  k_slice;
				  state_row_out : in  k_row;
				  eq_62 : in  std_logic;
				  eq_63 : in  std_logic;
				  sm_64 : in  std_logic;
				  eq_765 : in  std_logic;
				  eq_766 : in  std_logic;
				  eq_767 : in  std_logic;
				  theta_out : out  k_row);
	end component;
	
	component rho_lane_opt
		 Port ( count_reg : in  unsigned(9 downto 0);
				  state_rho_en : out  k_slice;
				  sm_64 : out std_logic);
	end component;
	
	component chi_iota_row
		 Port ( chi_iota_row_in : in  k_row;
				  Rcon : in std_logic;
				  chi_iota_row_out : out  k_row);
	end component;
	
	-- State register
	component state_reg
		 Port ( clk, rst, absorpt : in  STD_LOGIC;
				  en_slice : in  k_slice;
				  slice_shift : in  STD_LOGIC;
				  pi_shift : in  STD_LOGIC;
				  keccak_in : in  k_row;
				  row_in : in  k_row;
				  first_slice : out  k_slice;
				  last_slice : out  k_slice;
				  row_out : out  k_row);
	end component;
	
	component control
		Port (clk : in  STD_LOGIC;
				absorpt : in  STD_LOGIC;
				count_reg_out : out  unsigned(9 downto 0);
				round_reg_out : out  unsigned(4 downto 0);
				slice_shift : out  STD_LOGIC;
				pi_shift : out  STD_LOGIC;
				computing_rho : out  STD_LOGIC;
				computing_pi : out  STD_LOGIC;
				computing_chi : out  STD_LOGIC;
            eq_62_out : out  STD_LOGIC;
            eq_63_out : out  STD_LOGIC;
            eq_765_out : out  STD_LOGIC;
            eq_766_out : out  STD_LOGIC;
            eq_767_out : out  STD_LOGIC
				);
	end component;
	
	component state_en_mux
		 Port ( state_rho_en : in  k_slice;
				  computing_rho : in  STD_LOGIC;
				  computing_chi : in  STD_LOGIC;
				  chi_out_4 : in  STD_LOGIC;
				  keccak_out_4 : out  STD_LOGIC;
				  state_en : out  k_slice);
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
	
	signal eq_62, eq_63, sm_64, eq_765, eq_766, eq_767 : std_logic;
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
	
	signal rcon_buf : std_logic_vector(0 to 63);
	
	signal count_reg : unsigned(9 downto 0);
	signal round_reg : unsigned(4 downto 0);
	
begin

	------------- DATAPATH -------------
	--Output
--	keccak_out <= state_row_in when (computing_chi = '1') else (OTHERS => '0');
	LUT6_2_keccak_out01 : LUT6_2
   generic map (
      INIT => (((not I5) and (I0 and I1))) or 
					 (I5 and (I0 and I2)) ) -- Specify LUT Contents
   port map (
      O6 => keccak_out(1),  -- 6/5-LUT output (1-bit)
      O5 => keccak_out(0),  -- 5-LUT output (1-bit)
      I0 => computing_chi,   -- LUT input (1-bit)
      I1 => chi_out(0),   -- LUT input (1-bit)
      I2 => chi_out(1),   -- LUT input (1-bit)
      I3 => '0',   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	LUT6_2_keccak_out23 : LUT6_2
   generic map (
      INIT => (((not I5) and (I0 and I1))) or 
					 (I5 and (I0 and I2)) ) -- Specify LUT Contents
   port map (
      O6 => keccak_out(3),  -- 6/5-LUT output (1-bit)
      O5 => keccak_out(2),  -- 5-LUT output (1-bit)
      I0 => computing_chi,   -- LUT input (1-bit)
      I1 => chi_out(2),   -- LUT input (1-bit)
      I2 => chi_out(3),   -- LUT input (1-bit)
      I3 => '0',   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	keccak_out(4) <= chi_out(4) and computing_chi;
	
	
	--State instantiations
	state_regss : state_reg -- PINK
	 Port map( 
		clk => clk,
		rst => rst,
		absorpt => absorpt,
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
		clk => clk, absorpt => absorpt,
		count_reg => count_reg(5 downto 0),
		first_slice => first_slice,
		state_row_out => state_row_out,
		eq_62 => eq_62,
		eq_63 => eq_63,
		sm_64 => sm_64,
		eq_765 => eq_765,
		eq_766 => eq_766,
		eq_767 => eq_767,
		theta_out => theta_out
	);
	
	--Rho
	rho_perm : rho_lane_opt
	Port map( 
		count_reg => count_reg,
		sm_64 => sm_64,
		state_rho_en => state_rho_en
	);
	
	state_en <= state_rho_en when (computing_rho = '1') else (others =>(others => ('1'))); -- <=> state_rho_en or (not computing_rho)

	--Chi & Iota
	chi_n_iota_perms : chi_iota_row -- GREEN
	Port map( 
		chi_iota_row_in => state_row_out,
		Rcon => r_con,
		chi_iota_row_out => chi_out
	);
	--Round constant
	r_con <= RC(to_integer(round_reg))(to_integer((count_reg+1) mod 64)) when ((computing_chi = '1') and (count_reg < 511)) else '0';
--	rcon_buf <= RC(to_integer(round_reg));
	---------------------------------------
	
	------------- CONTROLPATH -------------
	control_mod : control
	Port map(
		clk => clk,
		absorpt => absorpt,
		count_reg_out => count_reg,
		round_reg_out => round_reg,
		slice_shift => slice_shift,
		pi_shift => pi_shift,
		computing_rho => computing_rho,
		computing_pi => computing_pi,
		computing_chi => computing_chi,
		eq_62_out => eq_62,
		eq_63_out => eq_63,
		eq_765_out => eq_765,
		eq_766_out => eq_766,
		eq_767_out => eq_767
	);

end Behavioral;

