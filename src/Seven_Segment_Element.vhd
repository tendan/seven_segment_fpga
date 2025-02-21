----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:33 02/18/2025 
-- Design Name: 
-- Module Name:    Seven_Segment_Element - Behavioral 
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

entity Seven_Segment_Element is
	port (
		Digit : in std_logic_vector(3 downto 0); -- BCD Digit
		Segments : out std_logic_vector(7 downto 0) -- Segments active (negated because of cathode)
		);
end Seven_Segment_Element;

architecture Behavioral of Seven_Segment_Element is

begin

-- Read schematics
-- abcdefg.
Segments <= "10011111" when Digit = "0001" else -- 1
				"00100101" when Digit = "0010" else -- 2
				"00001101" when Digit = "0011" else -- 3
				"10011001" when Digit = "0100" else -- 4
				"01001001" when Digit = "0101" else -- 5
				"01000001" when Digit = "0110" else -- 6
				"00011111" when Digit = "0111" else -- 7
				"00000001" when Digit = "1000" else -- 8
				"00001001" when Digit = "1001" else -- 9
				"00000011"; -- 0


end Behavioral;

