library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter_tb is
end entity;

architecture testbench of counter_tb is

component counter
port
(
    Clk_in, Rst, Dir : in std_logic;
    COUNT: out std_ulogic_vector(3 downto 0)
);
end component;

signal clk_in, rst, dir: std_logic;
signal cnt: std_ulogic_vector(3 downto 0);

begin

    UUT : counter port map
    (
        Clk_in => clk_in,
        Rst => rst,
        Dir => dir,
        COUNT => cnt
    );


    stim_proc : process
    begin
        rst<='1';
        dir<='1';
        wait for 160 ns;
        dir <= '0';
        wait;


    end process;

    clock: process
    begin
        dir <= '1';
        for ii in 1 to 8 loop
            clk_in <= '0';
            wait for 10 ns;
            clk_in <= '1';
            wait for 10 ns;
        end loop;

        dir <='0';
        for jj in 1 to 8 loop
            clk_in <= '0';
            wait for 10 ns;
            clk_in <= '1';
            wait for 10 ns;
        end loop;

        wait;
    end process;



end architecture;