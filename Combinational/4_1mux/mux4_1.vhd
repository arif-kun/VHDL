library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is
    port
    (
        i: in std_logic_vector(3 downto 0);
        sel: in std_logic_vector(1 downto 0);
        y: out std_logic
    );

end entity;

architecture rtl of mux4_1 is
 
begin

   with sel select
    y<= i(0) when "00",
        i(1) when "01",
        i(2) when "10",
        i(3) when others;


end architecture;