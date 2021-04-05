-- The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
-- Michaël Peeters and Gilles Van Assche. For more information, feedback or
-- questions, please refer to our website: http://keccak.noekeon.org/

-- Implementation by the designers,
-- hereby denoted as "the implementer".

-- To the extent possible under law, the implementer has waived all copyright
-- and related or neighboring rights to the source code in this file.
-- http://creativecommons.org/publicdomain/zero/1.0/

--////////////////////////////////////////////////////////////////////////////////

--// COMPANY:    COSIC, KU Leuven 
--// AUTHOR:     Victor Arribas

--////////////////////////////////////////////////////////////////////////////////

library STD;
 use STD.textio.all;
library ieee;
use ieee.std_logic_1164.all;
    

library work;


package keccak_globals is


constant num_plane : integer := 5;
constant num_sheet : integer := 5;
constant logD : integer := 4;
--Keccak-f 200
--constant N : integer := 8;
--constant ROUNDS : integer := 17;
--Keccak-f 400
--constant N : integer := 16;
--constant ROUNDS : integer := 19;
--Keccak-f 800
--constant N : integer := 32;
--constant ROUNDS : integer := 21;
--Keccak-f 1600
constant N : integer := 64;
constant ROUNDS : integer := 23;


constant N_p : integer := 32;


--types
-- type k_lane        is  array ((N-1) downto 0)  of std_logic;    
-- type k_plane        is array (0 to (num_sheet-1))  of k_lane;    
-- type k_state        is array (0 to (num_plane-1))  of k_plane;  
	type T_DATA is array (0 to 24) of std_logic_vector(0 to 63);

	type k_row 		is array (0 to 4) of std_logic;
	type k_slice	is array (0 to (num_plane-1)) of k_row; 
	type k_plane	is array ((N-1) downto 0) of k_row;
	

constant RC : T_DATA :=
	(x"0000000000000001",
	 x"0000000000008082",
	 x"800000000000808A",
	 x"8000000080008000",
	 x"000000000000808B",
	 x"0000000080000001",
	 x"8000000080008081",
	 x"8000000000008009",
	 x"000000000000008A",
	 x"0000000000000088",
	 x"0000000080008009",
	 x"000000008000000A",
	 x"000000008000808B",
	 x"800000000000008B",
	 x"8000000000008089",
	 x"8000000000008003",
	 x"8000000000008002",
	 x"8000000000000080",
	 x"000000000000800A",
	 x"800000008000000A",
	 x"8000000080008081",
	 x"8000000000008080",
	 x"0000000080000001",
	 x"8000000080008008",
	 x"0000000000000000");

end package;
