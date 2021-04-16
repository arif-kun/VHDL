library ieee;
use ieee.std_logic_1164.all;

entity sync_upcount_tb is
end entity;

architecture testbench of sync_upcount_tb is

component sync_upcount
port
    (
        Clk_in, Rst : in std_logic;
        COUNT : out std_ulogic_vector(3 downto 0)
    );
end component;

signal Clk_in, Rst : std_logic;
signal COUNT : std_ulogic_vector(3 downto 0);


begin 

    UUT: sync_upcount port map
    (
        Clk_in => Clk_in,
        Rst => Rst,
        COUNT => COUNT
    );

    Rst <= '1';


    clock_proc: process
    begin
        for ii in 0 to 16 loop
            clk_in <= '0';
            wait for 10 ns;
            clk_in <= '1';
            wait for 10 ns;
        end loop;

        wait;
    end process;


end architecture;