library ieee;
use ieee.std_logic_1164.all;

entity ROM2 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM2;

architecture Rom_Arch of ROM2 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00: "0001001101110100" -- 1374
	01: "0001010101000010" -- 1542
	02: "0010010101110001" -- 2571
	03: "0010000101110000" -- 2170
	04: "0010010001110001" -- 2471
	05: "0011001001010111" -- 3257
	06: "0010000101010011" -- 2153
	07: "0000010001110110" -- 0476
	08: "0001000001010111" -- 1057
	09: "0011011001110001" -- 3671
	10: "0111010100100011" -- 7523
	11: "0001011100110100" -- 1734
	12: "0100011100010101" -- 4715
	13: "0011010000010101" -- 3415
	14: "0111001101010000" -- 7350
	15: "0011011101000001"); -- 3741
	 
	
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