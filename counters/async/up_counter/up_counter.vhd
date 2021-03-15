library ieee;
use ieee.std_logic_1164.all;

entity up_counter is
    port
    (
        Clk_in, Rst : in std_logic;
        Q, Qbar : out std_logic_vector(3 downto 0)
    );
end entity;

architecture dataflow of up_counter is

component T_ff
    port
    (
        T, CLK, RST : in std_logic;
        Q, Qbar : out std_logic
    );

end component;


signal t : std_logic_vector(3 downto 0) := "1111";
signal qff: std_logic_vector(3 downto 0);

begin

    ff1 : T_ff port map
        (
            T => t(0),
            CLK => Clk_in,
            RST => Rst,
            Q => qff(0),
            Qbar => Qbar(0)
        );

    ff2 : T_ff port map
        (
            T => t(1),
            CLK => qff(0),
            RST => Rst,
            Q => qff(1),
            Qbar => Qbar(1)
        );

    ff3 : T_ff port map
        (
            T => t(2),
            CLK => qff(1),
            RST => Rst,
            Q => qff(2),
            Qbar => Qbar(2)
        );
    
    ff4 : T_ff port map
        (
            T => t(3),
            CLK => qff(2),
            RST => Rst,
            Q => qff(3),
            Qbar => Qbar(3)
        );

    Q <= qff;



end architecture;