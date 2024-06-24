library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity somadormaior is
    Port ( P0 : in STD_LOGIC;
           P1 : in STD_LOGIC;
           P2 : in STD_LOGIC;
           P3 : in STD_LOGIC;
           P : out STD_LOGIC_VECTOR (2 downto 0));
end somadormaior;

architecture Behavioral of somadormaior is
signal P0_3, P1_3, P2_3, P3_3: std_logic_vector(2 downto 0);
begin
    P0_3 <= "00" & P0;
	 P1_3 <= "00" & P1;
	 P2_3 <= "00" & P2;
	 P3_3 <= "00" & P3;
	 
	 P <= P0_3 + P1_3 + P2_3 + P3_3;
end Behavioral;
