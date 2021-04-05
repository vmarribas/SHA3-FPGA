-- The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
-- Michal Peeters and Gilles Van Assche. For more information, feedback or
-- questions, please refer to our website: http://keccak.noekeon.org/

-- Implementation by the designers,
-- hereby denoted as "the implementer".

-- To the extent possible under law, the implementer has waived all copyright
-- and related or neighboring rights to the source code in this file.
-- http://creativecommons.org/publicdomain/zero/1.0/

--////////////////////////////////////////////////////////////////////////////////

--// COMPANY:    COSIC, KU Leuven 
--// AUTHOR:     Victor Arribas

--////////////////////////////////////////////////////////////////////////////////


library work;
use work.keccak_globals.all;
	
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keccak_round_constants_gen is
port(

    round_number: in unsigned(4 downto 0);
    round_constant_signal_out    : out std_logic_vector(N-1 downto 0));

end keccak_round_constants_gen;

architecture rtl of keccak_round_constants_gen is


  ----------------------------------------------------------------------------
  -- Internal signal declarations
  ----------------------------------------------------------------------------

 
  signal round_constant_signal: std_logic_vector(N-1 downto 0);
 
  
begin  -- Rtl




round_constants : process (round_number)
begin
	if N = 8 then
--		case round_number is
--			 when "00000" => round_constant_signal <= X"01" ;
--			 when "00001" => round_constant_signal <= X"82" ;
--			 when "00010" => round_constant_signal <= X"8A" ;
--			 when "00011" => round_constant_signal <= X"00" ;
--			 when "00100" => round_constant_signal <= X"8B" ;
--			 when "00101" => round_constant_signal <= X"01" ;
--			 when "00110" => round_constant_signal <= X"81" ;
--			 when "00111" => round_constant_signal <= X"09" ;
--			 when "01000" => round_constant_signal <= X"8A" ;
--			 when "01001" => round_constant_signal <= X"88" ;
--			 when "01010" => round_constant_signal <= X"09" ;
--			 when "01011" => round_constant_signal <= X"0A" ;
--			 when "01100" => round_constant_signal <= X"8B" ;
--			 when "01101" => round_constant_signal <= X"8B" ;
--			 when "01110" => round_constant_signal <= X"89" ;
--			 when "01111" => round_constant_signal <= X"03" ;
--			 when "10000" => round_constant_signal <= X"02" ;
--			 when "10001" => round_constant_signal <= X"80" ;
--			 when "10010" => round_constant_signal <= X"0A" ;
--			 when "10011" => round_constant_signal <= X"0A" ;
--			 when "10100" => round_constant_signal <= X"81" ;
--			 when "10101" => round_constant_signal <= X"80" ;
--			 when "10110" => round_constant_signal <= X"01" ;
--			 when "10111" => round_constant_signal <= X"08" ;	    	    
--			 when others => round_constant_signal <=(others => '0');
--		end case;
	elsif N = 16 then
--		case round_number is
--			when "00000" => round_constant_signal <= X"0001" ;
--			when "00001" => round_constant_signal <= X"8082" ;
--			when "00010" => round_constant_signal <= X"808A" ;
--			when "00011" => round_constant_signal <= X"8000" ;
--			when "00100" => round_constant_signal <= X"808B" ;
--			when "00101" => round_constant_signal <= X"0001" ;
--			when "00110" => round_constant_signal <= X"8081" ;
--			when "00111" => round_constant_signal <= X"8009" ;
--			when "01000" => round_constant_signal <= X"008A" ;
--			when "01001" => round_constant_signal <= X"0088" ;
--			when "01010" => round_constant_signal <= X"8009" ;
--			when "01011" => round_constant_signal <= X"000A" ;
--			when "01100" => round_constant_signal <= X"808B" ;
--			when "01101" => round_constant_signal <= X"008B" ;
--			when "01110" => round_constant_signal <= X"8089" ;
--			when "01111" => round_constant_signal <= X"8003" ;
--			when "10000" => round_constant_signal <= X"8002" ;
--			when "10001" => round_constant_signal <= X"0080" ;
--			when "10010" => round_constant_signal <= X"800A" ;
--			when "10011" => round_constant_signal <= X"000A" ;
--			when "10100" => round_constant_signal <= X"8081" ;
--			when "10101" => round_constant_signal <= X"8080" ;
--			when "10110" => round_constant_signal <= X"0001" ;
--			when "10111" => round_constant_signal <= X"8008" ;	    	    
--			when others => round_constant_signal <=(others => '0');
--		end case;
	elsif N = 32 then
--		case round_number is
--			when "00000" => round_constant_signal <= X"00000001" ;
--			when "00001" => round_constant_signal <= X"00008082" ;
--			when "00010" => round_constant_signal <= X"0000808A" ;
--			when "00011" => round_constant_signal <= X"80008000" ;
--			when "00100" => round_constant_signal <= X"0000808B" ;
--			when "00101" => round_constant_signal <= X"80000001" ;
--			when "00110" => round_constant_signal <= X"80008081" ;
--			when "00111" => round_constant_signal <= X"00008009" ;
--			when "01000" => round_constant_signal <= X"0000008A" ;
--			when "01001" => round_constant_signal <= X"00000088" ;
--			when "01010" => round_constant_signal <= X"80008009" ;
--			when "01011" => round_constant_signal <= X"8000000A" ;
--			when "01100" => round_constant_signal <= X"8000808B" ;
--			when "01101" => round_constant_signal <= X"0000008B" ;
--			when "01110" => round_constant_signal <= X"00008089" ;
--			when "01111" => round_constant_signal <= X"00008003" ;
--			when "10000" => round_constant_signal <= X"00008002" ;
--			when "10001" => round_constant_signal <= X"00000080" ;
--			when "10010" => round_constant_signal <= X"0000800A" ;
--			when "10011" => round_constant_signal <= X"8000000A" ;
--			when "10100" => round_constant_signal <= X"80008081" ;
--			when "10101" => round_constant_signal <= X"00008080" ;
--			when "10110" => round_constant_signal <= X"80000001" ;
--			when "10111" => round_constant_signal <= X"80008008" ;	    	    
--			when others => round_constant_signal <=(others => '0');
--		end case;
	elsif N = 64 then
		case round_number is
			when "00000" => round_constant_signal <= X"0000000000000001" ;
			when "00001" => round_constant_signal <= X"0000000000008082" ;
			when "00010" => round_constant_signal <= X"800000000000808A" ;
			when "00011" => round_constant_signal <= X"8000000080008000" ;
			when "00100" => round_constant_signal <= X"000000000000808B" ;
			when "00101" => round_constant_signal <= X"0000000080000001" ;
			when "00110" => round_constant_signal <= X"8000000080008081" ;
			when "00111" => round_constant_signal <= X"8000000000008009" ;
			when "01000" => round_constant_signal <= X"000000000000008A" ;
			when "01001" => round_constant_signal <= X"0000000000000088" ;
			when "01010" => round_constant_signal <= X"0000000080008009" ;
			when "01011" => round_constant_signal <= X"000000008000000A" ;
			when "01100" => round_constant_signal <= X"000000008000808B" ;
			when "01101" => round_constant_signal <= X"800000000000008B" ;
			when "01110" => round_constant_signal <= X"8000000000008089" ;
			when "01111" => round_constant_signal <= X"8000000000008003" ;
			when "10000" => round_constant_signal <= X"8000000000008002" ;
			when "10001" => round_constant_signal <= X"8000000000000080" ;
			when "10010" => round_constant_signal <= X"000000000000800A" ;
			when "10011" => round_constant_signal <= X"800000008000000A" ;
			when "10100" => round_constant_signal <= X"8000000080008081" ;
			when "10101" => round_constant_signal <= X"8000000000008080" ;
			when "10110" => round_constant_signal <= X"0000000080000001" ;
			when "10111" => round_constant_signal <= X"8000000080008008" ;	    	    
			when others => round_constant_signal <=(others => '0');
		end case;
	end if;
end process round_constants;

round_constant_signal_out<=round_constant_signal;
end rtl;
