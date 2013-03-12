--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package user_type is
  type BYTE_RAM_TYPE is array (0 to 255) of std_logic_vector(7 downto 0);
  type DO_TYPE is array (0 to 2-1) of std_logic_vector(32-1 downto 0);
  type DI_TYPE is array (0 to 2-1) of std_logic_vector(32-1 downto 0);
  type ADDR_TYPE is array (0 to 2-1) of std_logic_vector(32-1 downto 0);
  type BARM_ADDR_TYPE is array (0 to 2-1) of std_logic_vector(7 downto 0);
  type BE_TYPE is array (0 to 2-1) of std_logic_vector(32/8-1 downto 0);
  type BIT_TYPE is array (0 to 2-1) of std_logic;
-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end user_type;

package body user_type is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end user_type;
