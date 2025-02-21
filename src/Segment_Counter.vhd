----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:04:22 02/19/2025 
-- Design Name: 
-- Module Name:    Segment_Counter - Behavioral 
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

entity Digit_Placer is
	generic (
		CLOCK_RANGE : integer -- defines how fast we want to change segments
	);
	port (
		CLK : in std_logic; -- Physical clock
		Number_To_Place : in std_logic_vector(11 downto 0); -- Binary BCD e.g. 1000_0010_0101 to represent on BCD
		SegmentsActive : out std_logic_vector(3 downto 0); -- BCD Digit extract
		Hundreds_Enable, Tens_Enable, Units_Enable : out std_logic -- Flags for number's digit
	);
end Digit_Placer;

architecture Behavioral of Digit_Placer is

component Clock_Divider is
	generic (
			CLOCK_RANGE : integer := CLOCK_RANGE
			);
   port (
			CLK : in  STD_LOGIC;
         TICK : out  STD_LOGIC
			);
end component Clock_Divider;

signal TICK : std_logic := '0';

begin

Cycle: Clock_Divider
	port map (
		CLK => CLK,
		TICK => TICK
		);

Counter: process (TICK)

variable COUNTER : integer range 0 to 5 := 0;

begin

	if rising_edge(TICK) then
		case COUNTER is
			when 0 =>
				Units_Enable <= '1';
				SegmentsActive <= Number_To_Place(3 downto 0);
			when 1 =>
				Units_Enable <= '0';
			when 2 =>
				Tens_Enable <= '1';
				SegmentsActive <= Number_To_Place(7 downto 4);
			when 3 =>
				Tens_Enable <= '0';
			when 4 =>
				Hundreds_Enable <= '1';
				SegmentsActive <= Number_To_Place(11 downto 8);
			when others =>
				Hundreds_Enable <= '0';
		end case;
		COUNTER := COUNTER + 1;
	end if;

end process Counter;

end Behavioral;

