--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:26:16 01/30/2019
-- Design Name:   
-- Module Name:   /users/cosic/varribas/Documents/KECCAK_FPGA/vhd/fpga_based/tb_state_reg.vhd
-- Project Name:  KECCAK_FPGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: state_reg
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
--USE ieee.numeric_std.ALL;
 
ENTITY tb_state_reg IS
END tb_state_reg;
 
ARCHITECTURE behavior OF tb_state_reg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT state_reg
    PORT(
         clk : IN  std_logic;
         en_slice : IN  k_slice;
         slice_shift : IN  std_logic;
         pi_shift : IN  std_logic;
         slice_in : IN  k_slice;
         row_in : IN  k_row;
         row_out : OUT  k_row
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal en_slice : k_slice := (others => (others => '0'));
   signal slice_shift : std_logic := '0';
   signal pi_shift : std_logic := '0';
   signal slice_in : k_slice := (others => (others => '0'));
   signal row_in : k_row := (others => '0');

 	--Outputs
   signal row_out : k_row;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: state_reg PORT MAP (
          clk => clk,
          en_slice => en_slice,
          slice_shift => slice_shift,
          pi_shift => pi_shift,
          slice_in => slice_in,
          row_in => row_out,
          row_out => row_out
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
		en_slice <= (others =>(others => '1'));
		slice_shift <= '1';
		slice_in(0)(0) <= '1';
		wait for clk_period;
		slice_in(0)(1) <= '1';
		slice_in(0)(0) <= '0';
		wait for clk_period;
		slice_in(4)(1) <= '1';
		slice_in(0)(1) <= '0';
		wait for clk_period;
		slice_in(4)(1) <= '0';------not changed
		wait for clk_period*6;
		slice_in(3)(4) <= '1';
		wait for clk_period;
		slice_in(2)(1) <= '1';
		slice_in(3)(4) <= '0';
		wait for clk_period;
		slice_in(2)(1) <= '0';
		wait for clk_period*4;
		slice_in(4)(4) <= '1';
		wait for clk_period;
		slice_in(4)(4) <= '0';
		wait for clk_period*5;
		slice_in(1)(4) <= '1';
		wait for clk_period;
		slice_in(1)(4) <= '0';
		wait for clk_period*6;
		slice_in(0)(4) <= '1';
		wait for clk_period;
		slice_in(0)(4) <= '0';
		wait for clk_period*11;
		slice_in(2)(4) <= '1';
		wait for clk_period;
		slice_in(2)(4) <= '0';
		wait for clk_period*3;
		slice_in(1)(1) <= '1';
		wait for clk_period;
		slice_in(3)(1) <= '1';
		slice_in(1)(1) <= '0';
		wait for clk_period;
		slice_in(3)(1) <= '0';
		wait for clk_period*18;
			
		
		
		en_slice <= (others =>(others => '0'));
		slice_shift <= '0';
		wait for clk_period*10;
		en_slice <= (others =>(others => '1'));
		wait for clk_period*320;
		pi_shift <= '1';
		wait for clk_period*64;
		slice_shift <= '1';
		wait for clk_period*64;
		en_slice <= (others =>(others => '0'));
      -- insert stimulus here 

      wait;
   end process;

END;
