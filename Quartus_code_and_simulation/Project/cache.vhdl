library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cache is
port(
clock: in std_logic;
rst: in std_logic;
wrmem: in std_logic;
addr: in std_logic_vector(15 downto 0);
Din: in std_logic_vector(15 downto 0);
Dmemout: in std_logic_vector(511 downto 0);
Dout: out std_logic_vector(15 downto 0);
wrmemen: out std_logic;
Dmemin: out std_logic_vector(511 downto 0);
Dmemaddr: out std_logic_vector(10 downto 0);
cachehit: out std_logic_vector(15 downto 0);
cachemiss: out std_logic_vector(15 downto 0)
);
end cache;

architecture beh of cache is

type cachemem is array(0 to 7) of std_logic_vector(511 downto 0);
signal cache: cachemem := (others => (others => '0'));
type tagblock is array(0 to 7) of std_logic_vector(2 downto 0);
signal tag: tagblock := (others => "111");
signal tagnumber: std_logic_vector(15 downto 0) := (others => '0');
signal linenumber: std_logic_vector(15 downto 0) := (others => '0');
signal offset: std_logic_vector(15 downto 0) := (others => '0');
signal blocknumber: std_logic_vector(15 downto 0) := (others => '0');
signal Dout0: std_logic_vector(15 downto 0) := (others => '0');
signal Dataout0: std_logic_vector(511 downto 0) := (others => '0');
signal wr: std_logic := '0';
signal Dataaddr: std_logic_vector(10 downto 0) := (others => '0');
signal cachehit1: std_logic_vector(15 downto 0) := (others => '0');
signal cachemiss1: std_logic_vector(15 downto 0) := (others => '0');
	
	function inte(A: in std_logic_vector(15 downto 0))
	return integer is
	
	variable a1: integer := 0;
	
	begin
		
		L1: for i in 0 to 15 loop
			
			if(A(i) = '1') then
				a1 := a1 + (2**i);
			end if;
			
		end loop L1;
		
	return a1;
	
	end inte;
	
	function add(A: in std_logic_vector(15 downto 0); B: in std_logic_vector(15 downto 0))
	return std_logic_vector is
	
	variable add1 : std_logic_vector(15 downto 0):= (others=>'0');
	variable carry1 : std_logic_vector(16 downto 0):= (others=>'0');
	
	begin
		
		carry1(0) := '0';
		
		L1: for i in 0 to 15 loop
		
		add1(i) := A(i) xor B(i) xor carry1(i);
		carry1(i+1) := (A(i) and B(i)) or (A(i) and carry1(i)) or (B(i) and carry1(i));
		
		end loop L1;
		
	return add1;
		
	end add;

begin
	
	process(clock, Din, addr, wrmem)
	
	begin
		
		wr <= '0';
		tagnumber(2 downto 0) <= addr(15 downto 13);
		linenumber(7 downto 0) <= addr(12 downto 5);
		offset(4 downto 0) <= addr(4 downto 0);
		blocknumber(10 downto 0) <= addr(15 downto 5);
		
		if(rising_edge(clock)) then
			
			if(wrmem = '1') then
				
				Dataaddr <= blocknumber(10 downto 0);
				cache(inte(linenumber)) <= Dmemout;
				tag(inte(linenumber)) <= tagnumber(2 downto 0);
				cache(inte(linenumber))((inte(offset)+15) downto inte(offset)) <= Din;
				wr <= '1';
				Dataout0 <= cache(inte(linenumber));
				
			end if;
			
			if(tag(inte(linenumber)) = tagnumber(2 downto 0)) then
				
				Dout0 <= cache(inte(linenumber))((inte(offset)+15) downto inte(offset));
				cachehit1 <= add(cachehit1, "0000000000000001");
				
			else
				
				Dataaddr <= blocknumber(10 downto 0);
				cache(inte(linenumber)) <= Dmemout;
				tag(inte(linenumber)) <= tagnumber(2 downto 0);
				Dout0 <= cache(inte(linenumber))((inte(offset)+15) downto inte(offset));
				cachemiss1 <= add(cachemiss1, "0000000000000001");
				
			end if;
			
		else
			
			wr <= wr;
			Dout0 <= Dout0;
			Dataout0 <= Dataout0;
			Dataaddr <= Dataaddr;
			
		end if;
		
	end process;
	
	Dout <= Dout0;
	Dmemin <= Dataout0;
	Dmemaddr <= Dataaddr;
	wrmemen <= wr;
	cachehit <= cachehit1;
	cachemiss <= cachemiss1;
	
end beh;