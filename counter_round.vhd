library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter_round is 
port(R: in std_logic;
	  E : in std_logic;
	  clock: in std_logic;
	  end_round: out std_logic;
	  X : out std_logic_vector(3 downto 0));
end counter_round;

architecture bhv of counter_time is
signal conta: std_logic_vector(3 downto 0);
begin
	P1: process(clock, R, E)
	begin
		if R = '1' then 
			conta <= "0000";
			end_round <= '0';
		
		elsif E = '1' then
			if clock'event and clock= '1' then
				if conta = "1111" then 
					end_round <= '1';
				else 
					conta <= conta + 1; 
					end_round <= '0';
				end if;
			end if;
		end if;
		end process;
	X <= conta;
end bhv;
