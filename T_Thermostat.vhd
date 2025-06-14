library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_thermostat is
end t_thermostat;

architecture Behavioral of t_thermostat is

    component thermostat
        Port (
            CLK : in bit;
            current_temp : in bit_vector(7 downto 0);
            desired_temp : in bit_vector(7 downto 0);
            display_select : in bit;
            heat : in bit;
            cool : in bit;
            furnace_on : out bit;
            ac_on : out bit;
            temp_display : out bit_vector(7 downto 0)
        );
    end component;

    signal current_temp, desired_temp : bit_vector(7 downto 0);
    signal display_select : bit;
    signal temp_display : bit_vector(7 downto 0);
    signal heat, cool, ac_on, furnace_on : bit;
    signal CLK : bit := '0';

begin

    -- Clock generator
    CLK <= not CLK after 5 ns;

    -- DUT instantiation
    UUT: thermostat port map (
        CLK => CLK,
        current_temp => current_temp,
        desired_temp => desired_temp,
        display_select => display_select,
        temp_display => temp_display,
        heat => heat,
        cool => cool,
        furnace_on => furnace_on,
        ac_on => ac_on
    );

    -- Stimulus process
    process
    begin
        current_temp <= "00000000";
        desired_temp <= "11111111";
        display_select <= '0';
        heat <= '0';
        cool <= '0';
        wait for 50 ns;

        display_select <= '1';
        wait for 50 ns;

        heat <= '1';
        wait for 50 ns;
        heat <= '0';
        wait for 50 ns;

        current_temp <= "11111111";
        desired_temp <= "00000000";
        wait for 50 ns;

        cool <= '1';
        wait for 50 ns;
        cool <= '0';
        wait;

    end process;

end Behavioral;
