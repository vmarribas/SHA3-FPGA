--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:36:21 02/01/2019
-- Design Name:   
-- Module Name:   /users/cosic/varribas/Documents/KECCAK_FPGA/vhd/fpga_based/tb_parity_addresses.vhd
-- Project Name:  KECCAK_FPGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: theta_parity_adresses
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_parity_addresses IS
END tb_parity_addresses;
 
ARCHITECTURE behavior OF tb_parity_addresses IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT theta_parity_adresses
    PORT(
         clk : IN  std_logic;
         we : IN  std_logic;
         parity_row_in : IN  k_row;
         address : IN  std_logic_vector(5 downto 0);
         parity_row_out : OUT  k_row
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal we : std_logic := '0';
   signal parity_row_in : std_logic := '0';
   signal address : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal parity_row_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: theta_parity_adresses PORT MAP (
          clk => clk,
          we => we,
          parity_row_in => parity_row_in,
          address => address,
          parity_row_out => parity_row_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
