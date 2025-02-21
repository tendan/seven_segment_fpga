----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:45 02/21/2025 
-- Design Name: 
-- Module Name:    Clock_Divider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock_Divider is
	generic (
			CLOCK_RANGE : integer := 1_000
			);
   port (
			CLK : in  STD_LOGIC;
         TICK : out  STD_LOGIC
			);
end Clock_Divider;

architecture Behavioral of Clock_Divider is
begin

Clock_Div: process (CLK)

variable TICK_COUNT : integer range 0 to CLOCK_RANGE := 0;

begin
	if rising_edge(CLK) then
		if TICK_COUNT = CLOCK_RANGE then
			TICK <= '1';
		else
			TICK <= '0';
		end if;
		TICK_COUNT := TICK_COUNT + 1;
	end if;

end process Clock_Div;

end Behavioral;

