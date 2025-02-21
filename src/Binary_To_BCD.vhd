----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:37:55 02/19/2025 
-- Design Name: 
-- Module Name:    Binary_To_BCD - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Binary_To_BCD is
	port (
		Binary : in std_logic_vector(7 downto 0);
		BCD : out std_logic_vector(11 downto 0)
		);
end Binary_To_BCD;

architecture Behavioral of Binary_To_BCD is

signal BinNum : integer := unsigned(Binary));

begin

BCD(3 downto 0) <= std_logic_vector(unsigned(BinNum mod 10));
BCD(7 downto 4) <= std_logic_vector(unsigned((BinNum / 10) mod 10));
BCD(11 downto 8) <= std_logic_vector(unsigned((BinNum / 100) mod 10));

end Behavioral;

