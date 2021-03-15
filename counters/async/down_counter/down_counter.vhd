library ieee;
use ieee.std_logic_1164.all;

entity down_counter is
    port
    (
        Clk_in, Rst : in std_logic;
        Q, Qbar : out std_logic_vector(3 downto 0)
    );
end entity;

architecture dataflow of down_counter is

component T_ff
    port
    (
        T, CLK, RST : in std_logic;
        Q, Qbar : out std_logic
    );

end component;


signal t : std_logic_vector(3 downto 0) := "1111";
signal qff, qff_bar: std_logic_vector(3 downto 0);

begin

    ff1 : T_ff port map
        (
            T => t(0),
            CLK => Clk_in,
            RST => Rst,
            Q => qff(0),
            Qbar => qff_bar(0)
        );

    ff2 : T_ff port map
        (
            T => t(1),
            CLK => qff_bar(0),
            RST => Rst,
            Q => qff(1),
            Qbar => qff_bar(1)
        );

    ff3 : T_ff port map
        (
            T => t(2),
            CLK => qff_bar(1),
            RST => Rst,
            Q => qff(2),
            Qbar => qff_bar(2)
        );
    
    ff4 : T_ff port map
        (
            T => t(3),
            CLK => qff_bar(2),
            RST => Rst,
            Q => qff(3),
            Qbar => qff_bar(3)
        );

    Q <= qff;
    Qbar <= qff_bar;



end architecture;