----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:15:58 02/04/2019 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity comparator is
    Port ( count_reg : in  unsigned (9 downto 0);
           bools0 : out  STD_LOGIC;
           bools1 : out  STD_LOGIC;
           bools2 : out  STD_LOGIC;
           bools3 : out  STD_LOGIC;
           bools4 : out  STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

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
	
	signal msb_20, lsb_10 : std_logic;
	signal msb_11, lsb_11 : std_logic;
	signal msb_12, lsb_12 : std_logic;
	signal msb_13, lsb_13 : std_logic;
	signal msb_14, lsb_14 : std_logic;
	
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
	
---CONTROL	
	signal gr_n_sm_318_383, gr_n_sm_382_447, gr_n_sm_446_767 : std_logic;
	signal gr_n_sm_318_383_2, gr_n_sm_382_447_2, gr_n_sm_446_767_2 : std_logic;
	signal gr_n_sm_318_383_3, gr_n_sm_382_447_3, gr_n_sm_446_767_3 : std_logic;
	signal msb_62, msb_383, not_msb_319, msb_447, msb_767 : std_logic;
	signal not_lsb_62, not_lsb_383, lsb_319 : std_logic;
	signal eq_62, eq_383, eq_319, eq_447, eq_767 : std_logic;
	
begin


	-----------------------------CONTROL-------------------------------
	LUT6_2_inst62 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) and (not I3) and (not I2) and (not I1) and (I0)))) or 
					 (I5 and ((not I4) and (not I3) and (not I2) and (not I1) and (I0))) ) -- Specify LUT Contents
   port map (
      O6 => msb_62,  -- 6/5-LUT output (1-bit)
      O5 => open,  -- 5-LUT output (1-bit)
      I0 => count_reg(5),   -- LUT input (1-bit)
      I1 => count_reg(6),   -- LUT input (1-bit)
      I2 => count_reg(7),   -- LUT input (1-bit)
      I3 => count_reg(8),   -- LUT input (1-bit)
      I4 => count_reg(9),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	--	eq_62 <= msb_62 and not not_lsb_62;	
	LUT6_2_inst622 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) or (not I3) or (not I2) or (not I1) or (I0)))) or 
					 (I5 and ((not I4) or (not I3) or (not I2) or (not I1) or (not I0))) ) -- Specify LUT Contents
   port map (
      O6 => open,  -- 6/5-LUT output (1-bit)
      O5 => not_lsb_62,  -- 5-LUT output (1-bit)
      I0 => count_reg(0),   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(2),   -- LUT input (1-bit)
      I3 => count_reg(3),   -- LUT input (1-bit)
      I4 => count_reg(4),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	calc_62 : AND2B1L 
	port map (DI => msb_62, SRI => not_lsb_62, O => eq_62);
	-------------------------------------------------------------------
	-----------------------------Calc RHO------------------------------
	-------------------------------------------------------------------
	--MSBs
	LUT6_2_inst318 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) and I3 and (not I2) and I1))) or 
					 (I5 and ((not I4) and I3 and I2 and (not I1))) ) -- Specify LUT Contents
   port map (
      O6 => gr_n_sm_382_447,  -- 6/5-LUT output (1-bit)
      O5 => gr_n_sm_318_383,  -- 5-LUT output (1-bit)
      I0 => count_reg(5),   -- LUT input (1-bit)
      I1 => count_reg(6),   -- LUT input (1-bit)
      I2 => count_reg(7),   -- LUT input (1-bit)
      I3 => count_reg(8),   -- LUT input (1-bit)
      I4 => count_reg(9),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
	LUT6_2_inst383 : LUT6_2
   generic map (
      INIT => (((not I5) and ((I4) or (not I3) or (I2) or (I1) or (not I0)))) or 
					 (I5 and ((not I4) and (I3) and (not I2) and (I1) and (I0))) ) -- Specify LUT Contents
   port map (
      O6 => msb_383,  -- 6/5-LUT output (1-bit)
      O5 => not_msb_319,  -- 5-LUT output (1-bit)
      I0 => count_reg(5),   -- LUT input (1-bit)
      I1 => count_reg(6),   -- LUT input (1-bit)
      I2 => count_reg(7),   -- LUT input (1-bit)
      I3 => count_reg(8),   -- LUT input (1-bit)
      I4 => count_reg(9),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
	LUT6_2_inst319 : LUT6_2
   generic map (
      INIT => (((not I5) and ((I4) and (I3) and (I2) and (I1) and (I0)))) or 
					 (I5 and ((not I4) or (not I3) or (not I2) or (not I1) or (not I0))) ) -- Specify LUT Contents
   port map (
      O6 => not_lsb_383,  -- 6/5-LUT output (1-bit)
      O5 => lsb_319,  -- 5-LUT output (1-bit)
      I0 => count_reg(0),   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(2),   -- LUT input (1-bit)
      I3 => count_reg(3),   -- LUT input (1-bit)
      I4 => count_reg(4),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
--	eq_319 <= not not_msb_319 and lsb_319;
	calc_319 : AND2B1L
	port map (DI => lsb_319, SRI => not_msb_319, O => eq_319);

--	eq_383 <= not_msb_383 and not lsb_383;
	calc_383 : AND2B1L
	port map (DI => msb_383, SRI => not_lsb_383, O => eq_383);
	
--	gr_n_sm_318_383_2 <= gr_n_sm_318_383 and (not eq_383);
	calc_gr_n_sm_318_383_2 : AND2B1L
	port map (DI => gr_n_sm_318_383, SRI => eq_383, O => gr_n_sm_318_383_2);
--	gr_n_sm_318_383_3 <= gr_n_sm_318_383_2 or eq_319;
	calc_gr_n_sm_318_383_3 : OR2L
	port map (DI => gr_n_sm_318_383_2, SRI => eq_319, O => gr_n_sm_318_383_3);


	-------------------------------------------------------------------
	---------------------------- Calc PI ------------------------------
	-------------------------------------------------------------------
	LUT6_2_inst447 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) and (I3) and (I2) and (not I1) and (I0)))) or 
					 (I5 and (((I4) or (I3 and I2 and I1)))) ) -- Specify LUT Contents
   port map (
      O6 => gr_n_sm_446_767,  -- 6/5-LUT output (1-bit)
      O5 => msb_447,  -- 5-LUT output (1-bit)
      I0 => count_reg(5),   -- LUT input (1-bit)
      I1 => count_reg(6),   -- LUT input (1-bit)
      I2 => count_reg(7),   -- LUT input (1-bit)
      I3 => count_reg(8),   -- LUT input (1-bit)
      I4 => count_reg(9),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
--	eq_447 <= msb_447 and not lsb_383;
	calc_447 : AND2B1L --!!!!!!!!!!!!!!! Place in the same slice as "calc_383"
	port map (DI => msb_447, SRI => not_lsb_383, O => eq_447);
	
--	gr_n_sm_382_447_2 <= gr_n_sm_382_447 and (not eq_447);
	calc_gr_n_sm_382_447_2 : AND2B1L
	port map (DI => gr_n_sm_382_447, SRI => eq_447, O => gr_n_sm_382_447_2);
--	gr_n_sm_318_383_3 <= gr_n_sm_318_383_2 or eq_383;
	calc_gr_n_sm_382_447_3 : OR2L --????????????? Place in the same slice as "calc_gr_n_sm_318_383_2"
	port map (DI => gr_n_sm_382_447_2, SRI => eq_383, O => gr_n_sm_382_447_3);
	
	
	-------------------------------------------------------------------
	-----------------------------Calc CHI------------------------------
	-------------------------------------------------------------------
	LUT6_2_inst767 : LUT6_2
   generic map (
      INIT => (((not I5) and ((I4) and (not I3) and (I2) and (I1) and (I0)))) or 
					 (I5 and (((not I4) and I3 and I2 and I1) or ((not I3) or I4))) ) -- Specify LUT Contents
   port map (
      O6 => open,  -- 6/5-LUT output (1-bit)
      O5 => msb_767,  -- 5-LUT output (1-bit)
      I0 => count_reg(5),   -- LUT input (1-bit)
      I1 => count_reg(6),   -- LUT input (1-bit)
      I2 => count_reg(7),   -- LUT input (1-bit)
      I3 => count_reg(8),   -- LUT input (1-bit)
      I4 => count_reg(9),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );

--	eq_767 <= msb_767 and not lsb_383;
	calc_767 : AND2B1L --!!!!!!!!!!!!!!! Place in the same slice as "calc_383"
	port map (DI => msb_767, SRI => not_lsb_383, O => eq_767);

--	gr_n_sm_446_767_2 <= gr_n_sm_446_767 and (not eq_767);
	calc_gr_n_sm_446_767_2 : AND2B1L
	port map (DI => gr_n_sm_446_767, SRI => eq_767, O => gr_n_sm_446_767_2);
--	gr_n_sm_446_767_3 <= gr_n_sm_446_767_2 or eq_447;
	calc_gr_n_sm_446_767_3 : OR2L --????????????? Place in the same slice as "calc_gr_n_sm_318_383_2"
	port map (DI => gr_n_sm_446_767_2, SRI => eq_447, O => gr_n_sm_446_767_3);

	
-------------

--	state_rho_en(3)(4) <= '1' when (count_reg < 319 + 8) else '0';
--	state_rho_en(4)(3) <= '1' when (count_reg < 319 + 56) else '0';
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

	
	MUXF7_inst34 : MUXF7
   port map (
      O => bools3,    -- Output of MUX to general routing
      I0 => lsb_34,  -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => msb_12,  -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S => msb_12    -- Input select to MUX
   );
	
	MUXF7_inst43 : MUXF7
   port map (
      O => bools4,    -- Output of MUX to general routing
      I0 => lsb_43,  -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => msb_13,  -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S => msb_13    -- Input select to MUX
   );

--	state_rho_en(3)(3) <= '1' when (count_reg < 319 + 21) else '0';


















--MSBs
	LUT6_1_inst20 : LUT6_2
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
	
	LUT6_1_inst03 : LUT6_2
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

--MSBs
	LUT6_1_inst : LUT6_2
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
end Behavioral;

