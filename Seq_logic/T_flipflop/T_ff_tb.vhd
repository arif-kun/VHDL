library ieee;
use ieee.std_logic_1164.all;

entity T_ff_tb is
end entity;

architecture testbench of T_ff_tb is

component T_ff
    port
    (
        T, CLK, RST : in std_logic;
        Q, Qbar : out std_logic
    );
end component;

signal t, clk, rst, q, qbar : std_logic;

begin

    UUT : T_ff port map
            (
                T => t,
                CLK => clk,
                RST => rst,
                Q => q,
                Qbar => qbar
            );

    clock: process
    begin
        for ii in 1 to 6 loop
            clk <= '1';
            wait for 10 ns;
            clk <= '0';
            wait for 10 ns;
        end loop;
        wait;
    end process;

    ----------------------------

    stim: process
    begin
        rst <= '0';
        for ii in 1 to 3 loop
            t <= '1';
            wait for 20 ns;
        end loop;
        wait;
    end process;


end architecture;