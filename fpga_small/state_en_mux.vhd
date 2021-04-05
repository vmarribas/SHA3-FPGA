----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:37 02/11/2019 
-- Design Name: 
-- Module Name:    state_en_mux - Behavioral 
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
library work;
use work.keccak_globals.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity state_en_mux is
    Port ( state_rho_en : in  k_slice;
           computing_rho : in  STD_LOGIC;
           computing_chi : in  STD_LOGIC;
           chi_out_4 : in  STD_LOGIC;
           keccak_out_4 : out  STD_LOGIC;
           state_en : out  k_slice);
end state_en_mux;

architecture Behavioral of state_en_mux is
	
	constant I0 : BIT_VECTOR(63 downto 0) := X"AAAAAAAAAAAAAAAA";
   constant I1 : BIT_VECTOR(63 downto 0) := X"CCCCCCCCCCCCCCCC";
   constant I2 : BIT_VECTOR(63 downto 0) := X"F0F0F0F0F0F0F0F0";
   constant I3 : BIT_VECTOR(63 downto 0) := X"FF00FF00FF00FF00";
   constant I4 : BIT_VECTOR(63 downto 0) := X"FFFF0000FFFF0000";
   constant I5 : BIT_VECTOR(63 downto 0) := X"FFFFFFFF00000000";

begin
	
	LUT6_2_state_en00 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(0)(1),  -- 6/5-LUT output (1-bit)
		O5 => state_en(0)(0),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(0)(0),   -- LUT input (1-bit)
		I2 => state_rho_en(0)(1),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en02 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(0)(3),  -- 6/5-LUT output (1-bit)
		O5 => state_en(0)(2),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(0)(2),   -- LUT input (1-bit)
		I2 => state_rho_en(0)(3),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en04 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(1)(0),  -- 6/5-LUT output (1-bit)
		O5 => state_en(0)(4),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(0)(4),   -- LUT input (1-bit)
		I2 => state_rho_en(1)(0),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en11 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(1)(2),  -- 6/5-LUT output (1-bit)
		O5 => state_en(1)(1),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(1)(1),   -- LUT input (1-bit)
		I2 => state_rho_en(1)(2),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en13 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(1)(4),  -- 6/5-LUT output (1-bit)
		O5 => state_en(1)(3),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(1)(3),   -- LUT input (1-bit)
		I2 => state_rho_en(1)(4),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en20 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(2)(1),  -- 6/5-LUT output (1-bit)
		O5 => state_en(2)(0),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(2)(0),   -- LUT input (1-bit)
		I2 => state_rho_en(2)(1),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en22 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(2)(3),  -- 6/5-LUT output (1-bit)
		O5 => state_en(2)(2),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(2)(2),   -- LUT input (1-bit)
		I2 => state_rho_en(2)(3),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en24 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(3)(0),  -- 6/5-LUT output (1-bit)
		O5 => state_en(2)(4),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(2)(4),   -- LUT input (1-bit)
		I2 => state_rho_en(3)(0),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en31 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(3)(2),  -- 6/5-LUT output (1-bit)
		O5 => state_en(3)(1),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(3)(1),   -- LUT input (1-bit)
		I2 => state_rho_en(3)(2),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en33 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(3)(4),  -- 6/5-LUT output (1-bit)
		O5 => state_en(3)(3),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(3)(3),   -- LUT input (1-bit)
		I2 => state_rho_en(3)(4),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en40 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(4)(1),  -- 6/5-LUT output (1-bit)
		O5 => state_en(4)(0),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(4)(0),   -- LUT input (1-bit)
		I2 => state_rho_en(4)(1),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en42 : LUT6_2
	generic map (
		INIT => (((not I5) and (I1 or (not I0)))) or 
					 (I5 and (I2 or (not I0))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(4)(3),  -- 6/5-LUT output (1-bit)
		O5 => state_en(4)(2),  -- 5-LUT output (1-bit)
		I0 => computing_rho,   -- LUT input (1-bit)
		I1 => state_rho_en(4)(2),   -- LUT input (1-bit)
		I2 => state_rho_en(4)(3),   -- LUT input (1-bit)
		I3 => '0',   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	LUT6_2_state_en44 : LUT6_2
	generic map (
		INIT => (((not I5) and (I0 and I1))) or 
					 (I5 and (I3 or (not I2))) ) -- Specify LUT Contents
	port map (
		O6 => state_en(4)(4),  -- 6/5-LUT output (1-bit)
		O5 => keccak_out_4,  -- 5-LUT output (1-bit)
		I0 => computing_chi,   -- LUT input (1-bit)
		I1 => chi_out_4,   -- LUT input (1-bit)
		I2 => computing_rho,   -- LUT input (1-bit)
		I3 => state_rho_en(4)(4),   -- LUT input (1-bit)
		I4 => '0',   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);

end Behavioral;

