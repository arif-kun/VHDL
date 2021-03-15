library ieee;
use ieee.std_logic_1164.all;


entity T_ff is
    port
    (
        T, CLK, RST : in std_logic;
        Q, Qbar : out std_logic
    );
end entity;

architecture behavioural of T_ff is
begin

    process(CLK,RST) is
    variable m : std_logic := '0';
    begin
        if(RST = '0') then m:='0';
        elsif(falling_edge(CLK)) then
            if(T = '0') then m:=m;
            elsif(T = '1') then m:= not m;
            else null;
            end if;
        end if;

        Q <= m;
        Qbar <= not m;
        
    end process;

 

end architecture;