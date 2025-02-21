----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:07 02/18/2025 
-- Design Name: 
-- Module Name:    Seven_Segment_Converter - Behavioral 
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

entity Seven_Segment_Converter is
	port (
		SevenSeg : inout std_logic_vector(7 downto 0); -- SevenSeg physical segments
		SevenSegEnable : inout std_logic_vector(2 downto 0); -- 3xSevenSeg physical vector
		Dig : in std_logic_vector(3 downto 0); -- BCD Digit to place
		UnitDigit, TensDigit, HundredDigit : in std_logic -- Active position
	);
end Seven_Segment_Converter;

architecture Behavioral of Seven_Segment_Converter is

component Seven_Segment_Element is
	port (
		Digit : in std_logic_vector(3 downto 0);
		Segments : out std_logic_vector(7 downto 0)
		);
end component;

begin

element: Seven_Segment_Element
	port map (
		Digit => Dig,
		Segments => SevenSeg
	);

SevenSegEnable <= (not HundredDigit) &
						(not TensDigit) & 
						(not UnitDigit);

end Behavioral;

