library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp4 IS
PORT (P: IN STD_LOGIC_VECTOR(2 DOWNTO 0) ;
		Peq4: OUT STD_LOGIC ) ;
END comp4;

architecture Behavioral of comp4 is
begin
    process(P)
    begin
        if P = "100" then
            Peq4 <= '1';
        else
            Peq4 <= '0';
        end if;
    end process;
end Behavioral;