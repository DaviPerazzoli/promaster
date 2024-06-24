library ieee;
use ieee.std_logic_1164.all;

entity ROM3 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM3;

architecture Rom_Arch of ROM3 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00: "0100011101010000" -- 4750
	01: "0111100010010110" -- 7896
	02: "0111001110010000" -- 7390
	03: "0111000100111000" -- 7138
	04: "0110000100000010" -- 6102
	05: "0001100000110110" -- 1836
	06: "0111000000110101" -- 7035
	07: "0101001100100100" -- 5324
	08: "0001011000110100" -- 1634
	09: "0001011101100010" -- 1762
	10: "0001000010011000" -- 1098
	11: "0000011110000001" -- 0781
	12: "1001001001110110" -- 9276
	13: "0010100001010011" -- 2853
	14: "0110100001010001" -- 6851
	15: "0100000000010111"); -- 4017
	 
	
begin
   process (address)
   begin
       case address is
       when "0000" => data <= my_rom(00);
       when "0001" => data <= my_rom(01);
       when "0010" => data <= my_rom(02);
       when "0011" => data <= my_rom(03);
       when "0100" => data <= my_rom(04);
       when "0101" => data <= my_rom(05);
       when "0110" => data <= my_rom(06);
       when "0111" => data <= my_rom(07);
       when "1000" => data <= my_rom(08);
       when "1001" => data <= my_rom(09);
	    when "1010" => data <= my_rom(10);
	    when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
	    when "1101" => data <= my_rom(13);
	    when "1110" => data <= my_rom(14);
	    when others => data <= my_rom(15);
     end case;
  end process;
end architecture Rom_Arch;