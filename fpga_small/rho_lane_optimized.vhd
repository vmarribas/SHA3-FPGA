----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:44:28 02/01/2019 
-- Design Name: 
-- Module Name:    rho_lane - Behavioral 
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

-- Uncomment the followinC library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
library work;
use work.keccak_globals.all;
-- Uncomment the followinC library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity rho_lane_opt is
    Port ( count_reg : in  unsigned(9 downto 0);
           state_rho_en : out  k_slice;
			  sm_64 : out std_logic);
end rho_lane_opt;

architecture Behavioral of rho_lane_opt is
	
	constant I0 : BIT_VECTOR(63 downto 0) := X"AAAAAAAAAAAAAAAA";
   constant I1 : BIT_VECTOR(63 downto 0) := X"CCCCCCCCCCCCCCCC";
   constant I2 : BIT_VECTOR(63 downto 0) := X"F0F0F0F0F0F0F0F0";
   constant I3 : BIT_VECTOR(63 downto 0) := X"FF00FF00FF00FF00";
   constant I4 : BIT_VECTOR(63 downto 0) := X"FFFF0000FFFF0000";
   constant I5 : BIT_VECTOR(63 downto 0) := X"FFFFFFFF00000000";
	
	signal msb_00, lsb_00 : std_logic;
	signal msb_01, lsb_01 : std_logic;
	signal msb_02, lsb_02 : std_logic;
	signal msb_03, lsb_03 : std_logic;
	signal msb_04, lsb_04 : std_logic;
	
	signal msb_10, msb_10_good, lsb_10 : std_logic;
	signal msb_11, lsb_11 : std_logic;
	signal msb_12, lsb_12 : std_logic;
	signal msb_13, lsb_13 : std_logic;
	signal msb_14, lsb_14 : std_logic;
	
	signal msb_20, lsb_20 : std_logic;
	signal msb_21, lsb_21 : std_logic;
	signal msb_22, lsb_22 : std_logic;
	signal msb_23, lsb_23 : std_logic;
	signal msb_24, lsb_24 : std_logic;
	
	signal msb_30, lsb_30 : std_logic;
	signal msb_31, lsb_31 : std_logic;
	signal msb_32, lsb_32 : std_logic;
	signal msb_33, lsb_33 : std_logic;
	signal msb_34, lsb_34 : std_logic;
	
	signal msb_40, lsb_40 : std_logic;
	signal msb_41, lsb_41 : std_logic;
	signal msb_42, lsb_42 : std_logic;
	signal msb_43, lsb_43 : std_logic;
	signal msb_44, lsb_44 : std_logic;
	
--	signal sm_63 : std_logic;

begin

-------------------------OR2L gates--------------------------------
	state_rho_en(0)(0) <= '0';
--	state_rho_en(0)(2) <= lsb_02 or msb_02;--
--	state_rho_en(0)(3) <= lsb_03 or msb_03;--
--	state_rho_en(0)(4) <= lsb_04 or msb_03;--
--	
--	state_rho_en(1)(0) <= msb_10_good or lsb_10;--
--	state_rho_en(1)(1) <= msb_11 or lsb_11;	--
--	state_rho_en(1)(2) <= msb_12 or lsb_12;--
--	state_rho_en(1)(3) <= msb_13 or lsb_13;--
--	state_rho_en(1)(4) <= msb_14 or lsb_14;--	
--	
--	state_rho_en(2)(0) <= lsb_20 or msb_20;--
--	state_rho_en(2)(1) <= lsb_21 or msb_21;--
--	state_rho_en(2)(2) <= msb_11 or lsb_22;--
--	state_rho_en(2)(3) <= msb_03;
--	state_rho_en(2)(4) <= lsb_24 or msb_24;
--	
--	state_rho_en(3)(0) <= msb_11;
--	state_rho_en(3)(1) <= msb_31;
--	state_rho_en(3)(2) <= msb_10 or lsb_32;--
--	state_rho_en(3)(3) <= msb_33;
--	state_rho_en(3)(4) <= msb_12 or lsb_34;--
--	
--	state_rho_en(4)(0) <= msb_14 or lsb_40;--
--	state_rho_en(4)(1) <= msb_20 or lsb_41;--
--	state_rho_en(4)(2) <= msb_02;	
--	state_rho_en(4)(3) <= msb_13 or lsb_43;--
--	state_rho_en(4)(4) <= msb_10 or lsb_44;
	
--	state_rho_en(0)(2) <= lsb_02 or msb_02;
	or_latch02 : OR2L
	port map (DI => lsb_02, SRI => msb_02, O => state_rho_en(0)(2));
	
--	state_rho_en(0)(3) <= lsb_03 or msb_03;
	or_latch03 : OR2L
	port map (DI => lsb_03, SRI => msb_03, O => state_rho_en(0)(3));
	
--	state_rho_en(0)(4) <= lsb_04 or msb_03;
	or_latch04 : OR2L
	port map (DI => lsb_04, SRI => msb_03, O => state_rho_en(0)(4));
	
--	state_rho_en(1)(0) <= msb_10_good or lsb_10;
	or_latch10 : OR2L
	port map (DI => lsb_10, SRI => msb_10_good, O => state_rho_en(1)(0));
	
--	state_rho_en(1)(1) <= msb_11 or lsb_11;	
	or_latch11 : OR2L
	port map (DI => lsb_11, SRI => msb_11, O => state_rho_en(1)(1));
	
--	state_rho_en(1)(2) <= msb_12 or lsb_12;
	or_latch12 : OR2L
	port map (DI => lsb_12, SRI => msb_12, O => state_rho_en(1)(2));
	
--	state_rho_en(1)(3) <= msb_13 or lsb_13;
	or_latch13 : OR2L
	port map (DI => lsb_13, SRI => msb_13, O => state_rho_en(1)(3));
	
--	state_rho_en(1)(4) <= msb_14 or lsb_14;	
	or_latch14 : OR2L
	port map (DI => lsb_14, SRI => msb_14, O => state_rho_en(1)(4));
	
--	state_rho_en(2)(0) <= lsb_20 or msb_20;
	or_latch20 : OR2L
	port map (DI => lsb_20, SRI => msb_20, O => state_rho_en(2)(0));
	
--	state_rho_en(2)(1) <= lsb_21 or msb_21;
	or_latch21 : OR2L
	port map (DI => lsb_21, SRI => msb_21, O => state_rho_en(2)(1));
	
--	state_rho_en(2)(2) <= msb_11 or lsb_22;
	or_latch22 : OR2L
	port map (DI => lsb_22, SRI => msb_11, O => state_rho_en(2)(2));
	
	state_rho_en(2)(3) <= msb_03;
--	state_rho_en(2)(4) <= lsb_24 or msb_24;
	or_latch24 : OR2L
	port map (DI => lsb_24, SRI => msb_24, O => state_rho_en(2)(4));
		
	state_rho_en(3)(0) <= msb_11;
	state_rho_en(3)(1) <= msb_31;
--	state_rho_en(3)(2) <= msb_10 or lsb_32;
	or_latch32 : OR2L
	port map (DI => lsb_32, SRI => msb_10, O => state_rho_en(3)(2));
	
	state_rho_en(3)(3) <= msb_33;
--	state_rho_en(3)(4) <= msb_12 or lsb_34;
	or_latch34 : OR2L
	port map (DI => lsb_34, SRI => msb_12, O => state_rho_en(3)(4));
	
--	state_rho_en(4)(0) <= msb_14 or lsb_40;
	or_latch40 : OR2L
	port map (DI => lsb_40, SRI => msb_14, O => state_rho_en(4)(0));
	
--	state_rho_en(4)(1) <= msb_20 or lsb_41;
	or_latch41 : OR2L
	port map (DI => lsb_41, SRI => msb_20, O => state_rho_en(4)(1));
	
	state_rho_en(4)(2) <= msb_02;	
--	state_rho_en(4)(3) <= msb_13 or lsb_43;
	or_latch43 : OR2L
	port map (DI => lsb_43, SRI => msb_13, O => state_rho_en(4)(3));
	
--	state_rho_en(4)(4) <= msb_10 or lsb_44;
	or_latch44 : OR2L
	port map (DI => lsb_44, SRI => msb_10, O => state_rho_en(4)(4));
	
	
---------------------------Plane 0---------------------------------
	
--	state_rho_en(0)(1) <= '1' when (count_reC = 319) else '0';
--	state_rho_en(0)(2) <= '1' when (count_reC < 381) else '0';
--	state_rho_en(0)(3) <= '1' when (count_reC < 347) else '0';
--	state_rho_en(0)(4) <= '1' when (count_reC < 346) else '0';

	--MSBs
	LUT6_1_inst : LUT6_2
   generic map (
      INIT => ((not I5) and ((not I4) or (not I3) or (not I2) or (not I1) or (not I0))) or 
		(I5 and ((not I4) or ((not I3) and (not I2)) or ((not I3) and (not I1)))) ) -- Specify LUT Contents
   port map (
      O6 => msb_03,  -- 6/5-LUT output (1-bit)
      O5 => msb_02,  -- 5-LUT output (1-bit)
      I0 => count_reg(2),   -- LUT input (1-bit)
      I1 => count_reg(3),   -- LUT input (1-bit)
      I2 => count_reg(4),   -- LUT input (1-bit)
      I3 => count_reg(5),   -- LUT input (1-bit)
      I4 => count_reg(6),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	--LSBs
	LUT6_2_inst : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I1) and (not I0))) or (I5 and ((not I3) and ((not I2) and ((not I1) or (not I0)))))) ) -- Specify LUT Contents
   port map (
      O6 => lsb_03,  -- 6/5-LUT output (1-bit)
      O5 => lsb_02,  -- 5-LUT output (1-bit)
      I0 => count_reg(0),   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(2),   -- LUT input (1-bit)
      I3 => count_reg(5),   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );

	--LSBs
	LUT6_3_inst : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I2) and (not I1) and (not I0))) or (I5 and (not I3))) ) -- Specify LUT Contents
   port map (
      O6 => state_rho_en(0)(1),  -- 6/5-LUT output (1-bit)
      O5 => lsb_04,  -- 5-LUT output (1-bit)
      I0 => count_reg(1),   -- LUT input (1-bit)
      I1 => count_reg(2),   -- LUT input (1-bit)
      I2 => count_reg(5),   -- LUT input (1-bit)
      I3 => count_reg(6),   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
---------------------------Plane 1---------------------------------
--	state_rho_en(1)(0) <= '1' when (count_reC < 319 + 36) else '0';
--	state_rho_en(1)(1) <= '1' when (count_reC < 319 + 44) else '0';
	--MSBs
	LUT6_1_inst11 : LUT6_2
	generic map (
		INIT => ((not I5) and ((not I4) or ((not I3) and (not I2) and (not I1)) or ((not I3) and (not I2) and (not I0)))) or 
					(I5 and ((not I4) or (not I3) or ((not I2) and (not I1)))) ) -- Specify LUT Contents
	port map (
		O6 => msb_11,  -- 6/5-LUT output (1-bit)
		O5 => msb_10,  -- 5-LUT output (1-bit)
		I0 => count_reg(2),   -- LUT input (1-bit)
		I1 => count_reg(3),   -- LUT input (1-bit)
		I2 => count_reg(4),   -- LUT input (1-bit)
		I3 => count_reg(5),   -- LUT input (1-bit)
		I4 => count_reg(6),   -- LUT input (1-bit)
		I5 => '1'    -- LUT input (1-bit)
	);
	--LSBs
	LUT6_2_inst10 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) and (not I2) and ((not I3) and ((not I1) or (not I0))))) or 
					 (I5 and ((not I3) and ((not I2) and ((not I1) or (not I0)))))) ) -- Specify LUT Contents
   port map (
      O6 => lsb_11,  -- 6/5-LUT output (1-bit)
      O5 => lsb_10,  -- 5-LUT output (1-bit)
      I0 => count_reg(0),   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(2),   -- LUT input (1-bit)
      I3 => count_reg(4),   -- LUT input (1-bit)
      I4 => count_reg(3),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
--	msb_10_good <= (not count_reg(5)) or (not count_reg(6));
	LUT6_1_inst10_good : LUT6_2
   generic map (
      INIT => ((not I5) and ((not I0) or (not I1))) or 
					(I5 and ((not I4) and (not I3) and (not I2) and (not I1))) ) -- Specify LUT Contents
   port map (
      O6 => sm_64,  -- 6/5-LUT output (1-bit)
      O5 => msb_10_good,  -- 5-LUT output (1-bit)
      I0 => count_reg(5),   -- LUT input (1-bit)
      I1 => count_reg(6),   -- LUT input (1-bit)
      I2 => count_reg(7),   -- LUT input (1-bit)
      I3 => count_reg(8),   -- LUT input (1-bit)
      I4 => count_reg(9),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
--	state_rho_en(1)(2) <= '1' when (count_reC < 319 + 6) else '0';
--	state_rho_en(1)(3) <= '1' when (count_reC < 319 + 55) else '0';
	
--MSBs
	LUT6_1_inst13 : LUT6_2
   generic map (
      INIT => ((not I5) and ((not I4) or ((not I3) and (not I2) and (not I1) and (not I0)))) or 
					(I5 and ((not I4) or (not I3) or (not I2) or ((not I1) and (not I0)))) ) -- Specify LUT Contents
   port map (
      O6 => msb_13,  -- 6/5-LUT output (1-bit)
      O5 => msb_12,  -- 5-LUT output (1-bit)
      I0 => count_reg(2),   -- LUT input (1-bit)
      I1 => count_reg(3),   -- LUT input (1-bit)
      I2 => count_reg(4),   -- LUT input (1-bit)
      I3 => count_reg(5),   -- LUT input (1-bit)
      I4 => count_reg(6),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	--LMSBs
	LUT6_2_inst33 : LUT6_2
   generic map (
      INIT => (((not I5) and (I4 or ((not I3) and (not I2) and (not I1))))) or 
					 (I5 and ((not I2) and (not I0))) ) -- Specify LUT Contents
   port map (
      O6 => lsb_13,  -- 6/5-LUT output (1-bit)
      O5 => msb_33,  -- 5-LUT output (1-bit)
      I0 => count_reg(1),   -- LUT input (1-bit)
      I1 => count_reg(2),   -- LUT input (1-bit)
      I2 => count_reg(3),   -- LUT input (1-bit)
      I3 => count_reg(5),   -- LUT input (1-bit)
      I4 => msb_14,   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
	--LSB
	LUT6_2_inst44 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I3) and (not I4) and ((not I1) and (not I0))))) or 
					 (I5 and ((not I4) and (not I3) and (not I2) and (not I1) and (not I0))) ) -- Specify LUT Contents
   port map (
      O6 => lsb_12,  -- 6/5-LUT output (1-bit)
      O5 => lsb_44,  -- 5-LUT output (1-bit)
      I0 => count_reg(0),   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(3),   -- LUT input (1-bit)
      I3 => count_reg(4),   -- LUT input (1-bit)
      I4 => count_reg(5),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
		
---------------------------Plane 1 & 2--------------------------------
	LUT6_1_inst14 : LUT6_2
   generic map (
      INIT => ((not I5) and ((not I4) or ((not I3) and (not I2)))) or 
					(I5 and (not I4)) ) -- Specify LUT Contents
   port map (
      O6 => msb_20,  -- 6/5-LUT output (1-bit)
      O5 => msb_14,  -- 5-LUT output (1-bit)
      I0 => count_reg(2),   -- LUT input (1-bit)
      I1 => count_reg(3),   -- LUT input (1-bit)
      I2 => count_reg(4),   -- LUT input (1-bit)
      I3 => count_reg(5),   -- LUT input (1-bit)
      I4 => count_reg(6),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
--------------------------- Plane 2 ----------------------------------
--	state_rho_en(2)(1) <= '1' when (count_reC < 319 + 10) else '0';
--	state_rho_en(2)(2) <= '1' when (count_reC < 319 + 43) else '0';
--	state_rho_en(2)(3) <= '1' when (count_reC < 319 + 25) else '0';
-- state_rho_en(2)(4) <= '1' when (count_reC < 319 + 39) else '0';
		
	--MSBs
	LUT6_1_inst21 : LUT6_2
   generic map (
      INIT => ((not I5) and ((not I4) or ((not I3) and (not I2) and (not I1)))) or 
					(I5 and ((not I4) or (not I3) or ((not I0) and (not I2) and (not I1)))) ) -- Specify LUT Contents
   port map (
      O6 => msb_24,  -- 6/5-LUT output (1-bit)
      O5 => msb_21,  -- 5-LUT output (1-bit)
      I0 => count_reg(2),   -- LUT input (1-bit)
      I1 => count_reg(3),   -- LUT input (1-bit)
      I2 => count_reg(4),   -- LUT input (1-bit)
      I3 => count_reg(5),   -- LUT input (1-bit)
      I4 => count_reg(6),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );

	--LSBs
	LUT6_2_inst24 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) and (not I3) and (not I2) and (not I1) and (not I0)))) or 
					 (I5 and ((not I3) and (not I2) and (not I0))) ) -- Specify LUT Contents
   port map (
      O6 => lsb_24,  -- 6/5-LUT output (1-bit)
      O5 => lsb_20,  -- 5-LUT output (1-bit)
      I0 => count_reg(1),   -- LUT input (1-bit)
      I1 => count_reg(2),   -- LUT input (1-bit)
      I2 => count_reg(3),   -- LUT input (1-bit)
      I3 => count_reg(4),   -- LUT input (1-bit)
      I4 => count_reg(5),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );

	
	--LSBs
	LUT6_2_inst22 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) and (not I3) and (not I2) and (not I1) and (not I0)))) or 
					 (I5 and ((not I3) and (not I2) and (not I1))) ) -- Specify LUT Contents
   port map (
      O6 => lsb_22,  -- 6/5-LUT output (1-bit)
      O5 => lsb_21,  -- 5-LUT output (1-bit)
      I0 => count_reg(0),   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(2),   -- LUT input (1-bit)
      I3 => count_reg(4),   -- LUT input (1-bit)
      I4 => count_reg(5),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );

--------------------------- Plane 3 ----------------------------------
--	state_rho_en(3)(1) <= '1' when (count_reC < 319 + 45) else '0';
--	state_rho_en(3)(2) <= '1' when (count_reC < 319 + 15) else '0';
	--LSBs
	LUT6_2_inst31 : LUT6_2
   generic map (
      INIT => (((not I5) and (I0 or ((not I3) and (not I2))))) or 
					 (I5 and ((not I3) and (not I4) and (not I1))) ) -- Specify LUT Contents
   port map (
      O6 => lsb_32,  -- 6/5-LUT output (1-bit)
      O5 => msb_31,  -- 5-LUT output (1-bit)
      I0 => msb_11,   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(2),   -- LUT input (1-bit)
      I3 => count_reg(4),   -- LUT input (1-bit)
      I4 => count_reg(5),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );

---------------------------Plane 1 & 4--------------------------------
--	state_rho_en(4)(0) <= '1' when (count_reC < 319 + 18) else '0';
	--LSBs
	LUT6_2_inst14 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) and (not I3) and (not I2) and ((not I1) or (not I0))))) or 
					 (I5 and ((not I4) and (not I3) and (not I2) and ((not I1) and (not I0)))) ) -- Specify LUT Contents
   port map (
      O6 => lsb_40,  -- 6/5-LUT output (1-bit)
      O5 => lsb_14,  -- 5-LUT output (1-bit)
      I0 => count_reg(0),   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(2),   -- LUT input (1-bit)
      I3 => count_reg(3),   -- LUT input (1-bit)
      I4 => count_reg(5),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );

--------------------------- Plane 4 ----------------------------------
--	state_rho_en(4)(1) <= '1' when (count_reC < 319 + 2) else '0';
	--LSBs
	LUT6_inst41 : LUT6
   generic map (
      INIT => ((not I0) and (not I1) and (not I2) and (not I3) and (not I4) and (not I5)) ) -- Specify LUT Contents
   port map (
      O => lsb_41,  -- LUT general output
      I0 => count_reg(0),   -- LUT input
      I1 => count_reg(1),   -- LUT input
      I2 => count_reg(2),   -- LUT input
      I3 => count_reg(3),   -- LUT input
      I4 => count_reg(4),   -- LUT input
      I5 => count_reg(5)    -- LUT input 
   );

--	state_rho_en(3)(4) <= '1' when (count_reC < 319 + 8) else '0';
--	state_rho_en(4)(3) <= '1' when (count_reC < 319 + 56) else '0';
	--LSBs
	LUT6_2_inst34 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) and (not I3) and (not I2) and ((not I1) or (not I0))))) or 
					 (I5 and ((not I2) and((not I1) or (not I0)))) ) -- Specify LUT Contents
   port map (
      O6 => lsb_43,  -- 6/5-LUT output (1-bit)
      O5 => lsb_34,  -- 5-LUT output (1-bit)
      I0 => count_reg(0),   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(3),   -- LUT input (1-bit)
      I3 => count_reg(4),   -- LUT input (1-bit)
      I4 => count_reg(5),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );	

end Behavioral;

