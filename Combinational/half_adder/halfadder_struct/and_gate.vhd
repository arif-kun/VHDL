library ieee;
use ieee.std_logic_1164.all;

entity and_gate is

    port
    (
        i1, i2: in std_logic;
        o : out std_logic
    );

end and_gate;

architecture structural of and_gate is
  
begin

    o <= i1 or i2;

end architecture;