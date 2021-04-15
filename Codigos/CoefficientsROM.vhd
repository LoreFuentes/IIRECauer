Library IEEE;
use IEEE.std_logic_1164.all;

Entity CoefficientsROM is 
	port(
	SEL : in std_logic_vector(3 downto 0);
	BOUT : out std_logic_vector(31 downto 0)
	);
end CoefficientsROM;

Architecture DataFlow of CoefficientsROM is 
begin  
	
	with SEL select BOUT <=  
--	---cambiados de signo
--	X"000001FF" when "0001",
--	X"FFFFFE7A" when "0010",
--	X"000001D3" when "0011",
--	X"000001D3" when "0100",
--	X"FFFFFE7A" when "0101",
--	X"000001FF" when "0110", --b
--	X"0003CC09" when "0111", --a
--	X"FFF9C6E5" when "1000",
--	X"00056A4F" when "1001",
--	X"FFFD8274" when "1010",
--	X"00007BB5" when "1011",
--	X"00000000" when others; 

--	X"000001FF" when "0000",
--	X"FFFFFE7A" when "0001",
--	X"000001D3" when "0010",
--	X"000001D3" when "0011",
--	X"FFFFFE7A" when "0100",
--	X"000001FF" when "0101", --b
--	X"0003CC09" when "0110", --a
--	X"FFF9C6E5" when "0111",
--	X"00056A4F" when "1000",
--	X"FFFD8274" when "1001",
--	X"00007BB5" when "1010",
--	X"00000000" when others; 
--
--	X"FFFFFE7A" when "0001",
--	X"000001D3" when "0010",
--	X"000001D3" when "0011",
--	X"FFFFFE7A" when "0100",
--	X"000001FF" when "0101",
--	X"0003CC09" when "0110", --b
--	X"FFF9C6E5" when "0111", --a
--	X"00056A4F" when "1000",
--	X"FFFD8274" when "1001",
--	X"00007BB5" when "1010",
----	X"00007BB5" when "1011",
--	X"000001FF" when others; 

--
		
----	sin cambio de signo
--	X"000001FF" when "0001",
--	X"FFFFFE7A" when "0010",
--	X"000001D3" when "0011",
--	X"000001D3" when "0100",
--	X"FFFFFE7A" when "0101",
--	X"000001FF" when "0110",-- b
--	X"FFFC33F7" when "0111",-- a
--	X"0006391B" when "1000",
--	X"FFFA95B1" when "1001",
--	X"00027D8C" when "1010",
--	X"FFFF844B" when "1011",
--	X"00000000" when others;	


--	X"000001FF" when "0000",
--	X"FFFFFE7A" when "0001",
--	X"000001D3" when "0010",
--	X"000001D3" when "0011",
--	X"FFFFFE7A" when "0100",
--	X"000001FF" when "0101",-- b
--	X"FFFC33F7" when "0110",--a
--	X"0006391B" when "0111",
--	X"FFFA95B1" when "1000",
--	X"00027D8C" when "1001",
--	X"FFFF844B" when "1010",
--	X"00000000" when others;
--	 
--
--	X"FFFFFE7A" when "0000",
--	X"000001D3" when "0001",
--	X"000001D3" when "0010",
--	X"FFFFFE7A" when "0011",
--	X"FFFC33F7" when "0100", b
--	X"0006391B" when "0101", a
--	X"FFFA95B1" when "0110",
--	X"00027D8C" when "0111",
--	X"FFFF844B" when "1000",
--	X"000001FF" when others;el primero sea en other
--


--	X"FFFFFE7A" when "0000",
--	X"000001D3" when "0001",
--	X"000001D3" when "0010",
--	X"FFFFFE7A" when "0011",
--	X"000001FF" when "0100",
--	X"FFFC33F7" when "0101", --b
--	X"0006391B" when "0110", --a
--	X"FFFA95B1" when "0111",
--	X"00027D8C" when "1000",
--	X"FFFF844B" when "1001",
--	X"000001FF" when others;--el primero sea en others
--

	X"000013D6" when "0001",
	X"000010AE" when "0010",--b
	X"00009DCE" when "0011",--a  
	X"FFFEA52D" when "0100",
	X"000010AE" when others;--el primero sea en others
--------	X"00000000" when others; 

--	X"FFFFFE7A" when "0001",
--	X"000001D3" when "0010",
--	X"000001D3" when "0011",
--	X"FFFFFE7A" when "0100",
--	X"000001FF" when "0101",
--	X"FFFC33F7" when "0101", --b
--	X"0006391B" when "0111", --a
--	X"FFFA95B1" when "1000",
--	X"00027D8C" when "1001",
--	X"FFFF844B" when "1011",
--	X"000001FF" when others;--el primero sea en others
--------	X"00000000" when others

--	X"000001FF" when "0000",
--	X"FFFFFE7A" when "0001",
--	X"000001D3" when "0010",
--	X"000001D3" when "0011",
--	X"FFFFFE7A" when "0100",
--	X"000001FF" when "0101",-- b
--	X"FFFC33F7" when "0110",-- a
--	X"0006391B" when "0111",
--	X"FFFA95B1" when "1000",
--	X"00027D8C" when "1001",
----	X"FFFF844B" when "1011",-- el ultimo en others
--	X"FFFF844B" when others; 


--	X"000001FF" when "0001",
--	X"000001D3" when "0010",
--	X"000001D3" when "0011",
--	X"FFFFFE7A" when "0100",
--	X"000001FF" when "0101",
--	X"FFFC33F7" when "0110",-- b
--	X"0006391B" when "0111",-- a
--	X"FFFA95B1" when "1000",
--	X"00027D8C" when "1001",
--	X"FFFF844B" when "1010",
--	X"FFFFFE7A" when others;
--

end DataFlow;

