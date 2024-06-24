library ieee;
use ieee.std_logic_1164.all;

entity ROM2 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM2;

architecture Rom_Arch of ROM2 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00 => "0000010000100011", -- 0423
	01 => "0010010101000001", -- 2541
	02 => "0100001100000001", -- 4301
	03 => "0010000000110101", -- 2035
	04 => "0001010100100000", -- 1520
	05 => "0011011100000101", -- 3705
	06 => "0100011000000101", -- 4605
	07 => "0001011001000010", -- 1642
	08 => "0001011001000101", -- 1645
	09 => "0001001101000101", -- 1345
	10 => "0001011100110101", -- 1735
	11 => "0110010000010010", -- 6412
	12 => "0001010001100101", -- 1465
	13 => "0111011000010011", -- 7613
	14 => "0010000101110101", -- 2175
	15 => "0110000000010101"); -- 6015
	 
	
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