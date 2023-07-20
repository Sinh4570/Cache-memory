library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity branchpredictor is
port(
alu3out: in std_logic_vector(15 downto 0);
pcinc: in std_logic_vector(15 downto 0);
branchcheck: out std_logic;
pcupdate: out std_logic
);
end branchpredictor;

architecture beh of branchpredictor is



begin

end beh;