Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY CHIMEBELL IS
PORT(
	CLK:IN STD_LOGIC;
	ALARM:IN STD_LOGIC;
	MIN:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	SEC:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	BELL_RING :OUT STD_LOGIC
);
END CHIMEBELL;

ARCHITECTURE BH OF CHIMEBELL IS
signal clk_1:std_logic := '1';
signal clk_2:std_logic :='1';
signal clk_3:std_logic := '1';
BEGIN

process(clk)
	variable div1:integer range 0 to 5;
begin
		if rising_edge(clk) then
			if(div1=5) then
				div1:=0;
				clk_1<= not clk_1;
			else 
				div1:=div1+1;
			end if;
		end if;
end process;

process(clk)
	variable div2:integer range 0 to 6;
begin
		if rising_edge(clk) then
			if(div2=6) then
				div2:=0;
				clk_2<= not clk_2;
			else 
				div2:=div2+1;
			end if;
		end if;
end process;

process(clk)
	variable div3:integer range 0 to 8;
begin
		if rising_edge(clk) then
			if(div3=8) then
				div3:=0;
				clk_3<= not clk_3;
			else 
				div3:=div3+1;
			end if;
		end if;
end process;

	PROCESS(MIN,SEC,ALARM,CLK)
	BEGIN
		IF(MIN(7 DOWNTO 4)=5 AND MIN(3 DOWNTO 0)=9 AND SEC(7 DOWNTO 4)=5 AND SEC(3 DOWNTO 0)=6) THEN
			BELL_RING<=clk_3;
		ELSIF(MIN(7 DOWNTO 4)=5 AND MIN(3 DOWNTO 0)=9 AND SEC(7 DOWNTO 4)=5 AND SEC(3 DOWNTO 0)=7) THEN
			BELL_RING<=clk_2;
		ELSIF(MIN(7 DOWNTO 4)=5 AND MIN(3 DOWNTO 0)=9 AND SEC(7 DOWNTO 4)=5 AND SEC(3 DOWNTO 0)=8) THEN
			BELL_RING<=clk_1;
		ELSIF(MIN(7 DOWNTO 4)=0 AND MIN(3 DOWNTO 0)=0 AND SEC(7 DOWNTO 4)=0 AND SEC(3 DOWNTO 0)=0) THEN
			BELL_RING<=clk_1;
		ELSIF(MIN(7 DOWNTO 4)=0 AND MIN(3 DOWNTO 0)=0 AND SEC(7 DOWNTO 4)=0 AND SEC(3 DOWNTO 0)=1) THEN
			BELL_RING<=clk_2;
		ELSIF(MIN(7 DOWNTO 4)=0 AND MIN(3 DOWNTO 0)=0 AND SEC(7 DOWNTO 4)=0 AND SEC(3 DOWNTO 0)=2) THEN
			BELL_RING<=clk_3;
		ELSIF(ALARM='1')THEN
			BELL_RING<=clk_3;
		ELSE
			BELL_RING<='0';
		END IF;	
	END PROCESS;
END BH;