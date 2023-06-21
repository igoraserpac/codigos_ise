----------------------------------------------------------------------------------
-- Company: UFSJ 
-- Engineer: Milene
-- Create Date:    10/05/2022 
-- Module Name:    decod7seg - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decod7seg_4dig is
    port ( N0 : in  std_logic_vector(3 downto 0);
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

end decod7seg_4dig;

architecture Behavioral of decod7seg_4dig is
	signal N : std_logic_vector(3 downto 0);
	signal AN : std_logic_vector(3 downto 0);   
begin
	AN0 <= AN(0);
	AN1 <= AN(1);
	AN2 <= AN(2);
	AN3 <= AN(3);
	
	process (CLK_50MHz)
		variable display : std_logic_vector(0 to 6);
	begin	
		case N is
        when "0000" => display := "0000001";  -- '0'
        when "0001" => display := "1001111";  -- '1'
        when "0010" => display := "0010010";  -- '2'
        when "0011" => display := "0000110";  -- '3'
        when "0100" => display := "1001100";  -- '4' 
        when "0101" => display := "0100100";  -- '5'
        when "0110" => display := "0100000";  -- '6'
        when "0111" => display := "0001111";  -- '7'
        when "1000" => display := "0000000";  -- '8'
        when "1001" => display := "0000100";  -- '9'
        when "1010" => display := "0001000";  -- 'A'
        when "1011" => display := "1100000";  -- 'b'
        when "1100" => display := "0110001";  -- 'C'
        when "1101" => display := "1000010";  -- 'd'
        when "1110" => display := "0110000";  -- 'E'
        when "1111" => display := "0111000";  -- 'F'
		  when others => display := "1111111";
		end case;
		
		CA <= display(0);
		CB <= display(1);
		CC <= display(2);
		CD <= display(3);
		CE <= display(4);
		CF <= display(5);
		CG <= display(6);

		DP  <= '0';
	end process;
	

	frequency_divider: process (CLK_50MHz) 
		constant divisor : integer := 100000; -- 2ms
		variable counter : integer range 0 to divisor := 0;
		variable display_digit : std_logic_vector(1 downto 0);
	begin
		if rising_edge(CLK_50MHz) then
			if (counter = divisor) then
				case display_digit is
					when "00" => 						
						N <= N0;
						AN <= "1110";
						display_digit := "01";
					when "01" => 
						AN <= "1101";
						N <= N1;
						display_digit := "10";
					when "10" => 
						AN <= "1011";
						N <= N2;
						display_digit := "11";
					when others => 
						AN <= "0111";
						N <= N3;
						display_digit := "00";
				end case;
				counter := 0;
			else
				if counter < divisor then				
					counter := counter + 1;
				end if;
			end if;
		end if;
	end process;
    
end Behavioral;