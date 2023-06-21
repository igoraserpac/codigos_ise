----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:26:01 05/08/2023 
-- Design Name: 
-- Module Name:    decod3x8 - Behavioral 
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

entity decod3x8 is

		port(
			Enable: in std_logic;
			E: in std_logic_vector(2 downto 0);
			S: out std_logic_vector(7 downto 0)
		);


end decod3x8;

architecture Behavioral of decod3x8 is	

begin

	S(0) <= ((not Enable) or E(0)) or (E(1) or E(2));
	S(1) <= ((not Enable) or E(0)) or (E(1) or (not E(2)));
	S(2) <= ((not Enable) or E(0)) or ((not E(1)) or E(2));
	S(3) <= ((not Enable) or E(0)) or ((not E(1)) or (not E(2)));
	S(4) <= ((not Enable) or (not E(0))) or (E(1) or E(2));
	S(5) <= ((not Enable) or (not E(0))) or (E(1) or (not E(2)));
	S(6) <= ((not Enable) or (not E(0))) or ((not E(1)) or E(2));
	S(7) <= ((not Enable) or (not E(0))) or ((not E(1)) or (not E(2)));

end Behavioral;

