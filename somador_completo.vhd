----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:15 05/31/2023 
-- Design Name: 
-- Module Name:    somador_completo - Behavioral 
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

entity somador_completo is

	port(
		A: in std_logic;
		B: in std_logic;
		Vem: in std_logic;
		S: out std_logic;
		Vai: out std_logic
	);

end somador_completo;

architecture Behavioral of somador_completo is

begin

	S <= ((not A) and (not B) and (Vem)) or ((not A) and B and (not Vem)) or (A and (not B) and (not vem)) or (A and B and Vem);
	Vai <= (B and Vem) or (A and B) or (A and Vem);

end Behavioral;

