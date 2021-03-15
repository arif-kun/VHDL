library ieee;
use ieee.std_logic_1164.all;

entity mux4_1_tb is
end entity;

architecture rtl of mux4_1_tb is

component mux4_1
    port
    (
        i: in std_logic_vector(3 downto 0);
        sel: in std_logic_vector(1 downto 0);
        y: out std_logic
    );
end component;

signal  i: std_logic_vector(3 downto 0);
signal  sel: std_logic_vector(1 downto 0);
signal y: std_logic;

 
begin

uut: mux4_1 port map
        (
            i => i,
            sel => sel,
            y => y
        );

    i <= "1010";

    process
    begin

        sel <= "00";
        wait for 10 ns;

        sel <= "11";
        wait for 10 ns;

        sel <= "10";
        wait for 10 ns;

        sel <= "01";
        wait for 10 ns;

        report "Reached end of test";
        wait;


    end process;


end architecture;