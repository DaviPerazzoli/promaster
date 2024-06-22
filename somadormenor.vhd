library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity somadormenor is
port (A: in  std_logic_vector(3 downto 0);
		B: in  std_logic_vector(3 downto 0);
		F: out  std_logic_vector(3 downto 0));
end somadormenor;

architecture soma of somadormenor is
begin
	F <= A + B;
end soma;