----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:48:46 02/18/2025 
-- Design Name: 
-- Module Name:    Main_Component - Behavioral 
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

entity Main_Component is
	port (
		CLK_100MHz : in std_logic;
		--CLK_12MHz : in std_logic;
		SevenSegment : inout std_logic_vector(7 downto 0);
		SevenSegmentEnable : inout std_logic_vector(2 downto 0)
		);
end Main_Component;

architecture Behavioral of Main_Component is

component Seven_Segment_Converter is
	port (
		SevenSeg : inout std_logic_vector(7 downto 0);
		SevenSegEnable : inout std_logic_vector(2 downto 0); 
		Dig : in std_logic_vector(3 downto 0); -- Digit to place
		UnitDigit, TensDigit, HundredDigit : in std_logic
	);
end component Seven_Segment_Converter;

component Digit_Placer is
	generic (
		CLOCK_RANGE : integer := 100_000
	);
	port (
		CLK : in std_logic;
		Number_To_Place : in std_logic_vector(11 downto 0);
		SegmentsActive : out std_logic_vector(3 downto 0);
		Hundreds_Enable, Tens_Enable, Units_Enable : out std_logic
	);
end component Digit_Placer;

component BCD_Counter is
	generic (
		CLOCK_FREQ : integer := 75_000_000
	);
	port (
		CLK : in std_logic;
		BCD_Out : out std_logic_vector(11 downto 0)
	);
end component BCD_Counter;

signal HC, TC, UC : std_logic := '0';
signal SegActive : std_logic_vector(3 downto 0) := "0000";
signal BCD_Value : std_logic_vector(11 downto 0) := b"0011_0110_0101";

begin

SSC: Seven_Segment_Converter
	port map (
		SevenSeg => SevenSegment,
		SevenSegEnable => SevenSegmentEnable,
		Dig => SegActive,
		UnitDigit => UC, TensDigit => TC, HundredDigit => HC
		);
		
DigitPlace: Digit_Placer
	port map (
		CLK => CLK_100MHz,
		SegmentsActive => SegActive,
		Number_To_Place => BCD_Value,
		Hundreds_Enable => HC,
		Tens_Enable => TC,
		Units_Enable => UC
		);

Counter: BCD_Counter
	port map (
		CLK => CLK_100MHz,
		BCD_Out => BCD_Value
		);
		

end Behavioral;

