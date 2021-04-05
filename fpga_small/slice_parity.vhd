----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:57 01/31/2019 
-- Design Name: 
-- Module Name:    slice_parity - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity slice_parity is
    Port ( slice_p_in : in  k_slice;
           parity_out : out  k_row);
end slice_parity;

architecture Behavioral of slice_parity is

begin
	
	parity_gen : for I in 0 to 4 generate
		parity_out(I) <= slice_p_in(0)(I) xor slice_p_in(1)(I) xor slice_p_in(2)(I) xor slice_p_in(3)(I) xor slice_p_in(4)(I); 
	end generate;

end Behavioral;

