-- The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
-- Michal Peeters and Gilles Van Assche. For more information, feedback or
-- questions, please refer to our website: http://keccak.noekeon.org/

-- Implementation by the designers,
-- hereby denoted as "the implementer".

-- To the extent possible under law, the implementer has waived all copyright
-- and related or neighboring rights to the source code in this file.
-- http://creativecommons.org/publicdomain/zero/1.0/


library work;
	use work.keccak_globals.all;
	
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;


entity keccak_round_blocks is

port (

    clk, rst, en2     : in  std_logic;
    round_in     : in  k_state;
    round_constant_signal    : in std_logic_vector(N-1 downto 0);
    round_out    : out k_state);

end keccak_round_blocks;

architecture rtl of keccak_round_blocks is


  ----------------------------------------------------------------------------
  -- Internal signal declarations
  ----------------------------------------------------------------------------
	component chi
		port (
			 chi_in   : in  k_state;
			 chi_out  : out k_state);
	end component;
	
	component teta
		port (
--			 clk   : in  std_logic;
			 theta_in   : in  k_state;
			 theta_out  : out k_state);
	end component;
	
	component pi
		port (
			 pi_in   : in  k_state;
			 pi_out  : out k_state);
	end component;
	
	component rho
		port (
			 rho_in   : in  k_state;
			 rho_out  : out k_state);
	end component;
	
	component iota
		port (
			 iota_in   : in  k_state;
			 round_constant_signal    : in std_logic_vector(N-1 downto 0);
			 iota_out  : out k_state);
	end component;
  
  signal theta_in,theta_out,theta_reg,pi_in,pi_out,rho_in,rho_out,chi_in,chi_out,iota_in,iota_out : k_state;
 
  
begin  -- Rtl


--connecitons

--order theta, pi, rho, chi, iota
theta_in<=round_in;
pi_in<=rho_out;
rho_in<=theta_reg;
chi_in<=pi_out;
iota_in<=chi_out;
round_out<=iota_out;


--chi
	chi_perm : chi 
			port map (
			 chi_in => chi_in,
			 chi_out => chi_out);
			 
--theta
	theta_perm : teta 
			port map (
--			 clk => clk,
			 theta_in => theta_in,
			 theta_out => theta_out);

-- pi
	pi_perm : pi 
			port map (
			 pi_in => pi_in,
			 pi_out => pi_out);

--rho
	rho_perm : rho 
			port map (
			 rho_in => rho_in,
			 rho_out => rho_out);

--iota
	iota_perm : iota 
			port map (
			 iota_in => iota_in,
			 round_constant_signal => round_constant_signal,
			 iota_out => iota_out);

	F_proc : process (clk, rst)
	begin
		if (rst = '1') then
			theta_reg <= (OTHERS => (OTHERS => (OTHERS => '0')));
		elsif rising_edge(clk) then
			if (en2 = '1') then 
				theta_reg <= theta_out;
			end if;
		end if;
	end process;

end rtl;
