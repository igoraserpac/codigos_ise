----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:42:29 05/31/2023 
-- Design Name: 
-- Module Name:    somador_3_bits - Behavioral 
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

entity somador_3_bits is

	port(
		A: in std_logic_vector(2 downto 0);
		B: in std_logic_vector(2 downto 0);
		R : out std_logic_vector(3 downto 0)
	); 

end somador_3_bits;

architecture Behavioral of somador_3_bits is

	signal f1: std_logic;
	signal f2: std_logic;
	
	component somador_completo is
		port(
			A: in std_logic;
			B: in std_logic;
			Vem: in std_logic;
			S: out std_logic;
			Vai: out std_logic
		);
	end component;
	
begin

	P0: somador_completo port map (
			A => A(0),
			B => B(0),
			Vem => '0',
			S => R(0),
			Vai => f1
	);
	
	P1: somador_completo port map (
			A => A(1),
			B => B(1),
			Vem => f1,
			S => R(1),
			Vai => f2
	);
	
	P2: somador_completo port map (
			A => A(2),
			B => B(2),
			Vem => f2,
			S => R(2),
			Vai => R(3)
	);

end Behavioral;

