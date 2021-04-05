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
library UNISIM;
use UNISIM.VComponents.all;

entity theta_parity_adresses is
    Port ( clk : in  STD_LOGIC;
           we : in  STD_LOGIC;
           parity_row_in : in  k_row;
           address : in  STD_LOGIC_VECTOR(5 downto 0);
           parity_row_out : out  k_row);
end theta_parity_adresses;

architecture Behavioral of theta_parity_adresses is

begin

	theta_addddresses : for I in 0 to 4 generate
		RAM64X1S_inst : RAM64X1S
		generic map (
			INIT => X"0000000000000000")
		port map (
			O => parity_row_out(I),        -- 1-bit data output
			A0 => address(0),      -- Address[0] input bit
			A1 => address(1),      -- Address[1] input bit
			A2 => address(2),      -- Address[2] input bit
			A3 => address(3),      -- Address[3] input bit
			A4 => address(4),      -- Address[4] input bit
			A5 => address(5),      -- Address[5] input bit
			D => parity_row_in(I),        -- 1-bit data input
			WCLK => clk,  -- Write clock input
			WE => we       -- Write enable input
		);
	end generate;


end Behavioral;

