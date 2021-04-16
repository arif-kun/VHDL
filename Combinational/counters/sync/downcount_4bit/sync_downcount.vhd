library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity sync_downcount is
    port (
        Clk_in, Rst : in std_logic;
        COUNT : out std_ulogic_vector(3 downto 0)
    );
end entity sync_downcount;

architecture rtl of sync_downcount is


component T_ff
    port
    (
        T, CLK, RST : in std_logic;
        Q, Qbar : out std_logic
    );
end component;

signal t1, t2, t3, t4 : std_ulogic;
signal cnt, cnt_bar : std_ulogic_vector(3 downto 0);

begin

    tff1: T_ff port map
        (
            T => t1,
            CLK => Clk_in,
            RST => Rst,
            Q => cnt(0),
            Qbar => cnt_bar(0)
        );

    tff2: T_ff port map
        (
            T => t2,
            CLK => Clk_in,
            RST => Rst,
            Q => cnt(1),
            Qbar => cnt_bar(1)
        );

    tff3: T_ff port map
        (
            T => t3,
            CLK => Clk_in,
            RST => Rst,
            Q => cnt(2),
            Qbar => cnt_bar(2)
        );
    
    tff4: T_ff port map
        (
            T => t4,
            CLK => Clk_in,
            RST => Rst,
            Q => cnt(3),
            Qbar => cnt_bar(3)
        );

    t1 <= '1';
    t2 <= cnt_bar(0);
    t3 <= cnt_bar(1) and cnt_bar(0);
    t4 <= cnt_bar(0) and cnt_bar(1) and cnt_bar(2);

    COUNT <= cnt;




    

end architecture;