library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity control is
	port(
			en:in std_logic; 
			ring:in std_logic; 
			load:out std_logic
		);
end control;

architecture func of control is
signal load_1:std_logic;
begin
	process(en,ring)
	begin
		if(en='0')then
			load_1<='1';
		elsif(ring='1')then
			load_1<='1';
		else
			load_1<='0';
		end if;
	end process;
	load<=load_1;
end func;
