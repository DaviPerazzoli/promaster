library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM1;

architecture Rom_Arch of ROM1 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00: "0010000100000100" -- 2104
	01: "0101001000110001" -- 5231
	02: "0001000000100100" -- 1024
	03: "0101001100100000" -- 5320
	04: "0001000000110010" -- 1032
	05: "0000001101010100" -- 0354
	06: "0010000100110100" -- 2134
	07: "0101000101000010" -- 5142
	08: "0010010000000101" -- 2405
	09: "0100000100000101" -- 4105
	10: "0100001000110000" -- 4230
	11: "0001001001000011" -- 1243
	12: "0000010000110010" -- 0432
	13: "0100001001010011" -- 4253
	14: "0011001001010100" -- 3254
	15: "0101000000110100"); -- 5034
	 
	
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