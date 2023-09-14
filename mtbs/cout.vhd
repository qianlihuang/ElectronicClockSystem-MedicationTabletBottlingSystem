LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY show IS
	PORT(
		ringin:in std_logic; --比较后由pill_count传来的报警信号
		load:in std_logic; --输出控制信号 load=0运行，load=1启动
		green:out std_logic; --控制绿灯信号
		red:out std_logic; --控制红灯信号
		ring:out std_logic --报警信号	
	);
END ENTITY;


ARCHITECTURE func OF show IS

BEGIN	
	process(load,ringin)
	begin
		if(ringin='0') then --无警报
			ring<='0';
			if(load='1') then --暂停运行
				red<='1'	;
				green<='0'	;
			else --正在运行
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

