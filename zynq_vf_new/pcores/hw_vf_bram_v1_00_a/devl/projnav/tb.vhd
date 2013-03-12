-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  -- Component Declaration
          COMPONENT user_logic
			  generic
					(
					 -- ADD USER GENERICS BELOW THIS LINE ---------------
					 --USER generics added here
					 -- ADD USER GENERICS ABOVE THIS LINE ---------------

					 -- DO NOT EDIT BELOW THIS LINE ---------------------
					 -- Bus protocol parameters, do not add to or delete
					 C_SLV_AWIDTH                   : integer              := 32;
					 C_SLV_DWIDTH                   : integer              := 32;
					 C_NUM_MEM                      : integer              := 2
					 -- DO NOT EDIT ABOVE THIS LINE ---------------------
					);
					port
					(
					 -- ADD USER PORTS BELOW THIS LINE ------------------
					 --USER ports added here
					 -- ADD USER PORTS ABOVE THIS LINE ------------------

					 -- DO NOT EDIT BELOW THIS LINE ---------------------
					 -- Bus protocol ports, do not add to or delete
					 Bus2IP_Clk                     : in  std_logic;
					 Bus2IP_Resetn                  : in  std_logic;
					 Bus2IP_Addr                    : in  std_logic_vector(C_SLV_AWIDTH-1 downto 0);
					 Bus2IP_CS                      : in  std_logic_vector(C_NUM_MEM-1 downto 0);
					 Bus2IP_RNW                     : in  std_logic;
					 Bus2IP_Data                    : in  std_logic_vector(C_SLV_DWIDTH-1 downto 0);
					 Bus2IP_BE                      : in  std_logic_vector(C_SLV_DWIDTH/8-1 downto 0);
					 Bus2IP_RdCE                    : in  std_logic_vector(C_NUM_MEM-1 downto 0);
					 Bus2IP_WrCE                    : in  std_logic_vector(C_NUM_MEM-1 downto 0);
					 Bus2IP_Burst                   : in  std_logic;
					 Bus2IP_BurstLength             : in  std_logic_vector(7 downto 0);
					 Bus2IP_RdReq                   : in  std_logic;
					 Bus2IP_WrReq                   : in  std_logic;
					 IP2Bus_AddrAck                 : out std_logic;
					 IP2Bus_Data                    : out std_logic_vector(C_SLV_DWIDTH-1 downto 0);
					 IP2Bus_RdAck                   : out std_logic;
					 IP2Bus_WrAck                   : out std_logic;
					 IP2Bus_Error                   : out std_logic;
					 Type_of_xfer                   : out std_logic
					 -- DO NOT EDIT ABOVE THIS LINE ---------------------
					);
          END COMPONENT;
			 
			 signal Bus2IP_Clk                     :  std_logic;
			 signal Bus2IP_Resetn                  :  std_logic;
			 signal Bus2IP_Addr                    :  std_logic_vector(32-1 downto 0);
			 signal Bus2IP_CS                      :  std_logic_vector(2-1 downto 0);
			 signal Bus2IP_RNW                     :  std_logic;
			 signal Bus2IP_Data                    :  std_logic_vector(32-1 downto 0);
			 signal Bus2IP_BE                      :  std_logic_vector(32/8-1 downto 0);
			 signal Bus2IP_RdCE                    :  std_logic_vector(2-1 downto 0);
			 signal Bus2IP_WrCE                    :  std_logic_vector(2-1 downto 0);
			 signal Bus2IP_Burst                   :  std_logic;
			 signal Bus2IP_BurstLength             :  std_logic_vector(7 downto 0);
			 signal Bus2IP_RdReq                   :  std_logic;
			 signal Bus2IP_WrReq                   :  std_logic;
			 signal IP2Bus_AddrAck                 :  std_logic;
			 signal IP2Bus_Data                    :  std_logic_vector(32-1 downto 0);
			 signal IP2Bus_RdAck                   :  std_logic;
			 signal IP2Bus_WrAck                   :  std_logic;
			 signal IP2Bus_Error                   :  std_logic;
			 signal Type_of_xfer                   :  std_logic;
          

  BEGIN

  -- Component Instantiation
          uut: user_logic PORT MAP(
                Bus2IP_Clk  =>                   Bus2IP_Clk,
					 Bus2IP_Resetn  =>                Bus2IP_Resetn,
					 Bus2IP_Addr   =>                 Bus2IP_Addr,
					 Bus2IP_CS   =>                   Bus2IP_CS,
					 Bus2IP_RNW     =>                Bus2IP_RNW,
					 Bus2IP_Data    =>                Bus2IP_Data,
					 Bus2IP_BE      =>                Bus2IP_BE,
					 Bus2IP_RdCE     =>               Bus2IP_RdCE,
					 Bus2IP_WrCE      =>              Bus2IP_WrCE,
					 Bus2IP_Burst       =>            Bus2IP_Burst,
					 Bus2IP_BurstLength   =>          Bus2IP_BurstLength,
					 Bus2IP_RdReq          =>         Bus2IP_RdReq,
					 Bus2IP_WrReq           =>        Bus2IP_WrReq,
					 IP2Bus_AddrAck        =>         IP2Bus_AddrAck,
					 IP2Bus_Data           =>         IP2Bus_Data,
					 IP2Bus_RdAck           =>        IP2Bus_RdAck,
					 IP2Bus_WrAck          =>         IP2Bus_WrAck,
					 IP2Bus_Error          =>         IP2Bus_Error,
					 Type_of_xfer          =>         Type_of_xfer
          );


  --  Test Bench Statements
  CLK_I_process :process
   begin
        Bus2IP_Clk <= '1';
        wait for 5 ns;
        Bus2IP_Clk <= '0';
        wait for 5 ns;
   end process;

     tb : PROCESS
     BEGIN
        Bus2IP_Resetn <='1';
        wait for 100 ns; -- wait until global set/reset completes
		  
        Bus2IP_Resetn <='0';
        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
