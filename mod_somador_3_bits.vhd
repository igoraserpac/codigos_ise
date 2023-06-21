----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:10:02 05/31/2023 
-- Design Name: 
-- Module Name:    mod_somador_3_bits - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_somador_3_bits is

     port(
			A: in std_logic_vector(2 downto 0);
			B: in std_logic_vector(2 downto 0);
			CLK_50MHz : in std_logic;
		   CA : out  STD_LOGIC;
		   CB : out  STD_LOGIC;
		   CC : out  STD_LOGIC;
		   CD : out  STD_LOGIC;
		   CE : out  STD_LOGIC;
		   CF : out  STD_LOGIC;
		   CG : out  STD_LOGIC;
		   DP : out  STD_LOGIC;
		   AN0 : out  STD_LOGIC;
		   AN1 : out  STD_LOGIC;
		   AN2 : out  STD_LOGIC;
		   AN3 : out  STD_LOGIC
		);

end mod_somador_3_bits;

architecture Behavioral of mod_somador_3_bits is

	signal f1: std_logic_vector(3 downto 0);

	component somador_3_bits is
		port(
			A: in std_logic_vector(2 downto 0);
			B: in std_logic_vector(2 downto 0);
			R : out std_logic_vector(3 downto 0)
		); 
	end component;
	
	component decod7seg_4dig is
		port( 
			  N0 : in  std_logic_vector(3 downto 0);
			  N1 : in  std_logic_vector(3 downto 0);
			  N2 : in  std_logic_vector(3 downto 0);
			  N3 : in  std_logic_vector(3 downto 0);
			  CLK_50MHz : in std_logic;
			  CA : out  STD_LOGIC;
			  CB : out  STD_LOGIC;
			  CC : out  STD_LOGIC;
			  CD : out  STD_LOGIC;
			  CE : out  STD_LOGIC;
			  CF : out  STD_LOGIC;
			  CG : out  STD_LOGIC;
			  DP : out  STD_LOGIC;
			  AN0 : out  STD_LOGIC;
			  AN1 : out  STD_LOGIC;
			  AN2 : out  STD_LOGIC;
			  AN3 : out  STD_LOGIC
		);
	end component;
	
begin

	D1: somador_3_bits port map(
		A(0) => A(0),
		A(1) => A(1),
		A(2) => A(2),
		B(0) => B(0),
		B(1) => B(1),
		B(2) => B(2),
		R => f1
	);
	
	D2: decod7seg_4dig port map(
		N0 => f1,
		N1 => "0000",
		N2(0) => B(0),
		N2(1) => B(1),
		N2(2) => B(2),
		N2(3) => '0',
		N3(0) => A(0),
		N3(1) => A(1),
		N3(2) => A(2),
		N3(3) => '0',
		CLK_50MHz => CLK_50MHz,
		CA => CA,
		CB => CB,
		CC => CC,
		CD => CD,
		CE => CE,
		CF => CF,
		CG => CG,
		DP => DP,
		AN0 => AN0,
		AN1 => AN1,
		AN2 => AN2,
		AN3 => AN3 
		
	);
		

end Behavioral;

