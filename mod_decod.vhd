----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:54 05/15/2023 
-- Design Name: 
-- Module Name:    mod_decod - Behavioral 
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

entity mod_decod is
	port(
			Enable: in std_logic;
			E: in std_logic_vector(0 to 2);
			S: out std_logic_vector(0 to 7);
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
end mod_decod;

architecture Behavioral of mod_decod is

	component decod3x8 is
		port(
			Enable: in std_logic;
			E: in std_logic_vector(0 to 2);
			S: out std_logic_vector(0 to 7)
		);
	end component;
	
	component decod7seg_4dig is
		port ( 
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

	D1: decod3x8 port map (
			Enable => Enable,
			E(0) => E(0),
			E(1) => E(1),
			E(2) => E(2),
			S(0) => S(0),
			S(1) => S(1),
			S(2) => S(2),
			S(3) => S(3),
			S(4) => S(4),
			S(5) => S(5),
			S(6) => S(6),
			S(7) => S(7)
	);
	
	D2: decod7seg_4dig port map(
			N0(0) => E(0),
			N0(1) => E(1),
			N0(2) => E(2),
			N0(3) => '0',
			N1 => "0000",
			N2 => "0000",
			N3 => "0000",
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

