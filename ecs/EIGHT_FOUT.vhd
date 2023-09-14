Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity EIGHT_FOUR is
port(DIN:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DOUT: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end EIGHT_FOUR;
ARCHITECTURE BH OF EIGHT_FOUR IS
BEGIN
	DOUT<=DIN(7 DOWNTO 4);
END BH;