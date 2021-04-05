--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:03:14 01/28/2019
-- Design Name:   
-- Module Name:   /users/cosic/varribas/Documents/KECCAK_FPGA/vhd/fpga_based/tb_keccak_fsm.vhd
-- Project Name:  KECCAK_FPGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: keccak_fsm
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
 
ENTITY tb_keccak_fsm IS
END tb_keccak_fsm;
 
ARCHITECTURE behavior OF tb_keccak_fsm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keccak_fsm
    Port ( keccak_in : in  k_row;
			  clk, rst : in  STD_LOGIC;
--           load1 : in  STD_LOGIC;
--           load2 : in  STD_LOGIC;
           absorpt : in  STD_LOGIC;
           keccak_out : out  k_row
           );
    END COMPONENT;
    
	type final_out_slice	is array (0 to 4) of STD_LOGIC_vector(319 downto 0);
	
   --Inputs
   signal keccak_in : k_row := (others => '0');
   signal clk : std_logic := '0';
   signal absorpt : std_logic := '0';
   signal rst : std_logic := '0';
   signal load1 : std_logic := '0';
   signal load2 : std_logic := '0';

 	--Outputs
   signal keccak_out : k_row;
	signal s_out : final_out_slice;
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keccak_fsm PORT MAP (
          keccak_in => keccak_in,
			 clk => clk,
			 rst => rst,
--			 load1 => load1,
--			 load2 => load2,
          absorpt => absorpt,
          keccak_out => keccak_out
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
		absorpt <= '0';
		rst <= '0';
		wait for clk_period;
		absorpt <= '1';
		rst <= '1';
		wait for clk_period*320.5;
		absorpt <= '0';
		rst <= '0';
		wait for clk_period*18110.5;
		for I in 319 downto 0 loop
			s_out(0)(I) <= keccak_out(0);
			s_out(1)(I) <= keccak_out(1);
			s_out(2)(I) <= keccak_out(2);
			s_out(3)(I) <= keccak_out(3);
			s_out(4)(I) <= keccak_out(4);
			wait for clk_period;
		end loop;
		
		if s_out(0) = x"F1258F7940E1DDE7FF97A42D7F8E6FD4EB5AA93F2317D63505E5635A21D9AE61940C7922AE3A2614" then
			report "Output OK!!!!!!!";
		else 
			report "Bad output =(((((";
		end if;
		
		wait for clk_period*20;
		assert false report "Sim finished" severity failure;
			
--      wait for 100 ns;	
--		absorpt <= '0';
--		load1 <= '1';
--      wait for clk_period*18;
--		keccak_in(3)(1) <= '1';
--		wait for clk_period;
--		keccak_in(3)(1) <= '0';
--		keccak_in(1)(1) <= '1';
--		wait for clk_period;
--		keccak_in(1)(1) <= '0';
--		wait for clk_period*3;
--		keccak_in(2)(4) <= '1';
--		wait for clk_period;
--		keccak_in(2)(4) <= '0';
--		wait for clk_period*11;
--		keccak_in(0)(4) <= '1';
--		wait for clk_period;
--		keccak_in(0)(4) <= '0';
--		wait for clk_period*6;
--		keccak_in(1)(4) <= '1';
--		wait for clk_period;
--		keccak_in(1)(4) <= '0';
--		wait for clk_period*5;
--		keccak_in(4)(4) <= '1';
--		wait for clk_period;
--		keccak_in(4)(4) <= '0';
--		wait for clk_period*4;
--		keccak_in(2)(1) <= '1';
--		wait for clk_period;
--		keccak_in(2)(1) <= '0';
--		keccak_in(3)(4) <= '1';
--		wait for clk_period;
--		keccak_in(3)(4) <= '0';
--		wait for clk_period*6;
--		keccak_in(4)(1) <= '1';
--		wait for clk_period;
--		keccak_in(4)(1) <= '0';
--		keccak_in(0)(1) <= '1';
--		wait for clk_period;
--		keccak_in(0)(1) <= '0';
--		keccak_in(0)(0) <= '1';
--		wait for clk_period;
--		keccak_in(0)(0) <= '0';
--		absorpt <= '1';
--		load1 <= '0';
--		wait for clk_period*10;
--		absorpt <= '0';
--		load2 <= '1';
--		wait for clk_period*64;
--		load1 <= '1';
--		wait for clk_period*64;
--		absorpt <= '1';
--		load1 <= '0';
--		load2 <= '0';
--		wait for clk_period*10;
--		absorpt <= '0';
--		wait for clk_period*320;
--		wait for clk_period;
--		wait for clk_period*320;
--		absorpt <= '1';
--      -- insert stimulus here 
		

      wait;
   end process;

END;
