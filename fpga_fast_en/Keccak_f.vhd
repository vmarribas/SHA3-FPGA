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
use ieee.numeric_std.all;

library work;
 use work.keccak_globals.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-- Sha3 pipelined implementation.

entity Keccak_f is
    Port ( start, en2, load, clk, rst : in std_logic;
			  s_in : in  STD_LOGIC_VECTOR (1088-1 downto 0);
           s_out_r : out  STD_LOGIC_VECTOR (25*N-1 downto 0);--bitrate
			  ready : out std_logic -- High for one clock cycle when output is ready
			);
end Keccak_f;

architecture Behavioral of Keccak_f is
	
	constant BLOCK_BYTES : natural := N/8;
	
	component keccak_round_constants_gen
		 port( round_number: in unsigned(4 downto 0);
					round_constant_signal_out    : out std_logic_vector(N-1 downto 0));
	end component;
	
	component keccak_round_blocks 
		 port ( clk, rst, en2     : in  std_logic;
				  round_in     : in  k_state;
				  round_constant_signal    : in std_logic_vector(N-1 downto 0);
				  round_out    : out k_state);
	end component;

	signal round_next, round_out, round_reg : k_state;
	signal ready_int, ready_reg : std_logic;--Handle value for ready
	signal tic_toc_next, tic_toc_reg : std_logic;
	signal round: unsigned(4 downto 0);
	signal n_round : unsigned (4 downto 0);
	signal round_cntnt : STD_LOGIC_VECTOR (N-1 downto 0);
	
	
begin
	
	--Absorb input string or assign the previous step
	i1: for y in 0 to 2 generate
		i2: for x in 0 to 4 generate
			i3: for i in 0 to BLOCK_BYTES-1 generate
				i4: for z in 0 to 7 generate
			
					round_next(y)(x)(8*i+z) <= (s_in((N*5*(2-y))+(N*(4-x))+8*(BLOCK_BYTES-1-i)+z+128) and load) xor 
														round_out(y)(x)(8*i+z);
													
				end generate;	
			end generate;
		end generate;
	end generate;

		i22: for x in 0 to 1 generate
			i32: for i in 0 to BLOCK_BYTES-1 generate
				i42: for z in 0 to 7 generate
			
					round_next(3)(x)(8*i+z) <= (s_in((N*(1-x))+8*(BLOCK_BYTES-1-i)+z) and load) xor 
														round_out(3)(x)(8*i+z);
													
				end generate;	
			end generate;
		end generate;
	-- Add the rest as output or register!!!!!!!!! These previous ones were only for the input.
		-- Rest of y=3
		i24: for x in 2 to 4 generate
			i34: for i in 0 to BLOCK_BYTES-1 generate
				i44: for z in 0 to 7 generate
			
					round_next(3)(x)(8*i+z) <= round_out(3)(x)(8*i+z);
													
				end generate;	
			end generate;
		end generate;
		-- y=4
		i23: for x in 0 to 4 generate
			i33: for i in 0 to BLOCK_BYTES-1 generate
				i43: for z in 0 to 7 generate
			
					round_next(4)(x)(8*i+z) <= round_out(4)(x)(8*i+z);
													
				end generate;	
			end generate;
		end generate;
		
	
	ready <= ready_reg;
	--Count rounds
	n_round <= (others=>'0') when (load = '1') else 
				round+1;
	tic_toc_next <= '0' when (load = '1') else 
						 not tic_toc_reg;
	--Finished? 
	ready_int <= '1' when ((round = ROUNDS-1)) else '0';
		
	--Compute Keccak

	Kecc_cntnt:	component keccak_round_constants_gen
						port map( round_number => round, round_constant_signal_out => round_cntnt);
	Kecc_round:	component keccak_round_blocks 
						port map( clk => clk, rst => rst, en2 => en2, round_in => round_reg, round_constant_signal => round_cntnt, round_out => round_out);

--	round_cntnt <= RC(to_integer(round));

	F_proc : process (clk, rst)
	begin
		
		if (rst = '1') then
			round <=  (others => '0');
			round_reg <= (OTHERS => (OTHERS => (OTHERS => '0')));
			ready_reg <= '0';
			tic_toc_reg <= '0';
		elsif rising_edge(clk) then
			if (start = '1' and (round <= ROUNDS+1) and (tic_toc_reg = '1')) then
				round <= n_round;
			end if;
			if (start ='1') then
				round_reg <= round_next;
				tic_toc_reg <= tic_toc_next;
			end if;
			ready_reg <= ready_int;
		end if;
	end process;	
	
	--Output
	o002: for x in 0 to 4 generate
		o02: for i in 0 to BLOCK_BYTES-1 generate
			o002: for z in 0 to 7 generate				
				s_out_r(N*(4-x)+8*(BLOCK_BYTES-1-i)+z+20*N)<= round_reg(0)(x)(8*i+z) and ready_reg ;

				s_out_r(N*(4-x)+8*(BLOCK_BYTES-1-i)+z+15*N)<= round_reg(1)(x)(8*i+z) and ready_reg ;

				s_out_r(N*(4-x)+8*(BLOCK_BYTES-1-i)+z+10*N)<= round_reg(2)(x)(8*i+z)  and ready_reg ;

				s_out_r(N*(4-x)+8*(BLOCK_BYTES-1-i)+z+5*N)<= round_reg(3)(x)(8*i+z)  and ready_reg ;

				s_out_r(N*(4-x)+8*(BLOCK_BYTES-1-i)+z)<= round_reg(4)(x)(8*i+z)     and ready_reg ;
			end generate;
		end generate;
	end generate;
end Behavioral;
