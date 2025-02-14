library ieee;
use IEEE.Std_Logic_1164.all;

entity multiplexador16 is	
port (F1: in  std_logic_vector(15 downto 0);
		F2: in  std_logic_vector(15 downto 0);
		F3: in  std_logic_vector(15 downto 0);
		F4: in  std_logic_vector(15 downto 0);
		sel: in  std_logic_vector(1 downto 0);
		F: out  std_logic_vector(15 downto 0));
end multiplexador16;

architecture mu16 of multiplexador16 is
begin
	with sel select
		F <= 	F1 when "00",
				F2 when "01",
				F3 when "10",
				F4 when others;
end mu16;