library ieee;
use ieee.std_logic_1164.all;

entity JK_ff_tb is
end entity;

architecture testbench of JK_ff_tb is

component JK_ff
    port
    (
        J, K, Rst, Clk : in std_logic;
        Q, Qb : out std_logic
    );
end component;

signal j,k,rst,clk,q,qb : std_logic;


begin
    uut: JK_ff port map
    (
        J => j,
        K => k,
        Rst => rst,
        Clk => clk,
        Q => q,
        Qb => qb
    );

    --------------------------------------
    clock: process
    begin 
    for p in 1 to 6 loop
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end loop;
    wait;
    end process;

    ----------------------------------------

    stim: process
    begin
    rst <= '0';
    j <= '1';
    k <= '0';

    wait for 20 ns;
    ----------------------------------
    rst <= '0';
    j <= '0';
    k <= '1';

    wait for 20 ns;
    -----------------------------------
    rst <= '0';
    j <= '0';
    k <= '0';

    wait for 20 ns;
    -------------------------------------
    rst <= '0';
    j <= '1';
    k <= '1';

    wait for 20 ns;
    --------------------------------------
    rst <= '0';
    j <= '1';
    k <= '1';

    wait for 20 ns;
    ---------------------------------------
    rst <= '0';
    j <= '1';
    k <= '1';

    wait for 20 ns;

    wait;

    end process;

end architecture;