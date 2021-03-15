library ieee;
use ieee.std_logic_1164.all;

entity mux16_1 is 
    port
    (
        I : in std_logic_vector(15 downto 0);
        SEL : in std_logic_vector(3 downto 0);
        Y : out std_logic
    );

end entity;

architecture rtl of mux16_1 is

    component mux4_1
    port
    (
        i: in std_logic_vector(3 downto 0);
        sel: in std_logic_vector(1 downto 0);
        y: out std_logic
    );
    end component;


    signal O : std_logic_vector(4 downto 0);
  
begin

    mux1 : mux4_1 port map
    (
        i => I(3 downto 0),
        sel => SEL(1 downto 0),
        y => O(0)
    );

    mux2 : mux4_1 port map
    (
        i => I(7 downto 4),
        sel => SEL(1 downto 0),
        y => O(1)
    );

    mux3 : mux4_1 port map
    (
        i => I(11 downto 8),
        sel => SEL(1 downto 0),
        y => O(2)
    );

    mux4 : mux4_1 port map
    (
        i => I(15 downto 12),
        sel => SEL(1 downto 0),
        y => O(3)
    );

    mux5 : mux4_1 port map
    (
        i => O(3 downto 0),
        sel => SEL(3 downto 2),
        y => O(4)
    );
    
    Y <= O(4);


end architecture;