Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity DigitalFilter is
	port(
	RST : in std_logic;
	CLK: in std_logic;
	SYN: in std_logic;
	XIN: in std_logic_vector(15 downto 0);
	YOUT : out std_logic_vector(55 downto 0)
	); 
end DigitalFilter;

Architecture Structural of DigitalFilter is	 

component LatchSR is
	port(
		RST : in std_logic; -- señal de entrada de rest
		CLK : in std_logic; -- señal de entrada del reloj (50Mhrz)
		SET : in std_logic; 
		CLR : in std_logic; 
		SOUT : out std_logic 
	);
end component;	

component Counter is	
	generic(bits : integer :=10);
	port(
		RST : in std_logic; -- seï¿½al de entrada de rest
		CLK : in std_logic; -- seï¿½al de entrada del reloj (50Mhrz)
		ENA : in std_logic;  
		COUNT : out std_logic_vector(bits-1 downto 0) 
	);
end component; 	

component CountDown is
	generic(preset : integer:=10);
	port(
	RST: in std_logic;
	CLK: in std_logic;
	DEC: in std_logic;
	RDY: out std_logic
	
	);
end component; 
	

component CoefficientsROM is 
	port(
	SEL : in std_logic_vector(3 downto 0);
	BOUT : out std_logic_vector(31 downto 0)
	);
end component;	

component LoadRegister is	  
	 generic(busWidth : integer :=8);
	 port(
	 RST : in std_logic;
	 CLK : in std_logic;
	 LDR : in std_logic;   
	 DIN : in std_logic_vector(busWidth - 1 downto 0);
	 DOUT : out std_logic_vector(busWidth - 1 downto 0) 
	 );
end component; 




signal XK0, XK1, XK2, XK3, XK4, XK5, XK6 : std_logic_vector(15 downto 0); ---COEFICIENTES b
signal YK1, YK2, YK3, YK4, YK5 : std_logic_vector(15 downto 0);--coeficientes a
signal ENA, EOC : std_logic;
signal SEL : std_logic_vector(3 downto 0);
signal XOUT : std_logic_vector(15 downto 0); --SALIDA DEL mux
signal BOUT : std_logic_vector(31 downto 0);
signal MULT : std_logic_vector(47 downto 0);
signal EMUL : std_logic_vector(55 downto 0);
signal RSUM : std_logic_vector(55 downto 0);
signal ACCU : std_logic_vector(55 downto 0);
signal AUX : std_logic_vector(55 downto 0);
--signal AUX : std_logic_vector(55 downto 0);
signal RETRO : std_logic_vector(15 downto 0);

begin	
	WITh SEL SElect XOUT <=XK1 WHEN "0001", XK2 WHEN "0010",YK1 when "0011",YK2 when "0100", XK0 when others;	
	MULT <= std_logic_vector(signed(XOUT)*signed(BOUT)); 
	EMUL <= std_logic_vector(resize(signed(MULT), EMUL'length));
	RSUM <= std_logic_vector(signed(EMUL) + signed(ACCU));
	
	U01 : LatchSR port map(RST, CLK, SYN, EOC, ENA); 
	U02 : Counter generic map(4) port map(ENA, CLK, '1', SEL); 
	U03 : CountDown generic map(4) port map(ENA, CLK, '1', EOC); 
	----coeficientes------------
	U040 : LoadRegister generic map(16) port map(RST, CLK, SYN, XIN, XK0);--x(k)	
	U041 : LoadRegister generic map(16) port map(RST, CLK, SYN, XK0, XK1);--x(k-1)
	U042 : LoadRegister generic map(16) port map(RST, CLK, SYN, XK1, XK2);--x(k-2)
	U043 : LoadRegister generic map(16) port map(RST, CLK, SYN, XK2, XK3);--x(k-3)	
	U044 : LoadRegister generic map(16) port map(RST, CLK, SYN, XK3, XK4);--x(k-4)
	U045 : LoadRegister generic map(16) port map(RST, CLK, SYN, XK4, XK5);--x(k-5)
	
	U046 : LoadRegister generic map(16) port map(RST, CLK, SYN, ACCU(32 downto 17), YK1);--y(k-1)----REVISAR RETROALIMENTACION
	U047 : LoadRegister generic map(16) port map(RST, CLK, SYN, YK1, YK2);--y(k-2)
	U048 : LoadRegister generic map(16) port map(RST, CLK, SYN, YK2, YK3);--y(k-3)	
	U049 : LoadRegister generic map(16) port map(RST, CLK, SYN, YK3, YK4);--y(k-4)
	U0411 : LoadRegister generic map(16) port map(RST, CLK, SYN, YK4, YK5);--y(k-5)
	
	
--	U04 : FilterMultiplexor port map(RST, CLK, SYN, XIN, SEL, XOUT); 
	U05 : CoefficientsROM port map (SEL, BOUT);	 
--	U06: MUX generic map(16) port map(XK0, XK1, XK2, XK3, XK4, XK5, YK1, YK2, YK3, YK4, YK5, SEL, XOUT);

	
	U07 : LoadRegister generic map(56) port map(RST, CLK, ENA, RSUM, ACCU);
--	U071: mux2 generic map(56) port map(AUX, SEL, RETRO);
	U08 : LoadRegister generic map(56) port map(RST, CLK, EOC, ACCU, YOUT);
--	YOUT <= AUX;   
--	RETRO <= AUX(33 downto 18);
--	RETRO <= AUX(37 downto 22);
	
end Structural;
