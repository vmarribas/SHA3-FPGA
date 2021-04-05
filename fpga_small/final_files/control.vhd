--////////////////////////////////////////////////////////////////////////////////

--// COMPANY:    COSIC, KU Leuven 
--// AUTHOR:     Victor Arribas

--////////////////////////////////////////////////////////////////////////////////

--// BSD 3-Clause License

--// Copyright (c) 2019, Victor Arribas
--// All rights reserved.

--// Redistribution and use in source and binary forms, with or without
--// modification, are permitted provided that the following conditions are met:

--// 1. Redistributions of source code must retain the above copyright notice, this
--//    list of conditions and the following disclaimer.

--// 2. Redistributions in binary form must reproduce the above copyright notice,
--//    this list of conditions and the following disclaimer in the documentation
--//    and/or other materials provided with the distribution.

--// 3. Neither the name of the copyright holder nor the names of its
--//    contributors may be used to endorse or promote products derived from
--//    this software without specific prior written permission.

--// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
--// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
--// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
--// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
--// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
--// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
--// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
--// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
--// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

--////////////////////////////////////////////////////////////////////////////////

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity control is
    Port ( clk : in  STD_LOGIC;
           absorpt : in  STD_LOGIC;
           count_reg_out : out  unsigned(9 downto 0);
           round_reg_out : out  unsigned(4 downto 0);
           slice_shift : out  STD_LOGIC;
           pi_shift : out  STD_LOGIC;
           computing_rho : out  STD_LOGIC;
           computing_pi : out  STD_LOGIC;
           computing_chi : out  STD_LOGIC;
           less_24 : out  STD_LOGIC;
           eq_62_out : out  STD_LOGIC;
           eq_63_out : out  STD_LOGIC;
           eq_765_out : out  STD_LOGIC;
           eq_766_out : out  STD_LOGIC;
           eq_767_out : out  STD_LOGIC
			  );
end control;

architecture Behavioral of control is

	constant I0 : BIT_VECTOR(63 downto 0) := X"AAAAAAAAAAAAAAAA";
   constant I1 : BIT_VECTOR(63 downto 0) := X"CCCCCCCCCCCCCCCC";
   constant I2 : BIT_VECTOR(63 downto 0) := X"F0F0F0F0F0F0F0F0";
   constant I3 : BIT_VECTOR(63 downto 0) := X"FF00FF00FF00FF00";
   constant I4 : BIT_VECTOR(63 downto 0) := X"FFFF0000FFFF0000";
   constant I5 : BIT_VECTOR(63 downto 0) := X"FFFFFFFF00000000";
	
	constant I0_2 : BIT_VECTOR(3 downto 0) := X"A";
   constant I1_2 : BIT_VECTOR(3 downto 0) := X"C";
	--Rho
	signal computing_rho_int : std_logic;
	--Pi
	signal computing_pi_int : std_logic;
	
	signal gr_n_sm_318_383, gr_n_sm_382_447, gr_n_sm_446_767 : std_logic;
	signal gr_n_sm_318_383_2, gr_n_sm_382_447_2, gr_n_sm_446_767_2 : std_logic;
	signal gr_n_sm_318_383_3, gr_n_sm_382_447_3, gr_n_sm_446_767_3 : std_logic;
	signal msb_62, msb_383, msb_319, msb_447, msb_765, msb_767 : std_logic;
	signal not_lsb_62, not_lsb_383, not_lsb_765 : std_logic;
	signal eq_62, eq_63, eq_383, eq_319, eq_447, eq_765, eq_766, eq_767 : std_logic;
	
	signal eq_62_next, eq_62_reg : std_logic;
	signal eq_765_next, eq_765_reg, eq_765_reg_reg : std_logic;
	
--	signal less_24 : std_logic;
	
	signal count_next, count_reg : unsigned(9 downto 0);
	signal round_next, round_reg : unsigned(4 downto 0);
	
	
begin

	-----------------------------CONTROL-------------------------------
	
----	slice_shift <= absorpt or computing_rho_int;
--	or_latch_slice_sh : OR2L
--	port map (DI => absorpt, SRI => computing_rho_int, O => slice_shift);
----	pi_shift <= computing_pi_int or computing_rho_int;
--	or_latch_pi_sh : OR2L
--	port map (DI => computing_pi_int, SRI => computing_rho_int, O => pi_shift);
	LUT6_1_inst_or : LUT6_2
   generic map (
      INIT => (((not I5) and (I0 or I1)) or
		(I5 and (I0 or I2))) ) -- Specify LUT Contents
   port map (
      O6 => pi_shift,  -- 6/5-LUT output (1-bit)
      O5 => slice_shift,  -- 5-LUT output (1-bit)
      I0 => computing_rho_int,   -- LUT input (1-bit)
      I1 => absorpt,   -- LUT input (1-bit)
      I2 => computing_pi_int,   -- LUT input (1-bit)
      I3 => '0',   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	-------------------------------------------------------------------
	-----------------------------Calc THE------------------------------
	-------------------------------------------------------------------
	LUT6_2_inst765 : LUT6_2
   generic map (
      INIT => (((not I5) and ((I4) and (not I3) and (I2) and (I1) and (I0)))) or 
					 (I5 and ((not I4) and (not I3) and (not I2) and (not I1) and (I0))) ) -- Specify LUT Contents
   port map (
      O6 => msb_62,  -- 6/5-LUT output (1-bit)
      O5 => msb_765,  -- 5-LUT output (1-bit)
      I0 => count_reg(5),   -- LUT input (1-bit)
      I1 => count_reg(6),   -- LUT input (1-bit)
      I2 => count_reg(7),   -- LUT input (1-bit)
      I3 => count_reg(8),   -- LUT input (1-bit)
      I4 => count_reg(9),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );

	eq_765_out <= eq_765;
	eq_766_out <= eq_766;
	eq_767_out <= eq_767;
	
	--Regs for next equals states
	eq_765_next <= eq_765;
	eq_766 <= eq_765_reg;
	eq_767 <= eq_765_reg_reg;
	
	
--	eq_62 <= msb_62 and not not_lsb_62;	
	LUT6_2_inst62 : LUT6_2
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
----	eq_765 <= msb_765 and not not_lsb_765;
--	calc_765 : AND2B1L --!!!!!!!!!!!!!!! Place in the same slice as "calc_383"
--	port map (DI => msb_765, SRI => not_lsb_765, O => eq_765);
--	calc_62 : AND2B1L 
--	port map (DI => msb_62, SRI => not_lsb_62, O => eq_62);
	LUT6_1_inst_and : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I0) and I1)) or
		(I5 and ((not I2) and I3))) ) -- Specify LUT Contents
   port map (
      O6 => eq_62,  -- 6/5-LUT output (1-bit)
      O5 => eq_765,  -- 5-LUT output (1-bit)
      I0 => not_lsb_765,   -- LUT input (1-bit)
      I1 => msb_765,   -- LUT input (1-bit)
      I2 => not_lsb_62,   -- LUT input (1-bit)
      I3 => msb_62,   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
	eq_62_next <= eq_62;
	eq_63 <= eq_62_reg;
	
	eq_62_out <= eq_62;
	eq_63_out <= eq_63;
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
      INIT => (((not I5) and ((not I4) and (I3) and (not I2) and (not I1) and (I0)))) or 
					 (I5 and ((not I4) and (I3) and (not I2) and (I1) and (I0))) ) -- Specify LUT Contents
   port map (
      O6 => msb_383,  -- 6/5-LUT output (1-bit)
      O5 => msb_319,  -- 5-LUT output (1-bit)
      I0 => count_reg(5),   -- LUT input (1-bit)
      I1 => count_reg(6),   -- LUT input (1-bit)
      I2 => count_reg(7),   -- LUT input (1-bit)
      I3 => count_reg(8),   -- LUT input (1-bit)
      I4 => count_reg(9),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
	LUT6_2_inst319 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I4) or (not I3) or (not I2) or (I1) or (not I0)))) or 
					 (I5 and ((not I4) or (not I3) or (not I2) or (not I1) or (not I0))) ) -- Specify LUT Contents
   port map (
      O6 => not_lsb_383,  -- 6/5-LUT output (1-bit)
      O5 => not_lsb_765,  -- 5-LUT output (1-bit)
      I0 => count_reg(0),   -- LUT input (1-bit)
      I1 => count_reg(1),   -- LUT input (1-bit)
      I2 => count_reg(2),   -- LUT input (1-bit)
      I3 => count_reg(3),   -- LUT input (1-bit)
      I4 => count_reg(4),   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
----	eq_319 <= not not_msb_319 and lsb_319;
--	calc_319 : AND2B1L --!!!!!!!!!!!!!!! Place in the same slice as "calc_383"
--	port map (DI => msb_319, SRI => not_lsb_383, O => eq_319);
----	eq_383 <= not_msb_383 and not lsb_383;
--	calc_383 : AND2B1L
--	port map (DI => msb_383, SRI => not_lsb_383, O => eq_383);
	LUT6_1_inst_and2 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I0) and I1)) or
		(I5 and ((not I0) and I3))) ) -- Specify LUT Contents
   port map (
      O6 => eq_383,  -- 6/5-LUT output (1-bit)
      O5 => eq_319,  -- 5-LUT output (1-bit)
      I0 => not_lsb_383,   -- LUT input (1-bit)
      I1 => msb_319,   -- LUT input (1-bit)
      I2 => '0',   -- LUT input (1-bit)
      I3 => msb_383,   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
----	gr_n_sm_318_383_2 <= gr_n_sm_318_383 and (not eq_383);
--	calc_gr_n_sm_318_383_2 : AND2B1L
--	port map (DI => gr_n_sm_318_383, SRI => eq_383, O => gr_n_sm_318_383_2);
----	eq_447 <= msb_447 and not lsb_383;
--	calc_447 : AND2B1L --!!!!!!!!!!!!!!! Place in the same slice as "calc_383"
--	port map (DI => msb_447, SRI => not_lsb_383, O => eq_447);
	LUT6_1_inst_and3 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I0) and I1)) or
		(I5 and ((not I2) and I3))) ) -- Specify LUT Contents
   port map (
      O6 => eq_447,  -- 6/5-LUT output (1-bit)
      O5 => gr_n_sm_318_383_2,  -- 5-LUT output (1-bit)
      I0 => eq_383,   -- LUT input (1-bit)
      I1 => gr_n_sm_318_383,   -- LUT input (1-bit)
      I2 => not_lsb_383,   -- LUT input (1-bit)
      I3 => msb_447,   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
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
	
----	gr_n_sm_318_383_3 <= gr_n_sm_318_383_2 or eq_383;
--	calc_gr_n_sm_382_447_3 : OR2L --????????????? Place in the same slice as "calc_gr_n_sm_318_383_2"
--	port map (DI => gr_n_sm_382_447_2, SRI => eq_383, O => gr_n_sm_382_447_3);
----	gr_n_sm_318_383_3 <= gr_n_sm_318_383_2 or eq_319;
--	calc_gr_n_sm_318_383_3 : OR2L
--	port map (DI => gr_n_sm_318_383_2, SRI => eq_319, O => gr_n_sm_318_383_3);
	LUT6_1_inst_or2 : LUT6_2
   generic map (
      INIT => (((not I5) and (I0 or I1)) or
		(I5 and (I3 or I2))) ) -- Specify LUT Contents
   port map (
      O6 => gr_n_sm_318_383_3,  -- 6/5-LUT output (1-bit)
      O5 => gr_n_sm_382_447_3,  -- 5-LUT output (1-bit)
      I0 => eq_383,   -- LUT input (1-bit)
      I1 => gr_n_sm_382_447_2,   -- LUT input (1-bit)
      I2 => eq_319,   -- LUT input (1-bit)
      I3 => gr_n_sm_318_383_2,   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	-------------------------------------------------------------------
	-----------------------------Calc CHI------------------------------
	-------------------------------------------------------------------

----	gr_n_sm_446_767_2 <= gr_n_sm_446_767 and (not eq_767);
--	calc_gr_n_sm_446_767_2 : AND2B1L
--	port map (DI => gr_n_sm_446_767, SRI => eq_767, O => gr_n_sm_446_767_2);
----	gr_n_sm_382_447_2 <= gr_n_sm_382_447 and (not eq_447);
--	calc_gr_n_sm_382_447_2 : AND2B1L
--	port map (DI => gr_n_sm_382_447, SRI => eq_447, O => gr_n_sm_382_447_2);
	LUT6_1_inst_and4 : LUT6_2
   generic map (
      INIT => (((not I5) and ((not I0) and I1)) or
		(I5 and ((not I2) and I3))) ) -- Specify LUT Contents
   port map (
      O6 => gr_n_sm_382_447_2,  -- 6/5-LUT output (1-bit)
      O5 => gr_n_sm_446_767_2,  -- 5-LUT output (1-bit)
      I0 => eq_767,   -- LUT input (1-bit)
      I1 => gr_n_sm_446_767,   -- LUT input (1-bit)
      I2 => eq_447,   -- LUT input (1-bit)
      I3 => gr_n_sm_382_447,   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	
	
--	gr_n_sm_446_767_3 <= gr_n_sm_446_767_2 or eq_447;
	calc_gr_n_sm_446_767_3 : OR2L --????????????? Place in the same slice as "calc_gr_n_sm_318_383_2"
	port map (DI => gr_n_sm_446_767_2, SRI => eq_447, O => gr_n_sm_446_767_3);



	--Computing rho
--	computing_rho_int <= '1' when ((count_reg > 318) and (count_reg < 383)) else '0';
	computing_rho_int <= gr_n_sm_318_383_3;
	computing_rho <= computing_rho_int;
	
	--Computing pi
--	computing_pi_int  <= '1' when ((count_reg > 382) and (count_reg < 447)) else '0';
	computing_pi_int  <= gr_n_sm_382_447_3;
	computing_pi <= computing_pi_int;
	
	--Computing chi
--	computing_chi <= '1' when ((count_reg > 446) and (count_reg <767)) else '0';
	computing_chi <= gr_n_sm_446_767_3;
	
--	LUT2_inst_less24 : LUT2
--   generic map (
--      INIT => ((not I0_2) or (not I1_2)))
--   port map (
--      O => less_24,   -- LUT general output
--      I0 => round_reg(4), -- LUT input
--      I1 => round_reg(3)  -- LUT input
--   );
	less_24 <= (not round_next(4)) or (not round_next(3));
	
	
	count_next <= (others => '0') when (eq_767 = '1') else
					  count_reg + 1;
	round_next <= round_reg + 1 when (eq_767 = '1') else
					  round_reg;
					  
	count_reg_out <= count_reg;
	round_reg_out <= round_reg;
	
	regs_proc: process(clk)
   begin		
      -- hold reset state for 100 ns.
      if rising_edge(clk) then
			if (absorpt = '1') then
				count_reg <= (others => '0');
				round_reg <= (others => '0');
			else
				count_reg <= count_next;
				round_reg <= round_next;
			end if;
			eq_62_reg <= eq_62_next;
			eq_765_reg <= eq_765_next;
			eq_765_reg_reg <= eq_765_reg;
		end if;
	end process;

end Behavioral;

