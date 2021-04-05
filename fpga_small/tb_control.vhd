--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:45:11 02/07/2019
-- Design Name:   
-- Module Name:   /users/cosic/varribas/Documents/KECCAK_FPGA/vhd/fpga_based/tb_control.vhd
-- Project Name:  KECCAK_FPGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control
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
 
ENTITY tb_control IS
END tb_control;
 
ARCHITECTURE behavior OF tb_control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           count_reg_out : out  unsigned(9 downto 0);
           round_reg_out : out  unsigned(4 downto 0);
           slice_shift : out  STD_LOGIC;
           pi_shift : out  STD_LOGIC;
           computing_rho : out  STD_LOGIC;
           computing_pi : out  STD_LOGIC;
           computing_chi : out  STD_LOGIC;
           eq_62_out : out  STD_LOGIC;
           eq_63_out : out  STD_LOGIC;
           eq_765_out : out  STD_LOGIC;
           eq_766_out : out  STD_LOGIC;
           eq_767_out : out  STD_LOGIC
			  );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal count_reg_out : unsigned(9 downto 0);
   signal round_reg_out : unsigned(4 downto 0);
   signal slice_shift : std_logic;
   signal pi_shift : std_logic;
   signal computing_rho : std_logic;
   signal computing_pi : std_logic;
   signal computing_chi : std_logic;
	signal eq_62_out :  STD_LOGIC;
    signal       eq_63_out :  STD_LOGIC;
    signal       eq_765_out :  STD_LOGIC;
    signal       eq_766_out :  STD_LOGIC;
    signal       eq_767_out :  STD_LOGIC;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          clk => clk,
          rst => rst,
          count_reg_out => count_reg_out,
          round_reg_out => round_reg_out,
          slice_shift => slice_shift,
          pi_shift => pi_shift,
          computing_rho => computing_rho,
          computing_pi => computing_pi,
          computing_chi => computing_chi,
          eq_62_out => eq_62_out,
          eq_63_out => eq_63_out,
          eq_765_out => eq_765_out,
          eq_766_out => eq_766_out,
          eq_767_out => eq_767_out
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
		rst <= '1';
      wait for 100 ns;	
		rst <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
