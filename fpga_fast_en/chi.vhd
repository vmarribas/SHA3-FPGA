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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity chi is
	port (
		 chi_in : in  k_state;
--		 Rcon : in  std_logic_vector(N-1 downto 0);
		 chi_out: out k_state);
end chi;

architecture Behavioral of chi is

	component chi_iota_row
		 Port ( chi_iota_row_in_0 : in  std_logic;
			  chi_iota_row_in_1 : in  std_logic;
			  chi_iota_row_in_2 : in  std_logic;
			  chi_iota_row_in_3 : in  std_logic;
			  chi_iota_row_in_4 : in  std_logic;
			  Rcon : in std_logic;
           chi_iota_row_out_0 : out  std_logic;
           chi_iota_row_out_1 : out  std_logic;
           chi_iota_row_out_2 : out  std_logic;
           chi_iota_row_out_3 : out  std_logic;
           chi_iota_row_out_4 : out  std_logic
		 );
	end component;
	
--	signal chi_in_row, chi_out_row : k_row;

begin
--chi
--		--y=0
--		gen_z0 : for z in 0 to N-1 generate 
--			chi: chi_iota_row Port map( 
--				chi_iota_row_in_0 => chi_in(0)(0)(z),
--				chi_iota_row_in_1 => chi_in(0)(1)(z),
--				chi_iota_row_in_2 => chi_in(0)(2)(z),
--				chi_iota_row_in_3 => chi_in(0)(3)(z),
--				chi_iota_row_in_4 => chi_in(0)(4)(z),
--				Rcon => Rcon(z),
--				chi_iota_row_out_0 => chi_out(0)(0)(z),
--				chi_iota_row_out_1 => chi_out(0)(1)(z),
--				chi_iota_row_out_2 => chi_out(0)(2)(z),
--				chi_iota_row_out_3 => chi_out(0)(3)(z),
--				chi_iota_row_out_4 => chi_out(0)(4)(z)
--			);
--		end generate;
--		
--	gen_y : for y in 1 to 4 generate
--		gen_z : for z in 0 to N-1 generate 
--			chi: chi_iota_row Port map( 
--				chi_iota_row_in_0 => chi_in(y)(0)(z),
--				chi_iota_row_in_1 => chi_in(y)(1)(z),
--				chi_iota_row_in_2 => chi_in(y)(2)(z),
--				chi_iota_row_in_3 => chi_in(y)(3)(z),
--				chi_iota_row_in_4 => chi_in(y)(4)(z),
--				Rcon => '0',
--				chi_iota_row_out_0 => chi_out(y)(0)(z),
--				chi_iota_row_out_1 => chi_out(y)(1)(z),
--				chi_iota_row_out_2 => chi_out(y)(2)(z),
--				chi_iota_row_out_3 => chi_out(y)(3)(z),
--				chi_iota_row_out_4 => chi_out(y)(4)(z)
--			);
--		end generate;
--	end generate;
--				


i0000: for y in 0 to 4 generate
	i0001: for x in 0 to 2 generate
		i0002: for i in 0 to N-1 generate
			chi_out(y)(x)(i)<=chi_in(y)(x)(i) xor  ( not(chi_in (y)(x+1)(i))and chi_in (y)(x+2)(i));
		
		end generate;	
	end generate;
end generate;

	i0011: for y in 0 to 4 generate
		i0021: for i in 0 to N-1 generate
			chi_out(y)(3)(i)<=chi_in(y)(3)(i) xor  ( not(chi_in (y)(4)(i))and chi_in (y)(0)(i));
		
		end generate;	
	end generate;
	
	i0012: for y in 0 to 4 generate
		i0022: for i in 0 to N-1 generate
			chi_out(y)(4)(i)<=chi_in(y)(4)(i) xor  ( not(chi_in (y)(0)(i))and chi_in (y)(1)(i));
		
		end generate;	
	end generate;
	
end Behavioral;
