library ieee;
use ieee.std_logic_1164.all;

entity mux16_1_tb is 
end entity;

architecture rtl of mux16_1_tb is

    component mux16_1
    port
    (
        I : in std_logic_vector(15 downto 0);
        SEL : in std_logic_vector(3 downto 0);
        Y : out std_logic
    );
    end component;


    signal i : std_logic_vector(15 downto 0);
    signal sel: std_logic_vector(3 downto 0);
    signal y : std_logic;
  
begin

    UUT : mux16_1 port map
    (
        I => i,
        SEL => sel,
        Y => y
    );

    proc1: process
    begin 

    i <= x"8080";

    sel <= "0001";
    wait for 10 ns;

    sel <= "0111";
    wait for 10 ns;

    sel <= "1010";
    wait for 10 ns;

    sel <= "1111";
    wait for 10 ns;

    report "Reached end of test";
    wait;


    end process;


end architecture;