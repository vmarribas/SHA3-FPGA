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

entity top_wrapper is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           load : in  STD_LOGIC;
           start : in  STD_LOGIC;
           en2 : in  STD_LOGIC;
           ready : out  STD_LOGIC;
           byte_in : in  STD_LOGIC_VECTOR (8-1 downto 0);
           byte_out : out  STD_LOGIC_VECTOR (8-1 downto 0));
end top_wrapper;

architecture Behavioral of top_wrapper is
	
	component Keccak_f
	Port ( 
		start, en2, load, clk, rst : in std_logic;
		s_in : in  STD_LOGIC_VECTOR (1088-1 downto 0);
		s_out_r : out  STD_LOGIC_VECTOR (25*N-1 downto 0);--bitrate
		ready : out std_logic -- High for one clock cycle when output is ready
	);
	end component;
	signal s_in_next, s_in_reg : STD_LOGIC_VECTOR (1088-1 downto 0);
	signal s_out, s_out_next, s_out_reg : STD_LOGIC_VECTOR (25*N-1 downto 0);
    signal ready_int : std_logic;
begin
	
	s_in_next <= s_in_reg(1080-1 downto 0) & byte_in;
		
	perm : Keccak_f
	Port map( 
		start => start, en2 => en2, load => load, clk => clk, rst => rst,
		s_in => s_in_reg,
		s_out_r => s_out,
		ready => ready_int
	);
    ready <= ready_int; 
    
    byte_out <= s_out_reg(1087 downto 1080);
    s_out_next <= s_out when ready_int = '1' else
                  s_out_reg(1592-1 downto 0) & s_out_reg(1600-1 downto 1592);
    
	F_proc : process (clk)
	begin
		if rising_edge(clk) then
			s_in_reg <= s_in_next;
			s_out_reg <= s_out_next;
		end if;
	end process;
	
end Behavioral;

