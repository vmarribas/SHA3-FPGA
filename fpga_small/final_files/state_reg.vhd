--////////////////////////////////////////////////////////////////////////////////

--// COMPANY:    COSIC, KU Leuven 
--// AUTHOR:     Victor Arribas

--////////////////////////////////////////////////////////////////////////////////

--// BSD 3-Clause License

--// Copyright (c) 2019, Victor Arribas
--// All rights reserved.

--// Redistribution and use in source and binary forms, with or without
--// modification, are permitted provided that the following conditions are met:

--// 1. Redistributions of source code must retain the above copyright notice, this
--//    list of conditions and the following disclaimer.

--// 2. Redistributions in binary form must reproduce the above copyright notice,
--//    this list of conditions and the following disclaimer in the documentation
--//    and/or other materials provided with the distribution.

--// 3. Neither the name of the copyright holder nor the names of its
--//    contributors may be used to endorse or promote products derived from
--//    this software without specific prior written permission.

--// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
--// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
--// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
--// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
--// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
--// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
--// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
--// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
--// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

--////////////////////////////////////////////////////////////////////////////////

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.keccak_globals.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity state_reg is
    Port ( clk, rst, absorpt : in  STD_LOGIC;
           en_slice : in  k_slice;
           slice_shift : in  STD_LOGIC;
           pi_shift : in  STD_LOGIC;
           keccak_in : in  k_row;
           row_in : in  k_row;
			  first_slice : out  k_slice;
			  last_slice : out  k_slice;
           row_out : out  k_row);
end state_reg;

architecture Behavioral of state_reg is

	constant I0 : BIT_VECTOR(3 downto 0) := X"A";
   constant I1 : BIT_VECTOR(3 downto 0) := X"C";
	
	----------Components------------------
	COMPONENT state_plane
		 Port ( clk : in  STD_LOGIC;
				  en_row : in  k_row;
				  row_in : in  k_row;
				  first_row : out  k_row;
				  row_out : out  k_row);
	end COMPONENT;
	
	------------Signals-------------------
	--Plane 4
	signal row_in_4, row_in_xor_kecc_in, first_row_4, row_out_4 : k_row;
	--Plane 3
	signal row_in_3, first_row_3, row_out_3 : k_row;
	--Plane 2
	signal row_in_2, first_row_2, row_out_2 : k_row;
	--Plane 1
	signal row_in_1, first_row_1, row_out_1 : k_row;
	--Plane 0
	signal row_in_0, first_row_0, row_out_0 : k_row;
	
	--Some control
	signal keccak_in_abs, keccak_in_init : k_row;
	signal not_absorpt : std_logic;
	
begin

	--Output
	row_out <= row_out_0;
	
	first_slice(0) <= first_row_0;
	first_slice(1) <= first_row_1;
	first_slice(2) <= first_row_2;
	first_slice(3) <= first_row_3;
	first_slice(4) <= first_row_4;
	
	last_slice(0) <= row_out_0;
	last_slice(1) <= row_out_1;
	last_slice(2) <= row_out_2;
	last_slice(3) <= row_out_3;
	last_slice(4) <= row_out_4;
	
	--Plane 0 : last row goes out and to the beginning of the 4th lane
	plane_0 : state_plane
	Port map( 
		clk => clk,
		en_row => en_slice(0),
		row_in => row_in_0,
		first_row => first_row_0,
		row_out => row_out_0
	);
	
	--Plane 1
	plane_1 : state_plane
	Port map( 
		clk => clk,
		en_row => en_slice(1),
		row_in => row_in_1,
		first_row => first_row_1,
		row_out => row_out_1
	);
	
	--Plane 2
	plane_2 : state_plane
	Port map( 
		clk => clk,
		en_row => en_slice(2),
		row_in => row_in_2,
		first_row => first_row_2,
		row_out => row_out_2
	);
	
	--Plane 3
	plane_3 : state_plane
	Port map( 
		clk => clk,
		en_row => en_slice(3),
		row_in => row_in_3,
		first_row => first_row_3,
		row_out => row_out_3
	);
	
	--Plane 4 
	plane_4 : state_plane 
	Port map( 
		clk => clk,
		en_row => en_slice(4),
		row_in => row_in_4,
		first_row => first_row_4,
		row_out => row_out_4
	);
	
	
	--Initialize input and xor
	--We always XOR, either with the input or with zero depending if we absorb.
	not_absorpt <= not absorpt;
	abs_input : for I in 0 to 4 generate
		calc_keccak_in_init : AND2B1L 
		port map (DI => keccak_in(I), SRI => not_absorpt, O => keccak_in_abs(I));
	end generate;
	
	xor_input : for I in 0 to 4 generate
		row_in_xor_kecc_in(I) <= row_in(I) xor keccak_in_abs(I);
	end generate;
	--Now, if rst, put it to zero
--	calc_keccak_in_init_0 : AND2B1L 
--	port map (DI => rst, SRI => row_in_xor_kecc_in(0), O => keccak_in_init(0));
--	LUT2_inst : LUT2
--   generic map (
--      INIT => (not I0) and I1)
--   port map (
--      O => keccak_in_init(0),   -- LUT general output
--      I0 => rst, -- LUT input
--      I1 => row_in_xor_kecc_in(0)  -- LUT input
--   );
	rst_input : for I in 0 to 4 generate
		calc_keccak_in_init : AND2B1L 
		port map (DI => row_in_xor_kecc_in(I), SRI => rst, O => keccak_in_init(I));
	end generate;
	
	-- Plane 0
	row_in_0(0) <= row_out_0(0) when (pi_shift = '1') else -- From PI rewiring
--						slice_in(0)(0) when ((slice_shift = '1') and (pi_shift = '0')) else --Loading
						row_out_1(0);
	row_in_0(1) <= row_out_0(1) when ((slice_shift = '1') and (pi_shift = '1')) else 
--						slice_in(0)(1) when ((slice_shift = '1') and (pi_shift = '0')) else --Loading
						row_out_1(1); -- From PI rewiring !!! OUT
	row_in_0(2) <= row_out_2(2) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_0(2) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(0)(2) when ((slice_shift = '1') and (pi_shift = '0')) else --Loading
						row_out_1(2);
	row_in_0(3) <= row_out_3(3) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_0(3) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(0)(3) when ((slice_shift = '1') and (pi_shift = '0')) else --Loading
						row_out_1(3);
	row_in_0(4) <= row_out_4(4) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_0(4) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(0)(4) when ((slice_shift = '1') and (pi_shift = '0')) else --Loading
						row_out_1(4);
						
	-- Plane 1
	row_in_1(0) <= row_out_0(3) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_1(0) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(1)(0) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_2(0);
	row_in_1(1) <= row_out_1(4) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring 
						row_out_1(1) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(1)(1) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_2(1);
	row_in_1(2) <= row_out_2(0) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_1(2) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(1)(2) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_2(2);
	row_in_1(3) <= row_out_3(1) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_1(3) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(1)(3) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_2(3);
	row_in_1(4) <= row_out_4(2) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_1(4) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(1)(4) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_2(4);
						
	-- Plane 2
	row_in_2(0) <= row_out_0(1) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_2(0) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(2)(0) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_3(0);
	row_in_2(1) <= row_out_1(2) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring 
						row_out_2(1) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(2)(1) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_3(1);
	row_in_2(2) <= row_out_2(3) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_2(2) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(2)(2) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_3(2);
	row_in_2(3) <= row_out_3(4) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_2(3) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(2)(3) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_3(3);
	row_in_2(4) <= row_out_4(0) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_2(4) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(2)(4) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_3(4);

	-- Plane 3
	row_in_3(0) <= row_out_0(4) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_3(0) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(3)(0) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_4(0);
	row_in_3(1) <= row_out_1(0) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring 
						row_out_3(1) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(3)(1) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_4(1);
	row_in_3(2) <= row_out_2(1) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_3(2) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(3)(2) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_4(2);
	row_in_3(3) <= row_out_3(2) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_3(3) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(3)(3) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_4(3);
	row_in_3(4) <= row_out_4(3) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_3(4) when ((slice_shift = '1') and (pi_shift = '1')) else
--						slice_in(3)(4) when ((slice_shift = '1') and (pi_shift = '0')) else
						row_out_4(4);		

	-- Plane 4
	row_in_4(0) <= row_out_0(2) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_4(0) when ((slice_shift = '1') and (pi_shift = '1')) else
--						row_in_xor_kecc_in(0) when ((slice_shift = '1') and (pi_shift = '0')) else --Absorption
						keccak_in_init(0); -- Computation from theta or chi
	row_in_4(1) <= row_out_1(3) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring 
						row_out_4(1) when ((slice_shift = '1') and (pi_shift = '1')) else
--						row_in_xor_kecc_in(1) when ((slice_shift = '1') and (pi_shift = '0')) else --Absorption
						keccak_in_init(1);-- Computation from theta or chi
	row_in_4(2) <= row_out_2(4) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_4(2) when ((slice_shift = '1') and (pi_shift = '1')) else
--						row_in_xor_kecc_in(2) when ((slice_shift = '1') and (pi_shift = '0')) else --Absorption
						keccak_in_init(2);-- Computation from theta or chi
	row_in_4(3) <= row_out_3(0) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_4(3) when ((slice_shift = '1') and (pi_shift = '1')) else
--						row_in_xor_kecc_in(3) when ((slice_shift = '1') and (pi_shift = '0')) else --Absorption
						keccak_in_init(3);-- Computation from theta or chi
	row_in_4(4) <= row_out_4(1) when ((slice_shift = '0') and (pi_shift = '1')) else -- From PI rewiring
						row_out_4(4) when ((slice_shift = '1') and (pi_shift = '1')) else
--						row_in_xor_kecc_in(4) when ((slice_shift = '1') and (pi_shift = '0')) else --Absorption
						keccak_in_init(4);-- Computation from theta or chi
						
end Behavioral;

