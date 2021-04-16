library ieee;
use ieee.std_logic_1164.all;

entity sync_upcount is
    port
    (
        Clk_in, Rst : in std_logic;
        COUNT : out std_ulogic_vector(2 downto 0)
    );

end entity;

architecture rtl of sync_upcount is

component T_ff
    port
    (
        T, CLK, RST : in std_logic;
        Q, Qbar : out std_logic
    );
end component;

signal t1, t2, t3 : std_ulogic;
signal cnt, cnt_bar : std_ulogic_vector(2 downto 0);

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

    t1 <= '1';
    t2 <= cnt(0);
    t3 <= cnt(1) and cnt(0);

    COUNT <= cnt;



end architecture;
