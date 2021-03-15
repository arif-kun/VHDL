library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  port (
    a, b       : in std_logic;
    sum, carry : out std_logic);
end half_adder;

architecture structural of half_adder is

  component xor_gate
    port
    (
        i1, i2: in std_logic;
        o : out std_logic
    );
  end component;

  component and_gate is
    port
    (
        i1, i2: in std_logic;
        o : out std_logic
    );
  end component;


begin

  u1: xor_gate port map(i1=>a, i2=>b, o=>sum);
  u2: and_gate port map(i1=>a, i2=>b, o=>carry);


end architecture;