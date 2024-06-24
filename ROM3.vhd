library ieee;
use ieee.std_logic_1164.all;

entity ROM3 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM3;

architecture Rom_Arch of ROM3 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00 => "0111010000010000", -- 7410
	01 => "0101100101110110", -- 5976
	02 => "0000010101110010", -- 0572
	03 => "0001010000100111", -- 1427
	04 => "0011100101001000", -- 3948
	05 => "0001100001100000", -- 1860
	06 => "0001000010000100", -- 1084
	07 => "0101001010010100", -- 5294
	08 => "0110011110010000", -- 6790
	09 => "1001010000101000", -- 9428
	10 => "0011011010010111", -- 3697
	11 => "1001011101000001", -- 9741
	12 => "0011000001011001", -- 3059
	13 => "0010100010010100", -- 2894
	14 => "0010001101001000", -- 2348
	15 => "1001001100000111"); -- 9307
	 
	
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