library ieee;
use ieee.std_logic_1164.all;

entity JK_ff is
    port
    (
        J, K, Rst, Clk : in std_logic;
        Q, Qb : out std_logic
    );

end entity;

architecture behavioural of JK_ff is

begin

    stim:   process(Clk,RST) is
            variable m : std_logic := '0';
            begin
                if(RST = '1') then m:= '0';

                elsif(rising_edge(Clk)) then

                    if(J='0' and K='0') then m:=m;
                    elsif(J='0' and K='1') then m:='0';
                    elsif(J='1' and K='1') then m:= not m;
                    else m:= '1';

                    end if;
                end if;

                Q <= m;
                Qb <= not m;
            end process;

end architecture;