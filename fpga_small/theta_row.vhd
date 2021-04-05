----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:44 01/24/2019 
-- Design Name: 
-- Module Name:    theta_row - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity theta_row is
    Port ( theta_row_in : in  k_row;
			  parity_this : in k_row;
			  parity_prev : in k_row;
           theta_row_out : out  k_row
			 );
end theta_row;

architecture Behavioral of theta_row is
	
	attribute BEL : string;
	attribute LOC : string;
	
	attribute BEL of LUT5_inst_0 : label is "B6LUT";
	attribute LOC of LUT5_inst_0 : label is "SLICE_X0Y76";
	
	--   equation-based INIT specification for a LUT6.
   constant I0 : BIT_VECTOR(63 downto 0) := X"AAAAAAAAAAAAAAAA";
   constant I1 : BIT_VECTOR(63 downto 0) := X"CCCCCCCCCCCCCCCC";
   constant I2 : BIT_VECTOR(63 downto 0) := X"F0F0F0F0F0F0F0F0";
   constant I3 : BIT_VECTOR(63 downto 0) := X"FF00FF00FF00FF00";
   constant I4 : BIT_VECTOR(63 downto 0) := X"FFFF0000FFFF0000";
   constant I5 : BIT_VECTOR(63 downto 0) := X"FFFFFFFF00000000";
	--   equation-based INIT specification for a LUT5.
   constant I0_5 : BIT_VECTOR(31 downto 0) := X"AAAAAAAA";
   constant I1_5 : BIT_VECTOR(31 downto 0) := X"CCCCCCCC";
   constant I2_5 : BIT_VECTOR(31 downto 0) := X"F0F0F0F0";
   constant I3_5 : BIT_VECTOR(31 downto 0) := X"FF00FF00";
   constant I4_5 : BIT_VECTOR(31 downto 0) := X"FFFF0000";

begin

--	theta_row_out(0) <= theta_row_in(0) xor parity_this(1) xor parity_prev(4);
--	theta_row_out(1) <= theta_row_in(1) xor parity_this(2) xor parity_prev(0);
--	theta_row_out(2) <= theta_row_in(2) xor parity_this(3) xor parity_prev(1);
--	theta_row_out(3) <= theta_row_in(3) xor parity_this(4) xor parity_prev(2);
--	theta_row_out(4) <= theta_row_in(4) xor parity_this(0) xor parity_prev(3);
	
	--Bit 0
	LUT5_inst_0 : LUT5
   generic map (
      INIT => (I2_5 xor I1_5 xor I0_5)) -- Specify LUT Contents
   port map (
      O => theta_row_out(4),  -- LUT general output
      I0 => parity_prev(0),   -- LUT input
      I1 => parity_this(3),   -- LUT input
      I2 => theta_row_in(4),   -- LUT input
      I3 => '0',   -- LUT input
      I4 => '0'    -- LUT input 
   );
	

	--Bit 1
	LUT5_inst_1 : LUT5
   generic map (
      INIT => (I2_5 xor I1_5 xor I0_5)) -- Specify LUT Contents
   port map (
      O => theta_row_out(3),  -- LUT general output
      I0 => parity_prev(4),   -- LUT input
      I1 => parity_this(2),   -- LUT input
      I2 => theta_row_in(3),   -- LUT input
      I3 => '0',   -- LUT input
      I4 => '0'    -- LUT input 
   );
	--Bit 2
	LUT5_inst_2 : LUT5
   generic map (
      INIT => (I2_5 xor I1_5 xor I0_5)) -- Specify LUT Contents
   port map (
      O => theta_row_out(2),  -- LUT general output
      I0 => parity_prev(3),   -- LUT input
      I1 => parity_this(1),   -- LUT input
      I2 => theta_row_in(2),   -- LUT input
      I3 => '0',   -- LUT input
      I4 => '0'    -- LUT input 
   );
	--Bit 3
	LUT5_inst_3 : LUT6
   generic map (
      INIT => (I2 xor I1 xor I0)) -- Specify LUT Contents
   port map (
      O => theta_row_out(1),  -- LUT general output
      I0 => parity_prev(2),   -- LUT input
      I1 => parity_this(0),   -- LUT input
      I2 => theta_row_in(1),   -- LUT input
      I3 => '0',   -- LUT input
      I4 => '0',    -- LUT input 
      I5 => '0'    -- LUT input 
   );
	--Bit 4
	LUT5_inst_4 : LUT6
   generic map (
      INIT => (I2 xor I1 xor I0)) -- Specify LUT Contents
   port map (
      O => theta_row_out(0),  -- LUT general output
      I0 => parity_prev(1),   -- LUT input
      I1 => parity_this(4),   -- LUT input
      I2 => theta_row_in(0),   -- LUT input
      I3 => '0',   -- LUT input
      I4 => '0',    -- LUT input 
      I5 => '0'    -- LUT input 
   );

end Behavioral;

