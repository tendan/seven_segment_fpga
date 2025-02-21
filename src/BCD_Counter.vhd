----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:36 02/21/2025 
-- Design Name: 
-- Module Name:    BCD_Counter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_Counter is
	generic (
		CLOCK_FREQ : integer -- clock freq needed for second ticks
		);
	port (
		CLK : in std_logic;
		BCD_Out : out std_logic_vector(11 downto 0)
		);
end BCD_Counter;

architecture Behavioral of BCD_Counter is

component Clock_Divider is
	generic (
			CLOCK_RANGE : integer := CLOCK_FREQ -- 100MHz to 1s
	);
   port (
			CLK : in  STD_LOGIC;
         TICK : out  STD_LOGIC
	);
end component Clock_Divider;

signal TICK : std_logic := '0';
signal QH, QT, QU : std_logic_vector(3 downto 0);

begin

Tick_Per_Second: Clock_Divider
	port map (
		CLK => CLK,
		TICK => TICK
	);


BCD_Count: process(TICK)
begin
	if rising_edge(TICK) then
		if QU = "1001" then
			QU <= (others => '0');
		else
			QU <= QU + 1;
		end if;
	end if;
end process BCD_Count;

BCD_Out <= QH & QT & QU;

end Behavioral;

