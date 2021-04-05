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
library work;
	use work.keccak_globals.all;
	
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity teta is
	port (
--		 clk : in std_logic;
		 theta_in : in  k_state;
		 theta_out: out k_state);
end teta;

architecture Behavioral of teta is
  signal sum_sheet, sum_sheet_next, sum_sheet_reg : k_plane;
  signal theta_next, theta_reg : k_state;
begin
	--theta

----		REGS IN THE MIDDLE OF THETA
----FIRST STAGE THETA
--		i0101: for x in 0 to 4 generate
--			i0102: for i in 0 to N-1 generate
--				sum_sheet_next(x)(i)<=theta_in(0)(x)(i) xor theta_in(1)(x)(i) xor theta_in(2)(x)(i) xor theta_in(3)(x)(i) xor theta_in(4)(x)(i);
--			
--			end generate;	
--		end generate;
--	theta_next <= theta_in;
----SECOND STAGE
--		i0200: for y in 0 to 4 generate
--			i0201: for x in 1 to 3 generate
--				theta_out(y)(x)(0)<=theta_reg(y)(x)(0) xor sum_sheet_reg(x-1)(0) xor sum_sheet_reg(x+1)(N-1);
--				i0202: for i in 1 to N-1 generate
--					theta_out(y)(x)(i)<=theta_reg(y)(x)(i) xor sum_sheet_reg(x-1)(i) xor sum_sheet_reg(x+1)(i-1);
--				end generate;	
--			end generate;
--		end generate;
--
--		i2001: for y in 0 to 4 generate
--			theta_out(y)(0)(0)<=theta_reg(y)(0)(0) xor sum_sheet_reg(4)(0) xor sum_sheet_reg(1)(N-1);
--			i2021: for i in 1 to N-1 generate
--				theta_out(y)(0)(i)<=theta_reg(y)(0)(i) xor sum_sheet_reg(4)(i) xor sum_sheet_reg(1)(i-1);
--			end generate;	
--
--		end generate;
--
--		i2002: for y in 0 to 4 generate
--			theta_out(y)(4)(0)<=theta_reg(y)(4)(0) xor sum_sheet_reg(3)(0) xor sum_sheet_reg(0)(N-1);
--			i2022: for i in 1 to N-1 generate
--				theta_out(y)(4)(i)<=theta_reg(y)(4)(i) xor sum_sheet_reg(3)(i) xor sum_sheet_reg(0)(i-1);
--			end generate;	
--
--		end generate;
--
--	F_proc : process (clk)
--	begin
--		if rising_edge(clk) then
--			sum_sheet_reg <= sum_sheet_next;
--			theta_reg <= theta_next;
--		end if;
--	end process;
--	
	--		REGS IN THE OUTPUT OF THETA
--FIRST STAGE THETA
		i0101: for x in 0 to 4 generate
			i0102: for i in 0 to N-1 generate
				sum_sheet(x)(i)<=theta_in(0)(x)(i) xor theta_in(1)(x)(i) xor theta_in(2)(x)(i) xor theta_in(3)(x)(i) xor theta_in(4)(x)(i);
			
			end generate;	
		end generate;
		i0200: for y in 0 to 4 generate
			i0201: for x in 1 to 3 generate
				theta_out(y)(x)(0)<=theta_in(y)(x)(0) xor sum_sheet(x-1)(0) xor sum_sheet(x+1)(N-1);
				i0202: for i in 1 to N-1 generate
					theta_out(y)(x)(i)<=theta_in(y)(x)(i) xor sum_sheet(x-1)(i) xor sum_sheet(x+1)(i-1);
				end generate;	
			end generate;
		end generate;

		i2001: for y in 0 to 4 generate
			theta_out(y)(0)(0)<=theta_in(y)(0)(0) xor sum_sheet(4)(0) xor sum_sheet(1)(N-1);
			i2021: for i in 1 to N-1 generate
				theta_out(y)(0)(i)<=theta_in(y)(0)(i) xor sum_sheet(4)(i) xor sum_sheet(1)(i-1);
			end generate;	

		end generate;

		i2002: for y in 0 to 4 generate
			theta_out(y)(4)(0)<=theta_in(y)(4)(0) xor sum_sheet(3)(0) xor sum_sheet(0)(N-1);
			i2022: for i in 1 to N-1 generate
				theta_out(y)(4)(i)<=theta_in(y)(4)(i) xor sum_sheet(3)(i) xor sum_sheet(0)(i-1);
			end generate;	

		end generate;
		
-- SECOND STAGE THETA
--	theta_out <= theta_reg;
--	
--	
--	F_proc : process (clk)
--	begin
--		if rising_edge(clk) then
--			theta_reg <= theta_next;
--		end if;
--	end process;

end Behavioral;

--		REGS IN THE MIDDLE OF THETA
----FIRST STAGE THETA
--		i0101: for x in 0 to 4 generate
--			i0102: for i in 0 to N-1 generate
--				sum_sheet_next(x)(i)<=theta_in(0)(x)(i) xor theta_in(1)(x)(i) xor theta_in(2)(x)(i) xor theta_in(3)(x)(i) xor theta_in(4)(x)(i);
--			
--			end generate;	
--		end generate;
--	theta_next <= theta_in;
----SECOND STAGE
--		i0200: for y in 0 to 4 generate
--			i0201: for x in 1 to 3 generate
--				theta_out(y)(x)(0)<=theta_reg(y)(x)(0) xor sum_sheet_reg(x-1)(0) xor sum_sheet_reg(x+1)(N-1);
--				i0202: for i in 1 to N-1 generate
--					theta_out(y)(x)(i)<=theta_reg(y)(x)(i) xor sum_sheet_reg(x-1)(i) xor sum_sheet_reg(x+1)(i-1);
--				end generate;	
--			end generate;
--		end generate;
--
--		i2001: for y in 0 to 4 generate
--			theta_out(y)(0)(0)<=theta_reg(y)(0)(0) xor sum_sheet_reg(4)(0) xor sum_sheet_reg(1)(N-1);
--			i2021: for i in 1 to N-1 generate
--				theta_out(y)(0)(i)<=theta_reg(y)(0)(i) xor sum_sheet_reg(4)(i) xor sum_sheet_reg(1)(i-1);
--			end generate;	
--
--		end generate;
--
--		i2002: for y in 0 to 4 generate
--			theta_out(y)(4)(0)<=theta_reg(y)(4)(0) xor sum_sheet_reg(3)(0) xor sum_sheet_reg(0)(N-1);
--			i2022: for i in 1 to N-1 generate
--				theta_out(y)(4)(i)<=theta_reg(y)(4)(i) xor sum_sheet_reg(3)(i) xor sum_sheet_reg(0)(i-1);
--			end generate;	
--
--		end generate;
--
--	F_proc : process (clk)
--	begin
--		if rising_edge(clk) then
--			sum_sheet_reg <= sum_sheet_next;
--			theta_reg <= theta_next;
--		end if;
--	end process;



----		REGS IN THE OUTPUT OF THETA
----FIRST STAGE THETA
--		i0101: for x in 0 to 4 generate
--			i0102: for i in 0 to N-1 generate
--				sum_sheet(x)(i)<=theta_in(0)(x)(i) xor theta_in(1)(x)(i) xor theta_in(2)(x)(i) xor theta_in(3)(x)(i) xor theta_in(4)(x)(i);
--			
--			end generate;	
--		end generate;
--		i0200: for y in 0 to 4 generate
--			i0201: for x in 1 to 3 generate
--				theta_next(y)(x)(0)<=theta_in(y)(x)(0) xor sum_sheet(x-1)(0) xor sum_sheet(x+1)(N-1);
--				i0202: for i in 1 to N-1 generate
--					theta_next(y)(x)(i)<=theta_in(y)(x)(i) xor sum_sheet(x-1)(i) xor sum_sheet(x+1)(i-1);
--				end generate;	
--			end generate;
--		end generate;
--
--		i2001: for y in 0 to 4 generate
--			theta_next(y)(0)(0)<=theta_in(y)(0)(0) xor sum_sheet(4)(0) xor sum_sheet(1)(N-1);
--			i2021: for i in 1 to N-1 generate
--				theta_next(y)(0)(i)<=theta_in(y)(0)(i) xor sum_sheet(4)(i) xor sum_sheet(1)(i-1);
--			end generate;	
--
--		end generate;
--
--		i2002: for y in 0 to 4 generate
--			theta_next(y)(4)(0)<=theta_in(y)(4)(0) xor sum_sheet(3)(0) xor sum_sheet(0)(N-1);
--			i2022: for i in 1 to N-1 generate
--				theta_next(y)(4)(i)<=theta_in(y)(4)(i) xor sum_sheet(3)(i) xor sum_sheet(0)(i-1);
--			end generate;	
--
--		end generate;
--		
---- SECOND STAGE THETA
--	theta_out <= theta_reg;
--	
--	
--	F_proc : process (clk)
--	begin
--		if rising_edge(clk) then
--			theta_reg <= theta_next;
--		end if;
--	end process;
