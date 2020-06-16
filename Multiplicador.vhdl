library IEEE;
use IEEE.numeric_bit.all;
entity mult is
    port(Clk, St: in bit;
        x,y: in unsigned(3 downto 0);
        Done: out bit);
end mult;

architecture behave1 of mult4X4 is

signal State: integer range 0 to 9;
signal ACC: unsigned(8 downto 0);

alias M: bit is ACC(0);

begin
    process(Clk)
    begin
        if Clk'event and Clk = '1' then 
        case State is
            when 0 => 
                if St = '1' then 
                    ACC(8 ownto 4) <= "00000";
                    ACC(3 downto 0) <= x; 
                    State <= 1;
                end if;
            when 1 | 3 | 5 | 7 => 
                if M = '1' then
                    ACC(8 downto 4) <= '0' & ACC(7 downto 4) + y;
                    State <= State + 1;
                else
                    ACC <= '0' & ACC(8 downto 1); -- shift accumulator right
                    State <= State + 2;
                    end if;
                    when 2 | 4 | 6 | 8 => -- "shift" State
                        ACC <= '0' & ACC(8 downto 1); -- right shift
                        State <= State + 1;
                    when 9 => -- end of cycle
                            State <= 0;
                end case;
            end if;
        end process;
    Done <= '1' when State = 9 else '0';
end behave1;
