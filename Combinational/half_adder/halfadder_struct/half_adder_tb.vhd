library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture structural of half_adder_tb is

    component half_adder
    port (
        a, b       : in std_logic;
        sum, carry : out std_logic);
    end component;

    signal a,b,sum,carry : std_logic;

begin
    UUT : half_adder port map(
        a => a,
        b => b, 
        sum => sum,
        carry => carry
    );



    process 
    begin
        a <= '0';
        b <= '0';
        wait for 100 ns;

        a <= '0';
        b <= '1';
        wait for 100 ns;

        a <= '1';
        b <= '0';
        wait for 100 ns;

        a <= '1';
        b <= '1';
        wait for 100 ns;

        report "Reached end of test";
        wait;
    end process;

end architecture;