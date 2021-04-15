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

--

	X"000013D6" when "0001",
	X"000010AE" when "0010",--b
	X"00009DCE" when "0011",--a  
	X"FFFEA52D" when "0100",
	X"000010AE" when others;--el primero sea en others
--------	X"00000000" when others; 



end DataFlow;

