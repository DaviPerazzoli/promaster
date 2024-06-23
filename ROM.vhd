library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (5 downto 0);
           data : out STD_LOGIC_VECTOR (15 downto 0));
end ROM;

architecture Behavioral of ROM is
    type ROM_TYPE is array (0 to 63) of STD_LOGIC_VECTOR(15 downto 0);
    signal ROM : ROM_TYPE := (
        -- Inicializar o ROM com os valores desejados
        x"0000", x"0001", x"0002", -- etc.
        others => x"0000" -- valores padrão
    );
begin
    process(address)
    begin
        data <= ROM(to_integer(unsigned(address)));
    end process;
end Behavioral;
