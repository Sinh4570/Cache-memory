library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity dmem00 is
port(
clock: in std_logic;
rst: in std_logic;
memen: in std_logic;
addr: in std_logic_vector(10 downto 0);
Din: in std_logic_vector(511 downto 0);
Dout: out std_logic_vector(511 downto 0)
);
end dmem00;

architecture beh of dmem00 is

type mem is array(0 to 2**3 - 1) of std_logic_vector(511 downto 0); --64KB
signal data: mem := (
others => (others => '0')
);
signal addr1: std_logic_vector(15 downto 0) := (others => '0');
signal Dout1: std_logic_vector(511 downto 0) := (others => '0');
	
	function inte(A: in std_logic_vector(15 downto 0) )
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

begin
	
	addr1(2 downto 0) <= addr(2 downto 0);
	
	process(clock, addr1, memen, Din, rst)
	
	begin
		
		if(rising_edge(clock)) then
			
			if(memen = '1') then
				
				data(inte(addr1)) <= Din; --takes data input
				
			end if;
			
			Dout1 <= data(inte(addr1)); --dataout
			
		else
			
			Dout1 <= Dout1;
			
		end if;
		
		Dout <= Dout1;
		
	end process;
	
end beh;