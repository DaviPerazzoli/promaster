library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM1;

architecture Rom_Arch of ROM1 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00 => "0010010000010000", -- 2410
	01 => "0010010100000001", -- 2501
	02 => "0101001101000010", -- 5342
	03 => "0101000001000011", -- 5043
	04 => "0010000101000101", -- 2145
	05 => "0100000100000101", -- 4105
	06 => "0010000001000101", -- 2045
	07 => "0101001000000100", -- 5204
	08 => "0100010100000010", -- 4502
	09 => "0010000100000011", -- 2103
	10 => "0010001101010001", -- 2351
	11 => "0011010100000001", -- 3501
	12 => "0010000001010100", -- 2054
	13 => "0011000101010100", -- 3154
	14 => "0011010001010001", -- 3451
	15 => "0000001101010001"); -- 0351
	 
	
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