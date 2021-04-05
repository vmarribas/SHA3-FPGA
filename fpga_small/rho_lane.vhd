----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:44:28 02/01/2019 
-- Design Name: 
-- Module Name:    rho_lane - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
library work;
use work.keccak_globals.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rho_lane is
    Port ( count_reg : in  unsigned(9 downto 0);
           state_rho_en : out  k_slice);
end rho_lane;

architecture Behavioral of rho_lane is

begin
	
	--Plane 0
	state_rho_en(0)(0) <= '0';
	state_rho_en(0)(1) <= '1' when (count_reg = 319) else '0';
	state_rho_en(0)(2) <= '1' when (count_reg < 381) else '0';
	state_rho_en(0)(3) <= '1' when (count_reg < 347) else '0';
	state_rho_en(0)(4) <= '1' when (count_reg < 346) else '0';
	
	--Plane 1
	state_rho_en(1)(0) <= '1' when (count_reg < 319 + 36) else '0';-- 355
	state_rho_en(1)(1) <= '1' when (count_reg < 319 + 44) else '0';-- 363
	state_rho_en(1)(2) <= '1' when (count_reg < 319 + 6) else '0';-- 325
	state_rho_en(1)(3) <= '1' when (count_reg < 319 + 55) else '0';-- 374
	state_rho_en(1)(4) <= '1' when (count_reg < 319 + 20) else '0';-- 339
	
	--Plane 2
	state_rho_en(2)(0) <= '1' when (count_reg < 319 + 3) else '0';-- 322
	state_rho_en(2)(1) <= '1' when (count_reg < 319 + 10) else '0';-- 329
	state_rho_en(2)(2) <= '1' when (count_reg < 319 + 43) else '0';-- 362
	state_rho_en(2)(3) <= '1' when (count_reg < 319 + 25) else '0';-- 344
	state_rho_en(2)(4) <= '1' when (count_reg < 319 + 39) else '0';-- 358
	
	--Plane 3
	state_rho_en(3)(0) <= '1' when (count_reg < 319 + 41) else '0';-- 360
	state_rho_en(3)(1) <= '1' when (count_reg < 319 + 45) else '0';-- 364
	state_rho_en(3)(2) <= '1' when (count_reg < 319 + 15) else '0';--334
	state_rho_en(3)(3) <= '1' when (count_reg < 319 + 21) else '0';--340
	state_rho_en(3)(4) <= '1' when (count_reg < 319 + 8) else '0';--327
	
	--Plane 4
	state_rho_en(4)(0) <= '1' when (count_reg < 319 + 18) else '0';-- 337
	state_rho_en(4)(1) <= '1' when (count_reg < 319 + 2) else '0';-- 321
	state_rho_en(4)(2) <= '1' when (count_reg < 319 + 61) else '0';-- 380
	state_rho_en(4)(3) <= '1' when (count_reg < 319 + 56) else '0';-- 375
	state_rho_en(4)(4) <= '1' when (count_reg < 319 + 14) else '0';-- 333

end Behavioral;

