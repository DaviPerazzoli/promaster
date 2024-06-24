library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity datapath is 
port (S: in std_logic_vector(15 downto 0); -- dos switches
      clk,R1,R2,E1,E2,E3,E4,E5: in std_logic;
      end_game, end_time, end_round: out std_logic;
		HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0: out std_logic_vector(6 downto 0);
		LEDR:out std_logic_vector(15 downto 0));
end datapath;

architecture arqdtp of datapath is
signal SEL_MUX: std_logic_vector(1 downto 0);
signal F, endtime_4,SOMA_X_1,P_REG_4,SEL_4,E_REG_4,Y,temp,X,Xb,Q,Q1,PREG,EREG,SELECC: std_logic_vector(3 downto 0);
signal RESULT: std_logic_vector(7 downto 0);
signal P,P_REG,E,E_REG,v0,v1,v2,v3: std_logic_vector(2 downto 0);
signal SW50,SEL: std_logic_vector(5 downto 0);
signal E1_16, SW150,USER,CODE,LEDR150,Z,m0,m1,m2,m3: std_logic_vector(15 downto 0);
signal A,B,C,D,V,E_m,F_m,G,H,I,J,K,L,M,N,O,ma,mb,mc,md,me,mf,mg,mh,t: std_logic_vector(6 downto 0);
signal c_0,c_1,c_2,c_3,clk1,rst_divfreq,endgame,endtime: std_logic;

component somadormenor is
port (A: in  std_logic_vector(3 downto 0);
		B: in  std_logic_vector(3 downto 0);
		F: out  std_logic_vector(3 downto 0));
end component;

component somadormaior is
Port ( P0 : in STD_LOGIC;
           P1 : in STD_LOGIC;
           P2 : in STD_LOGIC;
           P3 : in STD_LOGIC;
           P : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component selector is 
port(in0, in1, in2, in3: in  std_logic;
     saida: out std_logic_vector(1 downto 0));    
end component;

component ROM3 is 
port(address : in  std_logic_vector(3 downto 0);
     data: out std_logic_vector(15 downto 0));
end component;

component ROM2 is 
port(address : in  std_logic_vector(3 downto 0);
     data: out std_logic_vector(15 downto 0));    
end component;

component ROM1 is 
port(address : in  std_logic_vector(3 downto 0);
     data: out std_logic_vector(15 downto 0));
end component;

component ROM0 is 
port(address : in  std_logic_vector(3 downto 0);
     data: out std_logic_vector(15 downto 0));
end component;

component registrador16 is 
port (CLK, RST, EN: in std_logic; 
		D: in std_logic_vector(15 downto 0); 
		Q: out std_logic_vector(15 downto 0)); 
end component;

component registrador6 is 
port (CLK, RST, EN: in std_logic; 
		D: in std_logic_vector(5 downto 0); 
		Q: out std_logic_vector(5 downto 0) ); 
end component;

component registrador3 is 
port (CLK, RST, EN: in std_logic; 
		D: in std_logic_vector(2 downto 0); 
		Q: out std_logic_vector(2 downto 0)); 
end component;

component registrador is 
port (CLK, RST, EN: in std_logic; 
		D: in std_logic_vector(3 downto 0); 
		Q: out std_logic_vector(3 downto 0) ); 
end component;

component multiplexador74 is	
port (F1: in  std_logic_vector(6 downto 0);
		F2: in  std_logic_vector(6 downto 0);
		F3: in  std_logic_vector(6 downto 0);
		F4: in  std_logic_vector(6 downto 0);
		sel: in  std_logic_vector(1 downto 0);
		F: out  std_logic_vector(6 downto 0));
end  component;

component multiplexador72 is	
port (F1: in  std_logic_vector(6 downto 0);
		F2: in  std_logic_vector(6 downto 0);
		sel: in  std_logic;
		F: out  std_logic_vector(6 downto 0));
end component;

component multiplexador16 is	
port (F1: in  std_logic_vector(15 downto 0);
		F2: in  std_logic_vector(15 downto 0);
		F3: in  std_logic_vector(15 downto 0);
		F4: in  std_logic_vector(15 downto 0);
		sel: in  std_logic_vector(1 downto 0);
		F: out  std_logic_vector(15 downto 0));
end component;

component decodtermo is
port (X: in  std_logic_vector(3 downto 0);
		S: out std_logic_vector(15 downto 0));
end component;

component decod7seg is
port (G: in  std_logic_vector(3 downto 0);
		S: out std_logic_vector(6 downto 0));
end component;

component counter_time is 
port( R: in std_logic;
		clock: in std_logic;
		E: in std_logic;
		tempo: out std_logic_vector(3 downto 0);
		fim_tempo: out std_logic);
end component;

component counter_round is 
port(R: in std_logic;
	  E : in std_logic;
	  clock: in std_logic;
	  end_round: out std_logic;
	  X : out std_logic_vector(3 downto 0));
end component;

component comp4 IS
PORT (P: IN STD_LOGIC_VECTOR(2 DOWNTO 0) ;
		Peq4: OUT STD_LOGIC ) ;
END component;

component COMP is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           E : out STD_LOGIC);
end component;

component comp_e is 
port(inc, inu: in  std_logic_vector(15 downto 0);
     E: out std_logic_vector(2 downto 0));
end component;

component ButtonSync is 
port(KEY0, KEY1, CLK: in  std_logic;
     Enter, Reset   : out std_logic);
end component;

component Div_Freq_DE2 is -- Usar esse componente para a placa DE2
port (	clk: in std_logic;
	reset: in std_logic;
	CLK_1Hz: out std_logic
	);
end component;

component Div_Freq is -- Usar esse componente para o emulador
port (	clk: in std_logic;
	reset: in std_logic;
	CLK_1Hz, sim_2hz: out std_logic
	);
end component;

begin

--	DIVFREQ_EMU: div_freq port map (clk, R1, clk1);	-- usar esse componente para o emulador
	DIVFREQ: div_Freq_DE2 port map(clk, R1, clk1); -- usar esse componente para a placa	
	SELEC: selector port map (E1,E2,R1,E5,SEL_MUX);
	COMPE: comp_e port map (CODE,USER,E);
	
	-- Alguns sinais importantes
	
	RESULT <= "000" & endgame & F;
	P_REG_4 <= '0' & P_REG(2 downto 0);
	SEL_4 <= "00" & SEL(1 downto 0);
	E_REG_4 <= '0' & E_REG(2 downto 0);
	end_game <= endgame;
	end_time <= endtime;
	E1_16 <= "000000000000000" & E1;
	-- SOMADOR MENOR com end_time
	
	SOMA: somadormenor port map(X, "0001", SOMA_X_1);
	endtime_4 <= "000" & endtime;
	F <= not(endtime_4) and not(SOMA_X_1);
	
	-- Decodificadores e seus multiplexadores
	
	DEC_M7_1: decod7seg port map(RESULT(7 downto 4), A);
	MUX_7: multiplexador72 port map("1111111", A, E5, HEX7);
	
	DEC_M6_1: decod7seg port map(RESULT(3 downto 0), B);
	MUX_6: multiplexador72 port map("1111111", B, E5, HEX6);
	
	MUX_5: multiplexador72 port map("1111111", "1111000", E2, HEX5);
	
	DEC_M4_1: decod7seg port map(temp, C);
	MUX_4: multiplexador72 port map("1111111", C, E2, HEX4);
	
	DEC_M3_1: decod7seg port map(USER(15 downto 12), D);
	DEC_M3_3: decod7seg port map(CODE(15 downto 12), E_m);
	MUX_3: multiplexador74 port map("0111001", D, "1110011", E_m, SEL_MUX, HEX3);
	
	DEC_M2_0: decod7seg port map(SEL(5 downto 2), F_m);
	DEC_M2_1: decod7seg port map(USER(11 downto 8), G);
	DEC_M2_2: decod7seg port map(P_REG_4, H);
	DEC_M2_3: decod7seg port map(CODE(11 downto 8), I);
	MUX_2: multiplexador74 port map(F_m, G, H, I, SEL_MUX, HEX2);
	
	DEC_M1_1: decod7seg port map(USER(7 downto 4), J);
	DEC_M1_3: decod7seg port map(CODE(7 downto 4), L);
	MUX_1: multiplexador74 port map("0111000", J, "1111001", L, SEL_MUX, HEX1);
	
	DEC_M0_0: decod7seg port map(SEL_4, M);
	DEC_M0_1: decod7seg port map(USER(3 downto 0), N);
	DEC_M0_2: decod7seg port map(E_REG_4, O);
	DEC_M0_3: decod7seg port map(CODE(3 downto 0), ma);
	MUX_0: multiplexador74 port map(M, N, O, ma, SEL_MUX, HEX0);
	
	-- contador de tempo do round
	
	COUNT_TIME: counter_time port map(R1, clk1, E2, temp, endtime);
	
	-- contador dos rounds e decoder termometrico
	
	COUNT_ROUND: counter_round port map(R2, clk, E3, end_round, X);
	DECODER_TERMOMETRICO: decodtermo port map(X, LEDR150);
	LEDR <= LEDR150 and not(E1_16);
	
	-- REGISTRADORES

	REG_USER: registrador16 port map(clk, R2, E2, S(15 downto 0), USER);
	
	REG_SEL: registrador6 port map(clk, R2, E1, S(5 downto 0), SEL);
	
	REG_P_REG: registrador3 port map(clk, R2, E4, P, P_REG);
	
	REG_E_REG: registrador3 port map(clk, R2, E4, E, E_REG);
	
	-- Comparadores e somador maior
	
	COMP_0: COMP port map(CODE(3 downto 0), USER(3 downto 0), c_0);
	COMP_1: COMP port map(CODE(7 downto 4), USER(7 downto 4), c_1);
	COMP_2: COMP port map(CODE(11 downto 8), USER(11 downto 8), c_2);
	COMP_3: COMP port map(CODE(15 downto 12), USER(15 downto 12), c_3);
	
	SOMA_P: somadormaior port map(c_0,c_1,c_2,c_3, P);
	
	COMP_4: comp4 port map(P, endgame);
	
	-- ROMS com MUX
	
	ROM_0: ROM0 port map(SEL(5 downto 2), m0);
	ROM_1: ROM1 port map(SEL(5 downto 2), m1);
	ROM_2: ROM2 port map(SEL(5 downto 2), m2);
	ROM_3: ROM3 port map(SEL(5 downto 2), m3);
	MUX_CODE: multiplexador16 port map(m0, m1, m2, m3, SEL(1 downto 0), CODE);
	
end arqdtp;
