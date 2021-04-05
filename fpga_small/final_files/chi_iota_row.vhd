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

entity chi_iota_row is
    Port ( chi_iota_row_in : in  k_row;
			  Rcon : in std_logic;
           chi_iota_row_out : out  k_row);
end chi_iota_row;

architecture Behavioral of chi_iota_row is

	--   equation-based INIT specification for a LUT6.
   constant I0_6 : BIT_VECTOR(63 downto 0) := X"AAAAAAAAAAAAAAAA";
   constant I1_6 : BIT_VECTOR(63 downto 0) := X"CCCCCCCCCCCCCCCC";
   constant I2_6 : BIT_VECTOR(63 downto 0) := X"F0F0F0F0F0F0F0F0";
   constant I3_6 : BIT_VECTOR(63 downto 0) := X"FF00FF00FF00FF00";
   constant I4_6 : BIT_VECTOR(63 downto 0) := X"FFFF0000FFFF0000";
   constant I5_6 : BIT_VECTOR(63 downto 0) := X"FFFFFFFF00000000";
	
	--   equation-based INIT specification for a LUT5.
   constant I0_5 : BIT_VECTOR(31 downto 0) := X"AAAAAAAA";
   constant I1_5 : BIT_VECTOR(31 downto 0) := X"CCCCCCCC";
   constant I2_5 : BIT_VECTOR(31 downto 0) := X"F0F0F0F0";
   constant I3_5 : BIT_VECTOR(31 downto 0) := X"FF00FF00";
   constant I4_5 : BIT_VECTOR(31 downto 0) := X"FFFF0000";

begin
	--Bits 2 and 3
	LUT6_2_inst : LUT6_2
   generic map (
      INIT => ((I3_6 xor ((not I2_6) and I1_6)) and (not I5_6)) or ((I2_6 xor ((not I1_6) and I0_6)) and I5_6) ) -- Specify LUT Contents
   port map (
      O6 => chi_iota_row_out(2),  -- 6/5-LUT output (1-bit)
      O5 => chi_iota_row_out(1),  -- 5-LUT output (1-bit)
      I0 => chi_iota_row_in(4),   -- LUT input (1-bit)
      I1 => chi_iota_row_in(3),   -- LUT input (1-bit)
      I2 => chi_iota_row_in(2),   -- LUT input (1-bit)
      I3 => chi_iota_row_in(1),   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	--Bits 0 and 1
	LUT6_2_inst_2: LUT6_2
   generic map (
      INIT => ((I3_6 xor ((not I2_6) and I1_6)) and (not I5_6)) or ((I2_6 xor ((not I1_6) and I0_6)) and I5_6) ) -- Specify LUT Contents
   port map (
      O6 => chi_iota_row_out(4),  -- 6/5-LUT output (1-bit)
      O5 => chi_iota_row_out(3),  -- 5-LUT output (1-bit)
      I0 => chi_iota_row_in(1),   -- LUT input (1-bit)
      I1 => chi_iota_row_in(0),   -- LUT input (1-bit)
      I2 => chi_iota_row_in(4),   -- LUT input (1-bit)
      I3 => chi_iota_row_in(3),   -- LUT input (1-bit)
      I4 => '0',   -- LUT input (1-bit)
      I5 => '1'    -- LUT input (1-bit)
   );
	--Bit 4 and constant addition
	LUT5_inst : LUT5
   generic map (
      INIT => (I2_5 xor ((not I1_5) and I0_5)) xor I3_5) -- Specify LUT Contents
   port map (
      O => chi_iota_row_out(0),  -- LUT general output
      I0 => chi_iota_row_in(2),   -- LUT input
      I1 => chi_iota_row_in(1),   -- LUT input
      I2 => chi_iota_row_in(0),   -- LUT input
      I3 => Rcon,   -- LUT input
      I4 => '0'    -- LUT input 
   );

end Behavioral;

--LUT
--      _______________________
--     | I5 I4 c4 c3 c2 c1 | O |
--     |-----------------------|
--     |  0  0  0  0  0  0 | ? |\
--     |  0  0  0  0  0  1 | ? | \ = 4'b???? = 4'h? -------------------+
--     |  0  0  0  0  1  0 | ? | /                                     |
--     |  0  0  0  0  1  1 | ? |/                                      |
--     |-------------------|---|                                       |
--     |  0  0  0  1  0  0 | ? |\                                      |
--     |  0  0  0  1  0  1 | ? | \ = 4'b???? = 4'h?                    |
--     |  0  0  0  1  1  0 | ? | /                                     |
--     |  0  0  0  1  1  1 | ? |/                                      |                     
--     |-------------------|---|                                       |
--     |  0  0  1  0  0  0 | ? |\                                      |
--     |  0  0  1  0  0  1 | ? | \ = 4'b???? = 4'h?                    |
--     |  0  0  1  0  1  0 | ? | /                                     |
--     |  0  0  1  0  1  1 | ? |/                                      |
--     |-------------------|---|                                       |
--     |  0  0  1  1  0  0 | ? |\                                      |
--     |  0  0  1  1  0  1 | ? | \ = 4'b???? = 4'h?                    |
--     |  0  0  1  1  1  0 | ? | /                                     |
--     |  0  0  1  1  1  1 | ? |/                                      |
--     -------------------------                                       |
--     |  0  1  0  0  0  0 | ? |\                                      |
--     |  0  1  0  0  0  1 | ? | \ = 4'b???? = 4'h?                    |
--     |  0  1  0  0  1  0 | ? | /                                     |
--     |  0  1  0  0  1  1 | ? |/                                      |
--     |-------------------|---|                                       |
--     |  0  1  0  1  0  0 | ? |\                                      |
--     |  0  1  0  1  0  1 | ? | \ = 4'b???? = 4'h?                    |
--     |  0  1  0  1  1  0 | ? | /                                     |
--     |  0  1  0  1  1  1 | ? |/                                      |
--     |-------------------|---|                                       |
--     |  0  1  1  0  0  0 | ? |\                                      |
--     |  0  1  1  0  0  1 | ? | \ = 4'b???? = 4'h?                    |
--     |  0  1  1  0  1  0 | ? | /                                     |
--     |  0  1  1  0  1  1 | ? |/                                      |
--     |-------------------|---|                                       |
--     |  0  1  1  1  0  0 | ? |\                                      |
--     |  0  1  1  1  0  1 | ? | \ = 4'b???? = 4'h?                    |
--     |  0  1  1  1  1  0 | ? | /                                     |
--     |  0  1  1  1  1  1 | ? |/                                      |
--     ---------                                                                                                                                                                                                                                                                                                                                                                                                  -----              INIT = 64'h????????????????
--     |  1  0  0  0  0  0 | ? |\                       |
--     |  1  0  0  0  0  1 | ? | \ = 4'b???? = 4'h?     |
--     |  1  0  0  0  1  0 | ? | /                      |
--     |  1  0  0  0  1  1 | ? |/                       |
--     |-------------------|---|                        |
--     |  1  0  0  1  0  0 | ? |\                       |
--     |  1  0  0  1  0  1 | ? | \ = 4'b???? = 4'h?     |
--     |  1  0  0  1  1  0 | ? | /                      |
--     |  1  0  0  1  1  1 | ? |/                       |                     
--     |-------------------|---|                        |
--     |  1  0  1  0  0  0 | ? |\                       |
--     |  1  0  1  0  0  1 | ? | \ = 4'b???? = 4'h?     |
--     |  1  0  1  0  1  0 | ? | /                      |
--     |  1  0  1  0  1  1 | ? |/                       |
--     |-------------------|---|                        |
--     |  1  0  1  1  0  0 | ? |\                       |
--     |  1  0  1  1  0  1 | ? | \ = 4'b???? = 4'h?     |
--     |  1  0  1  1  1  0 | ? | /                      |
--     |  1  0  1  1  1  1 | ? |/                       |
--     -------------------------                        |
--     |  1  1  0  0  0  0 | ? |\                       |
--     |  1  1  0  0  0  1 | ? | \ = 4'b???? = 4'h?     |
--     |  1  1  0  0  1  0 | ? | /                      |
--     |  1  1  0  0  1  1 | ? |/                       |
--     |-------------------|---|                        |
--     |  1  1  0  1  0  0 | ? |\                       |
--     |  1  1  0  1  0  1 | ? | \ = 4'b???? = 4'h?     |
--     |  1  1  0  1  1  0 | ? | /                      |
--     |  1  1  0  1  1  1 | ? |/                       |                     
--     |-------------------|---|                        |
--     |  1  1  1  0  0  0 | ? |\                       |
--     |  1  1  1  0  0  1 | ? | \ = 4'b???? = 4'h?     |
--     |  1  1  1  0  1  0 | ? | /                      |
--     |  1  1  1  0  1  1 | ? |/                       |
--     |-------------------|---|                        |
--     |  1  1  1  1  0  0 | ? |\                       |
--     |  1  1  1  1  0  1 | ? | \ = 4'b???? = 4'h? ----+
--     |  1  1  1  1  1  0 | ? | /
--     |  1  1  1  1  1  1 | ? |/
--     ------------------------
