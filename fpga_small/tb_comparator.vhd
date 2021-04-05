--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:17:26 02/04/2019
-- Design Name:   
-- Module Name:   C:/Users/varribas/Documents/COSIC/fpga_based/tb_comparator.vhd
-- Project Name:  Blabla
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparator
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
USE ieee.numeric_std.ALL;
 
ENTITY tb_comparator IS
END tb_comparator;
 
ARCHITECTURE behavior OF tb_comparator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparator
    PORT(
         count_reg : IN  unsigned(9 downto 0);
         bools0 : OUT  std_logic;
         bools1 : OUT  std_logic;
         bools2 : OUT  std_logic;
         bools3 : OUT  std_logic;
         bools4 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal count_reg : unsigned(9 downto 0) := (others => '0');
   signal count_reg_lsb : unsigned(1 downto 0);
   signal count_reg_msb : unsigned(4 downto 0);

 	--Outputs
   signal bools0 : std_logic;
   signal bools1 : std_logic;
   signal bools2 : std_logic;
   signal bools3 : std_logic;
   signal bools4 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparator PORT MAP (
          count_reg => count_reg,
          bools1 => bools1,
          bools0 => bools0,
          bools2 => bools2,
          bools3 => bools3,
          bools4 => bools4
        );

   -- Clock process definitions
	count_reg_msb <= count_reg(6 downto 2);
	count_reg_lsb <= count_reg(1 downto 0);


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		--CONTROL
		for I in 0 to 767 loop
			count_reg <= to_unsigned(I,10);
			wait for clk_period;
		end loop;

		
		--RHO
--		for I in 319 to 382 loop
--			count_reg <= to_unsigned(I,10);
--			wait for clk_period;
--		end loop;

      -- insert stimulus here 

      wait;
   end process;

END;
