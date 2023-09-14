LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

ENTITY MOD_24 IS
PORT(CLK,CLK1,EN:IN STD_LOGIC;
	DIN: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DOUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY MOD_24;

ARCHITECTURE BH OF MOD_24 IS
SIGNAL out1,out0:STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL blink_state: INTEGER RANGE 0 TO 1 := 0;
BEGIN
	PROCESS(CLK1)
	BEGIN
		IF(CLK1'EVENT AND CLK1='1')THEN
			blink_state <= (blink_state + 1) MOD 2;
		END IF;
	END PROCESS;
	
	PROCESS(CLK,EN,DIN,blink_state,out1,out0)
	BEGIN
		IF(EN='0')THEN
			--IF (to_integer(unsigned(DIN(7 DOWNTO 4))) <= 2 AND to_integer(unsigned(DIN(3 DOWNTO 0))) <= 3) THEN
				IF (blink_state = 0) THEN
					out1 <= DIN(7 DOWNTO 4);
					out0 <= DIN(3 DOWNTO 0);
				ELSE
					out1 <= "1111";
					out0 <= "1111";
				END IF;
			--END IF;
		ELSIF(out1 = "1111" AND out0 = "1111")THEN
			out1 <= DIN(7 DOWNTO 4);
			out0 <= DIN(3 DOWNTO 0);
		ELSIF(CLK'EVENT AND clk='1')THEN
			IF(out1="0010" AND out0="0011")THEN
				out1<="0000";
				out0<="0000";
			ELSIF(out0="1001")THEN
				out1<=out1+1;
				out0<="0000";
			ELSE
				out1<=out1;
				out0<=out0+1;
			END IF;	
		END IF;
		
	END PROCESS;
	DOUT<=out1&out0;
END BH;
	