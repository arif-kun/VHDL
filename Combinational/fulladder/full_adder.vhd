library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        A, B, C : in std_logic;
        SUM, CARRY : out std_logic
    );
end entity;

architecture behavioural of full_adder is

    component half_adder
      port (
          a, b : in std_logic;
          sum, carry : out std_logic
      );
    end component;

    signal sum1,sum2,carry1,carry2 : std_logic;
  
begin
    HA1: half_adder port map
    (
        a => A,     --map ha port to fa port
        b => B,
        sum => sum1,
        carry => carry1
    );

    HA2: half_adder port map
    (
        a => sum1,
        b => C,
        sum => sum2,
        carry => carry2
    );

    SUM <= sum2;
    CARRY <= carry1 OR carry2;
end architecture;