----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:14:42 02/06/2019 
-- Design Name: 
-- Module Name:    theta_fpga - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity theta_fpga is
    Port ( clk, absorpt : in std_logic;
			  count_reg : in  unsigned(5 downto 0);
			  first_slice : in  k_slice;
			  state_row_out : in  k_row;
			  eq_62 : in  std_logic;
			  eq_63 : in  std_logic;
			  sm_64 : in  std_logic;
			  eq_765 : in  std_logic;
			  eq_766 : in  std_logic;
			  eq_767 : in  std_logic;
           theta_out : out  k_row);
end theta_fpga;

architecture Behavioral of theta_fpga is

	constant I0 : BIT_VECTOR(63 downto 0) := X"AAAAAAAAAAAAAAAA";
   constant I1 : BIT_VECTOR(63 downto 0) := X"CCCCCCCCCCCCCCCC";
   constant I2 : BIT_VECTOR(63 downto 0) := X"F0F0F0F0F0F0F0F0";
   constant I3 : BIT_VECTOR(63 downto 0) := X"FF00FF00FF00FF00";
   constant I4 : BIT_VECTOR(63 downto 0) := X"FFFF0000FFFF0000";
   constant I5 : BIT_VECTOR(63 downto 0) := X"FFFFFFFF00000000";

	component theta_row
		 Port ( theta_row_in : in  k_row;
				  parity_this : in k_row;
				  parity_prev : in k_row;
				  theta_row_out : out  k_row
				 );
	end component;
	
	component theta_parity_adresses
		 Port ( clk : in  STD_LOGIC;
				  we : in  STD_LOGIC;
				  parity_row_in : in  k_row;
				  address : in  STD_LOGIC_VECTOR(5 downto 0);
				  parity_row_out : out  k_row);
	end component;
	
	component slice_parity
		 Port ( slice_p_in : in  k_slice;
				  parity_out : out  k_row);
	end component;
	
	signal parity_last_next, parity_last_reg : k_row;
	signal parity_second_last_next, parity_second_last_reg : k_row;
	signal parity_next, parity_reg : k_row;
	signal parity_reg_next, parity_reg_reg : k_row;
	signal parity_saved : k_row;
	signal address_parity : std_logic_vector(5 downto 0);
	signal parity_this, parity_prev, parity_out : k_row; --Choose the stored parity from the last slice to use in the first one
	signal slice_p_in : k_slice;
	
	signal stop_state_last_parity : std_logic;
	signal we_parity_mem : std_logic;
	
	signal we_parity_mem_OR_absorpt : std_logic;
	signal eq_67_OR_absorpt : std_logic;
	
	signal sm_63 :std_logic;
	
begin

	get_parity_theta_prev : slice_parity
	Port map( 
		slice_p_in => first_slice,
		parity_out => parity_out
	);
	
	or_latch_we_parity_mem_OR_absorpt : OR2L --Place them together in the same slice!!
	port map (DI => we_parity_mem, SRI => absorpt, O => we_parity_mem_OR_absorpt);
	or_latch_eq_67_OR_absorpt : OR2L
	port map (DI => eq_767, SRI => absorpt, O => eq_67_OR_absorpt);
	
--	parity_next <= parity_out when ((we_parity_mem = '1') or (absorpt = '1')) else parity_saved;
	parity_next <= parity_out when (we_parity_mem_OR_absorpt = '1') else parity_saved;
	
	parity_reg_next <= parity_reg;
	
	theta_perm : theta_row
	Port map( 
		theta_row_in => state_row_out,
		parity_this => parity_this,
		parity_prev => parity_prev,
		theta_row_out => theta_out
	);
	parity_this <= parity_reg_reg when (we_parity_mem = '1') else 
						parity_last_reg when (eq_63 = '1') else
						parity_reg;
	parity_prev <= parity_last_reg when (eq_62 = '1') else
						parity_reg when (we_parity_mem = '1') else
						parity_saved;
	--Save the last slice parity until the first one arrives
--	parity_last_next <= parity_reg_reg when ((eq_767 = '1') or (absorpt='1')) else parity_last_reg;
	parity_last_next <= parity_reg_reg when (eq_67_OR_absorpt = '1') else parity_last_reg;
	
	--Save the parities
	we_parity_mem <= '1' when ((sm_63 = '1') or (eq_765 = '1') or (eq_766 = '1') or (eq_767 = '1')) else '0';
	address_parity <= std_logic_vector(count_reg(5 downto 0)+1)when (we_parity_mem = '1') else 
							std_logic_vector(count_reg(5 downto 0)+2);
	parities : theta_parity_adresses 
	Port map( 
		clk => clk,
		we => we_parity_mem,
		parity_row_in => parity_reg_reg,
		address => address_parity,
		parity_row_out => parity_saved
	);
	
	--Compute smaller than 63
	calc_sm_63 : AND2B1L 
	port map (DI => sm_64, SRI => eq_63, O => sm_63);
	
	
	regs_proc: process(clk)
   begin		
      -- hold reset state for 100 ns.
      if rising_edge(clk) then
			parity_reg <= parity_next;
			parity_reg_reg <= parity_reg_next;
			parity_last_reg <= parity_last_next;
		end if;
	end process;


end Behavioral;


--	parity_next_LUTs : for I in 0 to 1 generate	
--		LUT6_2_parity_next : LUT6_2
--		generic map (
--			INIT => (((not I5) and ((I0 and I1) or ((not I0) and I2)))) or 
--						 (I5 and ((I0 and I3) or ((not I0) and I4))) ) -- Specify LUT Contents
--		port map (
--			O6 => parity_next(I+2),  -- 6/5-LUT output (1-bit)
--			O5 => parity_next(I),  -- 5-LUT output (1-bit)
--			I0 => we_parity_mem_OR_absorpt,   -- LUT input (1-bit)
--			I1 => parity_out(I),   -- LUT input (1-bit)
--			I2 => parity_saved(I),   -- LUT input (1-bit)
--			I3 => parity_out(I+2),   -- LUT input (1-bit)
--			I4 => parity_saved(I+2),   -- LUT input (1-bit)
--			I5 => '1'    -- LUT input (1-bit)
--		);
--	end generate;
--	LUT6_2_parity_next : LUT6_2
--	generic map (
--		INIT => (((not I5) and ((I0 and I1) or ((not I0) and I2)))) or 
--					 (I5 and ((I0 and I3) or ((not I0) and I4))) ) -- Specify LUT Contents
--	port map (
--		O6 => parity_next(1),  -- 6/5-LUT output (1-bit)
--		O5 => parity_next(0),  -- 5-LUT output (1-bit)
--		I0 => we_parity_mem_OR_absorpt,   -- LUT input (1-bit)
--		I1 => parity_out(0),   -- LUT input (1-bit)
--		I2 => parity_saved(0),   -- LUT input (1-bit)
--		I3 => parity_out(1),   -- LUT input (1-bit)
--		I4 => parity_saved(1),   -- LUT input (1-bit)
--		I5 => '1'    -- LUT input (1-bit)
--	);
--	LUT6_2_parity_next2 : LUT6_2
--	generic map (
--		INIT => (((not I5) and ((I0 and I1) or ((not I0) and I2)))) or 
--					 (I5 and ((I0 and I3) or ((not I0) and I4))) ) -- Specify LUT Contents
--	port map (
--		O6 => parity_next(3),  -- 6/5-LUT output (1-bit)
--		O5 => parity_next(2),  -- 5-LUT output (1-bit)
--		I0 => we_parity_mem_OR_absorpt,   -- LUT input (1-bit)
--		I1 => parity_out(2),   -- LUT input (1-bit)
--		I2 => parity_saved(2),   -- LUT input (1-bit)
--		I3 => parity_out(3),   -- LUT input (1-bit)
--		I4 => parity_saved(3),   -- LUT input (1-bit)
--		I5 => '1'    -- LUT input (1-bit)
--	);
--	parity_next(4) <= parity_out(4) when (we_parity_mem_OR_absorpt = '1') else parity_saved(4);

