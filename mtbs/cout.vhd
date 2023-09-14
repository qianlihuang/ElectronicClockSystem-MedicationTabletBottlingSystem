LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY show IS
	PORT(
		ringin:in std_logic; --�ȽϺ���pill_count�����ı����ź�
		load:in std_logic; --��������ź� load=0���У�load=1����
		green:out std_logic; --�����̵��ź�
		red:out std_logic; --���ƺ���ź�
		ring:out std_logic --�����ź�	
	);
END ENTITY;


ARCHITECTURE func OF show IS

BEGIN	
	process(load,ringin)
	begin
		if(ringin='0') then --�޾���
			ring<='0';
			if(load='1') then --��ͣ����
				red<='1'	;
				green<='0'	;
			else --��������
				lr<='0'	;
				lg<='1'	;
			end if;
		else
			red<='1'	;
			green<='0'	;
			ring<='1';
		end if;
	end process;
end func;

