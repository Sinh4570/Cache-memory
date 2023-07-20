library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;	 
use ieee.std_logic_unsigned.all;

entity imem00 is
port(
pc: std_logic_vector(2 downto 0);
instout: std_logic_vector(511 downto 0)
);
end imem00;

architecture beh of imem00 is

type mem is array(0 to 2**3 - 1) of std_logic_vector(511 downto 0); --64KB
signal inst: mem := (
others => (others => '0')
);
signal pc0: std_logic_vector(15 downto 0) := (others := '0');
	
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
	
	pc0(2 downto 0) <= pc;
	instout <= inst(inte(pc0));
	
end beh;