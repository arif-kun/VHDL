library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end entity;

architecture behavioural of full_adder_tb is

    component full_adder
      port (
          A, B, C : in std_logic;
          SUM, CARRY : out std_logic
      );
    end component;

    signal a,b,c,sum,carry : std_logic;
  
begin
    UUT : full_adder port map
    (
        A => a,
        B => b,
        C => c,
        SUM => sum,
        CARRY => carry

    );

    proc1: process
        begin
            a <= '0';
            b <= '0';
            c <= '0';
            wait for 1 ns;

            a <= '1';
            b <= '0';
            c <= '0';
            wait for 1 ns;

            a <= '1';
            b <= '0';
            c <= '1';
            wait for 1 ns;

            a <= '0';
            b <= '1';
            c <= '0';
            wait for 1 ns;

            a <= '1';
            b <= '1';
            c <= '1';
            wait for 1 ns;

            report "Reached end of test";
            wait;

        end process; 

end architecture;