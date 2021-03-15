library ieee;
use ieee.std_logic_1164.all;

entity up_counter_tb is
end entity;

architecture testbench of up_counter_tb is

component up_counter
port
(
    Clk_in, Rst : in std_logic;
    Q, Qbar : out std_logic_vector(3 downto 0)
);
end component;

signal clk_in, rst: std_logic;
signal q, qbar: std_logic_vector(3 downto 0);

begin

    UUT : up_counter port map
    (
        Clk_in => clk_in,
        Rst => rst,
        Q => q,
        Qbar => qbar
    );

    rst <= '1';

    clock: process
    begin
        for ii in 1 to 7 loop
            clk_in <= '0';
            wait for 10 ns;
            clk_in <= '1';
            wait for 10 ns;
        end loop;

        wait;
    end process;



end architecture;