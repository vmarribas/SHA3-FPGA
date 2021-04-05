----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:59 01/31/2019 
-- Design Name: 
-- Module Name:    theta_parity_adresses - Behavioral 
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

