library IEEE;
use IEEE.numeric_bit.all;

entity multiplicador_tb is 

end multiplicador_tb;

architecture arch of multiplicador_tb is 

component multiplicador is 
port(x,y: in unsigned (3 downto 0);
     z: out unsigned(7 downto 0));

end component;

signal x,y: unsigned (3 downto 0);
signal z:  unsigned(7 downto 0);

begin 

UUT: multiplicador port map (x,y,z);

process 
begin
x <= "0101";
y <= "1110";
wait for 10 ns;
x <= "1101";
y <= "1110";
wait for 10 ns;

x <= "0001";
y <= "1000";
wait for 10 ns;

end process;


end arch;