library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity counter is
    port
    (
        Clk_in, Rst, Dir : in std_logic;
        COUNT: out std_ulogic_vector(3 downto 0)
    );
end entity;

architecture dataflow of counter is

signal cnt : unsigned(3 downto 0) := x"0";

begin

    count_proc: process(Clk_in, Rst) is

    begin
        if(Rst = '0') then cnt <= x"0";
        elsif(falling_edge(Clk_in)) then
            if(Dir = '0') then  
                cnt <= cnt - 1;
            elsif(Dir = '1') then
                cnt <= cnt + 1;
            else null;
            end if;
        else null;

        end if;

    end process;

    COUNT <= std_ulogic_vector(cnt);


end architecture;