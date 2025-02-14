library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter_time is 
port( R: in std_logic;
		clock: in std_logic;
		E: in std_logic;
		tempo: out std_logic_vector(3 downto 0);
		fim_tempo: out std_logic);
end counter_time;

architecture bhv of counter_time is
signal conta: std_logic_vector(3 downto 0);
begin
	P1: process(clock, R, E)
	begin
		if R = '1' then 
			conta <= "1001";
			fim_tempo <= '0';
		
		elsif E = '1' then
			if clock'event and clock= '1' then
				if conta = "0000" then fim_tempo <= '1';
				else conta <= conta - 1; fim_tempo <= '0';
				end if;
			end if;
		end if;
		end process;
	tempo <= conta;
end bhv;
