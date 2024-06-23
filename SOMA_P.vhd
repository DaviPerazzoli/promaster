library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SOMA_P is
    Port ( P0 : in STD_LOGIC;
           P1 : in STD_LOGIC;
           P2 : in STD_LOGIC;
           P3 : in STD_LOGIC;
           P : out STD_LOGIC_VECTOR (2 downto 0));
end SOMA_P;

architecture Behavioral of SOMA_P is
begin
    process(P0, P1, P2, P3)
    begin
        P <= std_logic_vector(to_unsigned(to_integer(unsigned(P0 & P1 & P2 & P3)), 3));
    end process;
end Behavioral;
