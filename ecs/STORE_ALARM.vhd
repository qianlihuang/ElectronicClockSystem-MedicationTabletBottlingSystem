library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity STORE_ALARM is
port( CLK,CLK1,EN,EN1:IN STD_LOGIC;
	DIN: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DOUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end STORE_ALARM;
architecture BH of STORE_ALARM is
signal out1,out0: STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
	process(CLK,CLK1,EN,EN1)
	  begin
		if(EN='0' and  EN1='1') then
			if(CLK'event and CLk='1') then
			out1<=DIN(7 DOWNTO 4) ;
			out0<=DIN(3 DOWNTO 0);
			end if;
		end if;
		DOUT<=out1&out0;
end process;
end BH;