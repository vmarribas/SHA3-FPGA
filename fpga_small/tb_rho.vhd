--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:48:15 02/05/2019
-- Design Name:   
-- Module Name:   /users/cosic/varribas/Documents/KECCAK_FPGA/vhd/fpga_based/tb_rho.vhd
-- Project Name:  KECCAK_FPGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rho_lane
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
 
ENTITY tb_rho IS
END tb_rho;
 
ARCHITECTURE behavior OF tb_rho IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rho_lane_opt
    PORT(
         count_reg : IN  unsigned(9 downto 0);
         state_rho_en : OUT  k_slice
        );
    END COMPONENT;
    

   --Inputs
   signal count_reg : unsigned(9 downto 0) := (others => '0');

 	--Outputs
   signal state_rho_en : k_slice;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
constant clk_period : time := 10 ns; 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rho_lane_opt PORT MAP (
          count_reg => count_reg,
          state_rho_en => state_rho_en
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period*10;
		
		for I in 319 to 382 loop
			count_reg <= to_unsigned(I,10);
			wait for clk_period;
		end loop;
      -- insert stimulus here 

      wait;
   end process;

END;
