--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:48:51 01/25/2019
-- Design Name:   
-- Module Name:   /users/cosic/varribas/Documents/KECCAK_FPGA/vhd/fpga_based/tb_chi.vhd
-- Project Name:  KECCAK_FPGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: chi
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;
use work.keccak_globals.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_chi IS
END tb_chi;
 
ARCHITECTURE behavior OF tb_chi IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT chi_iota_row
    PORT(
         chi_iota_row_in : k_row;
			Rcon : in std_logic;
         chi_iota_row_out : OUT  k_row
        );
    END COMPONENT;
    

   --Inputs
   signal chi_in : std_logic_vector(4 downto 0) := (others => '0');
   signal chi_in2 : k_row := (others => '0');
   signal Rcon : std_logic := '1';

 	--Outputs
   signal chi_out : k_row;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 1 ns;
 
BEGIN
	chi_in2(4) <= chi_in(0);
	chi_in2(3) <= chi_in(1);
	chi_in2(2) <= chi_in(2);
	chi_in2(1) <= chi_in(3);
	chi_in2(0) <= chi_in(4);
	-- Instantiate the Unit Under Test (UUT)
   uut: chi_iota_row PORT MAP (
          chi_iota_row_in => chi_in2,
			 Rcon => Rcon,
          chi_iota_row_out => chi_out
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


		for I in 0 to 32 loop
			chi_in <= std_logic_vector(to_unsigned(I,5));
			wait for clk_period*10;
		end loop;
      -- insert stimulus here 

      wait;
   end process;

END;
