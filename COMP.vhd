library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity COMP is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           E : out STD_LOGIC);
end COMP;

architecture Behavioral of COMP is
begin
    process(A, B)
    begin
        if A = B then
            E <= '1';
        else
            E <= '0';
        end if;
    end process;
end Behavioral;
