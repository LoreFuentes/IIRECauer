library IEEE;
use IEEE .std_logic_1164.all;

entity CountDown is
	generic(preset : integer:=10);
	port(
	RST: in std_logic;
	CLK: in std_logic;
	DEC: in std_logic;
	RDY: out std_logic
	
	);
end CountDown;		  

architecture Behavioral of CountDown is
signal Qn,Qp:integer;
begin

	combinational:process(Qp,DEC)
	begin  
		if Qp=0 then
			RDY<='1';
		else
			RDY<='0';
		end if;
		if DEC = '1' and Qp /= 0 then
			Qn <= Qp - 1;
		else
			Qn<=Qp;
		end if;
	end process combinational; 
	
	sequential:process(RST,CLK)
	begin				   
		if RST='0' then
			Qp<=preset;
		elsif CLK'event and CLK='1' then
			Qp<=Qn;
		end if;
	end process sequential;
	
	
	
	
end Behavioral;