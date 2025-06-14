library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity thermostat is
    Port ( 
        CLK : in bit;
        current_temp : in bit_vector (7 downto 0);
        desired_temp : in bit_vector (7 downto 0);
        display_select : in bit;
        heat : in bit;
        cool : in bit;
        furnace_on : out bit;
        ac_on : out bit;
        temp_display : out bit_vector(7 downto 0)
    );
end thermostat;

architecture Behavioral of thermostat is
    signal current_temp_reg : bit_vector(7 downto 0);
    signal desired_temp_reg : bit_vector(7 downto 0);
    signal display_select_reg : bit;
    signal heat_reg : bit;
    signal cool_reg : bit;
begin

    -- Process to register inputs
    process (CLK)
    begin
        if CLK'event and CLK = '1' then
            current_temp_reg <= current_temp;
            desired_temp_reg <= desired_temp;
            display_select_reg <= display_select;
            heat_reg <= heat;
            cool_reg <= cool;
        end if;
    end process;

    -- Process to display selected temperature
    process (CLK)
    begin
        if CLK'event and CLK = '1' then
            if display_select_reg = '1' then
                temp_display <= current_temp_reg;
            else
                temp_display <= desired_temp_reg;
            end if;
        end if;
    end process;

    -- Process to control furnace and AC
    process (CLK)
    begin
        if CLK'event and CLK = '1' then
            if (desired_temp_reg < current_temp_reg) and (cool_reg = '1') then
                ac_on <= '1';
            else
                ac_on <= '0';
            end if;

            if (desired_temp_reg > current_temp_reg) and (heat_reg = '1') then
                furnace_on <= '1';
            else
                furnace_on <= '0';
            end if;
        end if;
    end process;

end Behavioral;
