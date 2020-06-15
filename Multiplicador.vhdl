library IEEE;
use IEEE.numeric_bit.all;

entity multiplicador is 
port(x,y: in unsigned (3 downto 0);
     z: out unsigned(7 downto 0));

end multiplicador;


architecture arch of multiplicador is 

begin 
z <= x*y;
end arch;