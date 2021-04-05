----------------------------------------------------------------------------------
-- Company: COSIC	
-- Engineer: Victor Arribas
-- 
-- Create Date:    14:15:55 01/29/2019 
-- Design Name: 
-- Module Name:    state_plane - Behavioral 
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
Library UNISIM;
use UNISIM.vcomponents.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-- 5x 64-bit SRL, defining the shift registers for a plane
entity state_plane is
    Port ( clk : in  STD_LOGIC;
           en_row : in  k_row;
           row_in : in  k_row;
			  first_row : out k_row;
           row_out : out  k_row);
end state_plane;

architecture Behavioral of state_plane is

	constant ADDRESS_SLICE_OUT : std_logic_vector(4 downto 0) := "11101";

	signal Q_4, Q_3, Q_2, Q_1, Q_0 : std_logic;
	
	signal Q31_4_1, Q31_3_1, Q31_2_1, Q31_1_1, Q31_0_1 : std_logic;
	
begin

	--Output
	first_row(0) <= Q_0;
	first_row(1) <= Q_1;
	first_row(2) <= Q_2;
	first_row(3) <= Q_3;
	first_row(4) <= Q_4;

	-- Lane 0
	SRLC32E_inst_0_1 : SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => open,        -- SRL data output
      Q31 => Q31_0_1,    -- SRL cascade output pin
      A => (others => '0'),        -- 5-bit shift depth select input
      CE => en_row(0),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => row_in(0)         -- SRL data input
   );
	SRLC32E_inst_0_2: SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => Q_0,        -- SRL data output
      Q31 => row_out(0),    -- SRL cascade output pin
      A => ADDRESS_SLICE_OUT,        -- 5-bit shift depth select input
      CE => en_row(0),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => Q31_0_1         -- SRL data input
   );
	
	
	-- Lane 1
	SRLC32E_inst_1_1 : SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => open,        -- SRL data output
      Q31 => Q31_1_1,    -- SRL cascade output pin
      A => (others => '0'),        -- 5-bit shift depth select input
      CE => en_row(1),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => row_in(1)         -- SRL data input
   );
	SRLC32E_inst_1_2: SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => Q_1,        -- SRL data output
      Q31 => row_out(1),    -- SRL cascade output pin
      A => ADDRESS_SLICE_OUT,        -- 5-bit shift depth select input
      CE => en_row(1),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => Q31_1_1         -- SRL data input
   );
	
	
	
	-- Lane 2
	SRLC32E_inst_2_1 : SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => open,        -- SRL data output
      Q31 => Q31_2_1,    -- SRL cascade output pin
      A => (others => '0'),        -- 5-bit shift depth select input
      CE => en_row(2),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => row_in(2)         -- SRL data input
   );
	SRLC32E_inst_2_2: SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => Q_2,        -- SRL data output
      Q31 => row_out(2),    -- SRL cascade output pin
      A => ADDRESS_SLICE_OUT,        -- 5-bit shift depth select input
      CE => en_row(2),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => Q31_2_1         -- SRL data input
   );
	
	
	-- Lane 3
	SRLC32E_inst_3_1 : SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => open,        -- SRL data output
      Q31 => Q31_3_1,    -- SRL cascade output pin
      A => (others => '0'),        -- 5-bit shift depth select input
      CE => en_row(3),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => row_in(3)         -- SRL data input
   );
	SRLC32E_inst_3_2: SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => Q_3,        -- SRL data output
      Q31 => row_out(3),    -- SRL cascade output pin
      A => ADDRESS_SLICE_OUT,        -- 5-bit shift depth select input
      CE => en_row(3),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => Q31_3_1         -- SRL data input
   );
	
	
	-- Lane 4
	SRLC32E_inst_4_1 : SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => open,        -- SRL data output
      Q31 => Q31_4_1,    -- SRL cascade output pin
      A => (others => '0'),        -- 5-bit shift depth select input
      CE => en_row(4),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => row_in(4)         -- SRL data input
   );
	SRLC32E_inst_4_2: SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => Q_4,        -- SRL data output
      Q31 => row_out(4),    -- SRL cascade output pin
      A => ADDRESS_SLICE_OUT,        -- 5-bit shift depth select input
      CE => en_row(4),      -- Clock enable input
      CLK => clk,    -- Clock input
      D => Q31_4_1         -- SRL data input
   );


end Behavioral;

--	RAM64M_inst : RAM64M
--   generic map (
--      INIT_A => X"0000000000000000",   -- Initial contents of A port
--      INIT_B => X"0000000000000000",   -- Initial contents of B port
--      INIT_C => X"0000000000000000",   -- Initial contents of C port
--      INIT_D => X"0000000000000000")    -- Initial contents of D port
--   port map (
--      DOA => keccak_out(0), -- Read port A 1-bit output
--      DOB => keccak_out(1), -- Read port B 1-bit output
--      DOC => keccak_out(2), -- Read port C 1-bit output
--      DOD => keccak_out(3), -- Read/Write port D 1-bit output
--      ADDRA => std_logic_vector(count_reg(5 downto 0)),   -- Read port A 6-bit address input
--      ADDRB => std_logic_vector(count_reg(5 downto 0)),   -- Read port B 6-bit address input
--      ADDRC => std_logic_vector(count_reg(5 downto 0)),   -- Read port C 6-bit address input
--      ADDRD => std_logic_vector(count_reg(5 downto 0)),   -- Read/Write port D 6-bit address input
--      DIA => keccak_in(0), -- RAM 1-bit data write input addressed by ADDRD,
--                  -- read addressed by ADDRA
--      DIB => keccak_in(1), -- RAM 1-bit data write input addressed by ADDRD,
--                  -- read addressed by ADDRB
--      DIC => keccak_in(2), -- RAM 1-bit data write input addressed by ADDRD,
--                  -- read addressed by ADDRC
--      DID => keccak_in(3), -- RAM 1-bit data write input addressed by ADDRD,
--                  -- read addressed by ADDRD
--      WCLK => clk,  -- Write clock input
--      WE => w_en       -- Write enable input
--   );
--	
--	RAM64X1S_inst : RAM64X1S
--   generic map (
--      INIT => X"0000000000000000")
--   port map (
--      O => keccak_out(4),        -- 1-bit data output
--      A0 => count_reg(0),      -- Address[0] input bit
--      A1 => count_reg(1),      -- Address[1] input bit
--      A2 => count_reg(2),      -- Address[2] input bit
--      A3 => count_reg(3),      -- Address[3] input bit
--      A4 => count_reg(4),      -- Address[4] input bit
--      A5 => count_reg(5),      -- Address[5] input bit
--      D => keccak_in(4),        -- 1-bit data input
--      WCLK => clk,  -- Write clock input
--      WE => w_en      -- Write enable input
--   );
--	w_en <= (not count_reg(6)) and (not rst);