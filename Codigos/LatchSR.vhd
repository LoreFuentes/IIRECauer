Library IEEE;
use IEEE.std_logic_1164.all;
 
Entity LatchSR is
	 port(
	 RST : in std_logic;
	 CLK : in std_logic;		
	 SET : in std_logic;
	 CLR : in std_logic;
	 SOUT : out std_logic
	 );
end LatchSR;

Architecture Behavioral of LatchSR is	 
signal SEL : std_logic_vector(1 downto 0);
signal Qp, Qn : std_logic;
begin		
	SEL <= SET & CLR;
	Combinational : process(Qp, SEL)
	begin 	 
		case SEL is
			when "10" => Qn <= '1';
			when "01" => Qn <= '0';
			when others => Qn <= Qp;
		end case;
		--if SET = '1' then
--			Qn <= '1';
--		elsif CLR = '1' then
--			Qn <= '0';
--		else 
--			Qn <= Qp;
--		end if;		 
		SOUT <= Qp;
	end process Combinational;
	Sequential : process(RST, CLK)
	begin
		if RST = '0' then
			Qp <= '0';
		elsif CLK'event and CLK = '1' then
			Qp <= Qn;
		end if;
	end process Sequential;
end Behavioral;
 