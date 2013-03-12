------------------------------------------------------------------------------
-- user_logic.vhd - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          user_logic.vhd
-- Version:           1.00.a
-- Description:       User logic.
-- Date:              Sun Nov 25 17:32:29 2012 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

-- DO NOT EDIT BELOW THIS LINE --------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library proc_common_v3_00_a;
use proc_common_v3_00_a.proc_common_pkg.all;

-- DO NOT EDIT ABOVE THIS LINE --------------------

--USER libraries added here
--library mylibs_v1_00_a;
--use mylibs_v1_00_a.user_type.all;

------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
-- Definition of Generics:
--   C_SLV_AWIDTH                 -- Slave interface address bus width
--   C_SLV_DWIDTH                 -- Slave interface data bus width
--   C_NUM_MEM                    -- Number of memory spaces
--
-- Definition of Ports:
--   Bus2IP_Clk                   -- Bus to IP clock
--   Bus2IP_Resetn                -- Bus to IP reset
--   Bus2IP_Addr                  -- Bus to IP address bus
--   Bus2IP_CS                    -- Bus to IP chip select for user logic memory selection
--   Bus2IP_RNW                   -- Bus to IP read/not write
--   Bus2IP_Data                  -- Bus to IP data bus
--   Bus2IP_BE                    -- Bus to IP byte enables
--   Bus2IP_RdCE                  -- Bus to IP read chip enable
--   Bus2IP_WrCE                  -- Bus to IP write chip enable
--   Bus2IP_Burst                 -- Bus to IP burst-mode qualifier
--   Bus2IP_BurstLength           -- Bus to IP burst length
--   Bus2IP_RdReq                 -- Bus to IP read request
--   Bus2IP_WrReq                 -- Bus to IP write request
--   IP2Bus_AddrAck               -- IP to Bus address acknowledgement
--   IP2Bus_Data                  -- IP to Bus data bus
--   IP2Bus_RdAck                 -- IP to Bus read transfer acknowledgement
--   IP2Bus_WrAck                 -- IP to Bus write transfer acknowledgement
--   IP2Bus_Error                 -- IP to Bus error response
--   Type_of_xfer                 -- Transfer Type
------------------------------------------------------------------------------

entity user_logic is
  generic
  (
    -- ADD USER GENERICS BELOW THIS LINE ---------------
    --USER generics added here
	 C_NUM_PE                       : integer              :=12;
	 C_NUM_CB                       : integer              :=13;
    -- ADD USER GENERICS ABOVE THIS LINE ---------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol parameters, do not add to or delete
    C_SLV_AWIDTH                   : integer              := 32;
    C_SLV_DWIDTH                   : integer              := 32;
	 C_NUM_MEM_REGION_BUS			  : integer              := 1;
    C_NUM_MEM                      : integer              := 20
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
	 Bus2IP_CS                      : in  std_logic_vector(C_NUM_MEM_REGION_BUS-1 downto 0);
--  Bus2IP_CS                      : in  std_logic_vector(C_NUM_MEM-1 downto 0);
    Bus2IP_RNW                     : in  std_logic;
    Bus2IP_Data                    : in  std_logic_vector(C_SLV_DWIDTH-1 downto 0);
    Bus2IP_BE                      : in  std_logic_vector(C_SLV_DWIDTH/8-1 downto 0);
    Bus2IP_RdCE                    : in  std_logic_vector(C_NUM_MEM_REGION_BUS-1 downto 0);
    Bus2IP_WrCE                    : in  std_logic_vector(C_NUM_MEM_REGION_BUS-1 downto 0);
--	 Bus2IP_RdCE                    : in  std_logic_vector(C_NUM_MEM-1 downto 0);
--  Bus2IP_WrCE                    : in  std_logic_vector(C_NUM_MEM-1 downto 0);
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

  attribute MAX_FANOUT : string;
  attribute SIGIS : string;

  attribute SIGIS of Bus2IP_Clk    : signal is "CLK";
  attribute SIGIS of Bus2IP_Resetn : signal is "RST";

end entity user_logic;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of user_logic is
 
  component virtual_fabric
	 port(
	   clk : in std_logic;
		rst : in std_logic;
		en : in std_logic;
		data_in : in std_logic_vector(31 downto 0);
		data_out : out std_logic_vector(31 downto 0);
		dsp_config01 : in std_logic_vector(31 downto 0);
		dsp_config03 : in std_logic_vector(31 downto 0);
		dsp_config10 : in std_logic_vector(31 downto 0);
		dsp_config12 : in std_logic_vector(31 downto 0);
		dsp_config14 : in std_logic_vector(31 downto 0);
		dsp_config21 : in std_logic_vector(31 downto 0);
		dsp_config23 : in std_logic_vector(31 downto 0);
		dsp_config30 : in std_logic_vector(31 downto 0);
		dsp_config32 : in std_logic_vector(31 downto 0);
		dsp_config34 : in std_logic_vector(31 downto 0);
		dsp_config41 : in std_logic_vector(31 downto 0);
		dsp_config43 : in std_logic_vector(31 downto 0);
		dsp_config01_d : in std_logic_vector(31 downto 0);
		dsp_config03_d : in std_logic_vector(31 downto 0);
		dsp_config10_d : in std_logic_vector(31 downto 0);
		dsp_config12_d : in std_logic_vector(31 downto 0);
		dsp_config14_d : in std_logic_vector(31 downto 0);
		dsp_config21_d : in std_logic_vector(31 downto 0);
		dsp_config23_d : in std_logic_vector(31 downto 0);
		dsp_config30_d : in std_logic_vector(31 downto 0);
		dsp_config32_d : in std_logic_vector(31 downto 0);
		dsp_config34_d : in std_logic_vector(31 downto 0);
		dsp_config41_d : in std_logic_vector(31 downto 0);
		dsp_config43_d : in std_logic_vector(31 downto 0);
		dsp_config01_pb : in std_logic_vector(31 downto 0);
		dsp_config03_pb : in std_logic_vector(31 downto 0);
		dsp_config10_pb : in std_logic_vector(31 downto 0);
		dsp_config12_pb : in std_logic_vector(31 downto 0);
		dsp_config14_pb : in std_logic_vector(31 downto 0);
		dsp_config21_pb : in std_logic_vector(31 downto 0);
		dsp_config23_pb : in std_logic_vector(31 downto 0);
		dsp_config30_pb : in std_logic_vector(31 downto 0);
		dsp_config32_pb : in std_logic_vector(31 downto 0);
		dsp_config34_pb : in std_logic_vector(31 downto 0);
		dsp_config41_pb : in std_logic_vector(31 downto 0);
		dsp_config43_pb : in std_logic_vector(31 downto 0);
		cb_config00_ws : in std_logic_vector(31 downto 0);
  	   cb_config00_en : in std_logic_vector(31 downto 0);
		cb_config02_ws : in std_logic_vector(31 downto 0);
		cb_config02_en : in std_logic_vector(31 downto 0);
		cb_config04_ws : in std_logic_vector(31 downto 0);
		cb_config04_en : in std_logic_vector(31 downto 0);
		cb_config11_ws : in std_logic_vector(31 downto 0);
		cb_config11_en : in std_logic_vector(31 downto 0);
		cb_config13_ws : in std_logic_vector(31 downto 0);
		cb_config13_en : in std_logic_vector(31 downto 0);
		cb_config20_ws : in std_logic_vector(31 downto 0);
		cb_config20_en : in std_logic_vector(31 downto 0);
		cb_config22_ws : in std_logic_vector(31 downto 0);
		cb_config22_en : in std_logic_vector(31 downto 0);
		cb_config24_ws : in std_logic_vector(31 downto 0);
		cb_config24_en : in std_logic_vector(31 downto 0);
		cb_config31_ws : in std_logic_vector(31 downto 0);
		cb_config31_en : in std_logic_vector(31 downto 0);
		cb_config33_ws : in std_logic_vector(31 downto 0);
		cb_config33_en : in std_logic_vector(31 downto 0);
		cb_config40_ws : in std_logic_vector(31 downto 0);
		cb_config40_en : in std_logic_vector(31 downto 0);
		cb_config42_ws : in std_logic_vector(31 downto 0);
		cb_config42_en : in std_logic_vector(31 downto 0);
		cb_config44_ws : in std_logic_vector(31 downto 0);
		cb_config44_en : in std_logic_vector(31 downto 0)
	 );
  end component;

--  component pe_single_cycle_latency
--	 port( 
--	   clk : in std_logic;
--		rst : in std_logic;
--      en  : in std_logic;
--      w_in : in std_logic_vector(31 downto 0);
--      e_in : in std_logic_vector(31 downto 0);
--      n_in : in std_logic_vector(31 downto 0);
--      s_in : in std_logic_vector(31 downto 0);		
--      d   : in std_logic_vector(15 downto 0);
--		w_out : out std_logic_vector(31 downto 0);
--      e_out : out std_logic_vector(31 downto 0);
--      n_out : out std_logic_vector(31 downto 0);
--      s_out : out std_logic_vector(31 downto 0);
--      alumode : in std_logic_vector(3 downto 0);
--      inmode : in std_logic_vector(4 downto 0);
--      opmode : in std_logic_vector(6 downto 0);
--		sel : in std_logic_vector(1 downto 0)
--	 );
--  end component;
--  
--  component CB
--    port(
--	   w_in: in std_logic_vector(31 downto 0); 
--	   s_in: in std_logic_vector(31 downto 0);
--		e_in: in std_logic_vector(31 downto 0);
--		n_in: in std_logic_vector(31 downto 0);
--	   w_out: out std_logic_vector(31 downto 0);
--		s_out: out std_logic_vector(31 downto 0);
--		e_out: out std_logic_vector(31 downto 0);
--		n_out: out std_logic_vector(31 downto 0);
--		w_mux: in std_logic_vector(1 downto 0);
--		s_mux: in std_logic_vector(1 downto 0);
--		e_mux: in std_logic_vector(1 downto 0);
--		n_mux: in std_logic_vector(1 downto 0);
--		w_dmux: in std_logic_vector(1 downto 0);
--		s_dmux: in std_logic_vector(1 downto 0);
--		e_dmux: in std_logic_vector(1 downto 0);
--		n_dmux: in std_logic_vector(1 downto 0)
--	);
--  end component;
  ------------------------------------------
  -- Signals for user logic memory space example
  ------------------------------------------
  type BYTE_RAM_TYPE is array (0 to 255) of std_logic_vector(7 downto 0);
  type DI_TYPE is array (0 to C_NUM_MEM-1) of std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  type DO_TYPE is array (0 to C_NUM_MEM-1) of std_logic_vector(C_SLV_DWIDTH-1 downto 0);
--  type ADDR_TYPE is array (0 to C_NUM_MEM-1) of std_logic_vector(C_SLV_AWIDTH-1 downto 0);
  type ADDR_TYPE is array (0 to C_NUM_MEM-1) of std_logic_vector(7 downto 0);
  type BRAM_ADDR_TYPE is array (0 to C_NUM_MEM-1) of std_logic_vector(7 downto 0);
  type BE_TYPE is array (0 to C_NUM_MEM-1) of std_logic_vector(C_SLV_DWIDTH/8-1 downto 0);
  type BIT_TYPE is array (0 to C_NUM_MEM-1) of std_logic;
  
  type PE_BIT_TYPE is array (0 to C_NUM_PE-1) of std_logic;
  type PE_DATA_TYPE is array (0 to C_NUM_PE-1) of std_logic_vector(47 downto 0);
  type CB_DATA_TYPE is array (0 to C_NUM_CB-1) of std_logic_vector(31 downto 0);
--  type PE_CONF_TYPE is array (0 to 3*C_NUM_PE) of std_logic_vector(31 downto 0);
--  type CB_CONF_TYPE is array (0 to 2*C_NUM_CB) of std_logic_vector(31 downto 0);
  type VF_CONF_TYPE is array (0 to 3*C_NUM_PE+2*C_NUM_CB) of std_logic_vector(31 downto 0);
  
  
  signal mem_data_out                   : DO_TYPE;
  signal mem_address_a                  : std_logic_vector(7 downto 0);
  signal mem_select                     : std_logic_vector(19 downto 0);
  signal mem_read_enable                : std_logic;
  signal mem_ip2bus_data                : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal mem_read_ack_dly1              : std_logic;
  signal mem_read_ack_dly2              : std_logic;
  signal mem_read_ack                   : std_logic;
  signal mem_write_ack                  : std_logic;
  
  
  --USER signal declarations added here, as needed for user logic
  signal data_mem2usr                   : DO_TYPE;
  signal data_usr2mem                   : DI_TYPE;
  signal addr_usr2mem                   : ADDR_TYPE;
  signal be_usr2mem                     : BE_TYPE;
  signal wrce_usr2mem                   : BIT_TYPE;
  signal rdce_usr2mem                   : BIT_TYPE;
  signal wrack_mem2usr                  : BIT_TYPE;
  signal rdack_mem2usr                  : BIT_TYPE;
  signal burst_usr2mem                  : BIT_TYPE;
  signal bram_cs								 : std_logic_vector(4 downto 0);
  
  ------------------above signals need to be driven by user logic--------------------
  signal mem_address_b                  : BRAM_ADDR_TYPE;
  signal rd_dly1                        : BIT_TYPE;
  signal rd_dly2                        : BIT_TYPE;
  signal wr_dly1                        : BIT_TYPE;
  signal wr_dly2                        : BIT_TYPE;
  
  -------------------------------------------------------------------------------------
  signal status                         : std_logic_vector(7 downto 0);
  signal start_bit                      : std_logic;
  signal end_bit                        : std_logic;
  signal pre_bit                        : std_logic;
  ---------------------------------User's customize logic---------------------------------
  signal num_latency : std_logic_vector(7 downto 0);
  signal num_sample  : std_logic_vector(7 downto 0);
-----------------------------------VF TOP-------------------------------------------
  signal en_vf : std_logic;
  signal data_in_vf : std_logic_vector(31 downto 0);
  signal data_out_vf : std_logic_vector(31 downto 0);
  signal conf_vf : VF_CONF_TYPE;
  signal src_addr : std_logic_vector(7 downto 0);
  signal dst_addr : std_logic_vector(7 downto 0);
  
begin

  --USER logic implementation added here

  ------------------------------------------
  -- Example code to access user logic memory region
  -- 
  -- Note:
  -- The example code presented here is to show you one way of using
  -- the user logic memory space features. The Bus2IP_Addr, Bus2IP_CS,
  -- and Bus2IP_RNW IPIC signals are dedicated to these user logic
  -- memory spaces. Each user logic memory space has its own address
  -- range and is allocated one bit on the Bus2IP_CS signal to indicated
  -- selection of that memory space. Typically these user logic memory
  -- spaces are used to implement memory controller type cores, but it
  -- can also be used in cores that need to access additional address space
  -- (non C_BASEADDR based), s.t. bridges. This code snippet infers
  -- 2 256x32-bit (byte accessible) single-port Block RAM by XST.
  ------------------------------------------
  bram_cs         <= Bus2IP_Addr(20 downto 16);
  MEM_DEC : process (bram_cs, Bus2IP_CS) is
  begin
    if (Bus2IP_CS(0) = '1') then
	   case bram_cs is
		  when "00000" => mem_select <= "00000000000000000001";
		  when "00001" => mem_select <= "00000000000000000010";
		  when "00010" => mem_select <= "00000000000000000100";
		  when "00011" => mem_select <= "00000000000000001000";
		  when "00100" => mem_select <= "00000000000000010000";
		  when "00101" => mem_select <= "00000000000000100000";
		  when "00110" => mem_select <= "00000000000001000000";
		  when "00111" => mem_select <= "00000000000010000000";
		  when "01000" => mem_select <= "00000000000100000000";
		  when "01001" => mem_select <= "00000000001000000000";
		  when "01010" => mem_select <= "00000000010000000000";
		  when "01011" => mem_select <= "00000000100000000000";
		  when "01100" => mem_select <= "00000001000000000000";
		  when "01101" => mem_select <= "00000010000000000000";
		  when "01110" => mem_select <= "00000100000000000000";
		  when "01111" => mem_select <= "00001000000000000000";
		  when "10000" => mem_select <= "00010000000000000000";
		  when "10001" => mem_select <= "00100000000000000000";
		  when "10010" => mem_select <= "01000000000000000000";
		  when "10011" => mem_select <= "10000000000000000000";
        when others => mem_select <= (others => '0');
		end case;
	 else
	   mem_select <= (others => '0');
	 end if;
  end process MEM_DEC;
  
  mem_read_enable <= Bus2IP_RdCE(0);
  mem_write_ack   <= Bus2IP_WrCE(0);
  mem_read_ack    <= mem_read_ack_dly1 and (not mem_read_ack_dly2);
  
  PORT_B_ACK_GEN : for i in 0 to C_NUM_MEM-1 generate
  begin
    ACK_DLY : process( Bus2IP_Clk ) is
      begin
        if ( Bus2IP_Clk'event and Bus2IP_Clk = '1' ) then
          if ( Bus2IP_Resetn = '0' ) then
            rd_dly1(i) <= '0';
            rd_dly2(i) <= '0';
				wr_dly1(i) <= '0';
            wr_dly2(i) <= '0';
          else
            rd_dly1(i) <= rdce_usr2mem(i);
				rd_dly2(i) <= rd_dly1(i);
				wr_dly1(i) <= wrce_usr2mem(i);
				wr_dly2(i) <= wr_dly1(i);
          end if;
       end if;
     end process ACK_DLY;
    rdack_mem2usr(i) <= rd_dly1(i) and (not rd_dly2(i)) when burst_usr2mem(i)='0' else rd_dly1(i);
	 wrack_mem2usr(i) <= wr_dly1(i) and (not wr_dly2(i)) when burst_usr2mem(i)='0' else wr_dly1(i);
  end generate PORT_B_ACK_GEN;
 
  mem_address_a    <= Bus2IP_Addr(9 downto 2);
  PORT_B_ADDR_GEN : for i in 0 to C_NUM_MEM-1 generate
  begin
    mem_address_b(i) <= addr_usr2mem(i);
  end generate PORT_B_ADDR_GEN;

  -- this process generates the read acknowledge 1 clock after read enable
  -- is presented to the BRAM block. The BRAM block has a 1 clock delay
  -- from read enable to data out.
  BRAM_RD_ACK_BUS : process( Bus2IP_Clk ) is
  begin
    if ( Bus2IP_Clk'event and Bus2IP_Clk = '1' ) then
      if ( Bus2IP_Resetn = '0' ) then
        mem_read_ack_dly1 <= '0';
        mem_read_ack_dly2 <= '0';
      else
        mem_read_ack_dly1 <= mem_read_enable;
        mem_read_ack_dly2 <= mem_read_ack_dly1;
      end if;
    end if;
  end process BRAM_RD_ACK_BUS;

  -- implement Block RAM(s)
  BRAM_GEN : for i in 0 to C_NUM_MEM-1 generate
    constant NUM_BYTE_LANES : integer := (C_SLV_DWIDTH+7)/8;
  begin

    BYTE_BRAM_GEN : for byte_index in 0 to NUM_BYTE_LANES-1 generate
      shared variable ram    : BYTE_RAM_TYPE;
      signal write_enable_a  : std_logic;
		signal write_enable_b  : std_logic;
      signal data_in_a       : std_logic_vector(7 downto 0);
		signal data_in_b       : std_logic_vector(7 downto 0);
    begin

      write_enable_a <= Bus2IP_WrCE(0) and mem_select(i) and Bus2IP_BE(byte_index);
		write_enable_b <= wrce_usr2mem(i) and be_usr2mem(i)(byte_index);

      data_in_a <= Bus2IP_Data(byte_index*8+7 downto byte_index*8);
		data_in_b <= data_usr2mem(i)(byte_index*8+7 downto byte_index*8);

      BYTE_RAM_PROC_A : process( Bus2IP_Clk ) is
      begin
        if ( Bus2IP_Clk'event and Bus2IP_Clk = '1' ) then
          if ( write_enable_a = '1') then
            ram(CONV_INTEGER(mem_address_a)) := data_in_a;
			 end if;
          mem_data_out(i)(byte_index*8+7 downto byte_index*8) <= ram(CONV_INTEGER(mem_address_a));
        end if;
      end process BYTE_RAM_PROC_A;
		
		BYTE_RAM_PROC_B : process( Bus2IP_Clk ) is
      begin
        if ( Bus2IP_Clk'event and Bus2IP_Clk = '1' ) then
          if ( write_enable_b = '1') then
			   ram(CONV_INTEGER(mem_address_b(i))) := data_in_b;
			 end if;
          data_mem2usr(i)(byte_index*8+7 downto byte_index*8) <= ram(CONV_INTEGER(mem_address_b(i)));
        end if;
      end process BYTE_RAM_PROC_B;

    end generate BYTE_BRAM_GEN;

  end generate BRAM_GEN;

  -- implement Block RAM read mux
  MEM_IP2BUS_DATA_PROC : process( mem_data_out, mem_select) is
  begin
    case mem_select is
		when "00000000000000000001" => mem_ip2bus_data <= mem_data_out(0);
      when "00000000000000000010" => mem_ip2bus_data <= mem_data_out(1);
      when "00000000000000000100" => mem_ip2bus_data <= mem_data_out(2);
      when "00000000000000001000" => mem_ip2bus_data <= mem_data_out(3);
      when "00000000000000010000" => mem_ip2bus_data <= mem_data_out(4);
      when "00000000000000100000" => mem_ip2bus_data <= mem_data_out(5);
      when "00000000000001000000" => mem_ip2bus_data <= mem_data_out(6);
      when "00000000000010000000" => mem_ip2bus_data <= mem_data_out(7);
		when "00000000000100000000" => mem_ip2bus_data <= mem_data_out(8);
		when "00000000001000000000" => mem_ip2bus_data <= mem_data_out(9);
		when "00000000010000000000" => mem_ip2bus_data <= mem_data_out(10);
		when "00000000100000000000" => mem_ip2bus_data <= mem_data_out(11);
		when "00000001000000000000" => mem_ip2bus_data <= mem_data_out(12);
		when "00000010000000000000" => mem_ip2bus_data <= mem_data_out(13);
		when "00000100000000000000" => mem_ip2bus_data <= mem_data_out(14);
		when "00001000000000000000" => mem_ip2bus_data <= mem_data_out(15);
		when "00010000000000000000" => mem_ip2bus_data <= mem_data_out(16);
		when "00100000000000000000" => mem_ip2bus_data <= mem_data_out(17);
		when "01000000000000000000" => mem_ip2bus_data <= mem_data_out(18);
		when "10000000000000000000" => mem_ip2bus_data <= mem_data_out(19);
      when others => mem_ip2bus_data <= (others => '0');
    end case;
  end process MEM_IP2BUS_DATA_PROC;

  ------------------------------------------
  -- Example code to drive IP to Bus signals
  ------------------------------------------
  IP2Bus_Data  <= mem_ip2bus_data when mem_read_ack = '1' else
                  (others => '0');

  IP2Bus_AddrAck <= mem_write_ack or (mem_read_enable and mem_read_ack);
  
  IP2Bus_WrAck <= mem_write_ack;
  IP2Bus_RdAck <= mem_read_ack;

  IP2Bus_Error <= '0';
  

----------------------below this: user module implementation-----------------------------
  
  USER_TEST_CASE_1: process(Bus2IP_Clk) is
  variable latency_cnt : integer;
  variable burst_cnt : integer;
  begin
    if (Bus2IP_Clk'event and Bus2IP_Clk = '1') then
	   if (Bus2IP_Resetn='0') then
		  rdce_usr2mem(0)<='0';
		  rdce_usr2mem(1)<='0';
		  wrce_usr2mem(0)<='0';
		  wrce_usr2mem(1)<='0';
		  be_usr2mem(0)<="1111";
		  be_usr2mem(1)<="1111";
		  start_bit<='0';
		  status<="00000000";
		  end_bit<='0';
        en_vf<='0';
		  burst_usr2mem(0)<='0';
		  burst_usr2mem(1)<='0';
		  burst_cnt:=0;
		  latency_cnt:=0;
		else 
			if (status="00000000") then  --- idle, wait for start bit and read the control register---
			  rdce_usr2mem(0)<='1';
			  addr_usr2mem(0)<=x"00";
			  start_bit<=data_mem2usr(0)(0);
			  num_latency<=data_mem2usr(0)(9 downto 2);
			  num_sample<=data_mem2usr(0)(17 downto 10);
			  if (rdack_mem2usr(0)='1' and burst_usr2mem(0)='0') then
			    if (start_bit='1') then
			      status<="00000011";
   			 end if;
				 rdce_usr2mem(0)<='0';
			  end if;
--			elsif (status="00000001") then  ---preparing stage: wait user to trasfer data and conf---
--			  rdce_usr2mem(0)<='1';
--			  addr_usr2mem(0)<=x"00";
--			  pre_bit<=data_mem2usr(0)(1);
--			  if (rdack_mem2usr(0)='1' and burst_usr2mem(0)='0') then
--			    if (pre_bit='1') then
--			      status<="00000010";
--   			 end if;
--				 rdce_usr2mem(0)<='0';
--			  end if;
--			elsif (status="00000010") then  ---preparing stage: finish preparing---
--			  rdce_usr2mem(0)<='1';
--			  addr_usr2mem(0)<=x"00";
--			  pre_bit<=data_mem2usr(0)(1);
--			  if (rdack_mem2usr(0)='1' and burst_usr2mem(0)='0') then
--			    if (pre_bit='0') then
--			      status<="00000011";
--   			 end if;
--				 rdce_usr2mem(0)<='0';
--			  end if;
			elsif (status="00000011") then  ---read the address register-----
			  rdce_usr2mem(0)<='1';
			  addr_usr2mem(0)<=x"01";
			  src_addr<=data_mem2usr(0)(25 downto 18);
			  dst_addr<=data_mem2usr(0)(9 downto 2);
			  if (rdack_mem2usr(0)='1' and burst_usr2mem(0)='0') then
			    status<="00000100";
			    rdce_usr2mem(0)<='0';
			  end if;
			elsif (status="00000100") then   ---set the configuration base address----
           addr_usr2mem(0)<=x"02";
			  status<="00000101";
			elsif (status="00000101") then   ---load all the configuration into pe and cb----
			  burst_usr2mem(0)<='1';
			  rdce_usr2mem(0)<='1';
			  conf_vf(burst_cnt)<=data_mem2usr(0);
           if (burst_usr2mem(0)='1') then
			    addr_usr2mem(0)<=addr_usr2mem(0) + "1";
			  end if;
			  if (rdack_mem2usr(0)='1') then
			    burst_cnt:=burst_cnt+1;
			  end if;
			  if (burst_cnt=3*C_NUM_PE+2*C_NUM_CB+1) then
			    burst_usr2mem(0)<='0';
			    rdce_usr2mem(0)<='0';
				 burst_cnt:=0;
				 status<="00001110";
			  end if;
			elsif (status="00001110") then  ---set source and destination address------
			  addr_usr2mem(0)<=src_addr;
			  addr_usr2mem(1)<=dst_addr;
			  status<="00001111";
			elsif (status="00001111") then  ----start execution------------
	        burst_usr2mem(0)<='1';
			  rdce_usr2mem(0)<='1';
			  if (latency_cnt=CONV_INTEGER(num_latency)) then
			    burst_usr2mem(1)<='1';
				 wrce_usr2mem(1)<='1';
			  end if;
			  latency_cnt:=latency_cnt+1;
           en_vf <= '1';
           data_in_vf <= data_mem2usr(0);
			  data_usr2mem(1) <= data_out_vf;
			  if (burst_usr2mem(0)='1') then
			    addr_usr2mem(0)<=addr_usr2mem(0)+ "1";
			  end if;
			  if (burst_usr2mem(1)='1') then
			    addr_usr2mem(1)<=addr_usr2mem(1)+ "1";
				 burst_cnt:=burst_cnt+1;
			  end if;
			  if (burst_cnt=CONV_INTEGER(num_sample)) then
			    burst_usr2mem(0)<='0';
			    burst_usr2mem(1)<='0';
			    rdce_usr2mem(0)<='0';
			    wrce_usr2mem(1)<='0';
				 burst_cnt:=0;
				 latency_cnt:=0;
             en_vf<='0';
				 status<="00010000";
			  end if;
			elsif (status="00010000") then  --finish, set the done bit in status register--
			  wrce_usr2mem(1)<='1';
			  addr_usr2mem(1)<=x"00";
			  data_usr2mem(1)<= x"00000001";
           if (wrack_mem2usr(1)='1' and burst_usr2mem(1)='0') then
			    status<="00010001";
			    wrce_usr2mem(1)<='0';
           end if;
         elsif (status="00010001") then  --wait for user reading results and clear the pending done bit in status register
           rdce_usr2mem(1)<='1';
			  addr_usr2mem(1)<=x"00";
			  end_bit<= data_mem2usr(1)(0);
			  if (rdack_mem2usr(1)='1' and burst_usr2mem(1)='0') then
			    if (end_bit='0') then
			      status<="00010010";
   			 end if;
				 rdce_usr2mem(1)<='0';
			  end if;
         elsif (status="00010010") then   --clear start bit in control register--
           wrce_usr2mem(0)<='1';
			  addr_usr2mem(0)<=x"00";
			  data_usr2mem(0)<=x"00000000";
           if (wrack_mem2usr(0)='1' and burst_usr2mem(1)='0') then
			    status<="00010011";
			    wrce_usr2mem(0)<='0';
           end if;
         elsif (status="00010011") then	--full reset---
           rdce_usr2mem(0)<='0';
		     rdce_usr2mem(1)<='0';
		     wrce_usr2mem(0)<='0';
		     wrce_usr2mem(1)<='0';
		     be_usr2mem(0)<="1111";
		     be_usr2mem(1)<="1111";
		     start_bit<='0';
		     status<="00000000";
		     end_bit<='0';
		     en_vf<='0';
		     burst_usr2mem(0)<='0';
		     burst_usr2mem(1)<='0';
		     burst_cnt:=0;
			  latency_cnt:=0;
			end if;
		 end if;
	 end if;
  end process USER_TEST_CASE_1;
  
  VF: virtual_fabric
  port map (
    clk  => Bus2IP_Clk, 
    rst  => (not Bus2IP_Resetn),
	 en => en_vf,
	 data_in => data_in_vf,
	 data_out => data_out_vf,
	 dsp_config01 => conf_vf(0),
	 dsp_config01_d => conf_vf(1),
	 dsp_config01_pb => conf_vf(2),
	 dsp_config03 => conf_vf(3),
	 dsp_config03_d => conf_vf(4),
	 dsp_config03_pb => conf_vf(5),
	 dsp_config10 => conf_vf(6),
	 dsp_config10_d => conf_vf(7),
	 dsp_config10_pb => conf_vf(8),
	 dsp_config12 => conf_vf(9),
	 dsp_config12_d => conf_vf(10),
	 dsp_config12_pb => conf_vf(11),
	 dsp_config14 => conf_vf(12),
	 dsp_config14_d => conf_vf(13),
	 dsp_config14_pb => conf_vf(14),
	 dsp_config21 => conf_vf(15),
	 dsp_config21_d => conf_vf(16),
	 dsp_config21_pb => conf_vf(17),
	 dsp_config23 => conf_vf(18),
	 dsp_config23_d => conf_vf(19),
	 dsp_config23_pb => conf_vf(20),
	 dsp_config30 => conf_vf(21),
	 dsp_config30_d => conf_vf(22),
	 dsp_config30_pb => conf_vf(23),
	 dsp_config32 => conf_vf(24),
	 dsp_config32_d => conf_vf(25),
	 dsp_config32_pb => conf_vf(26),
	 dsp_config34 => conf_vf(27),
	 dsp_config34_d => conf_vf(28),
	 dsp_config34_pb => conf_vf(29),
	 dsp_config41 => conf_vf(30),
	 dsp_config41_d => conf_vf(31),
	 dsp_config41_pb => conf_vf(32),
	 dsp_config43 => conf_vf(33),
	 dsp_config43_d => conf_vf(34),
	 dsp_config43_pb => conf_vf(35),
	 
	 cb_config00_ws => conf_vf(36), 
	 cb_config00_en => conf_vf(37),
	 cb_config02_ws => conf_vf(38),
	 cb_config02_en => conf_vf(39),
	 cb_config04_ws => conf_vf(40),
	 cb_config04_en => conf_vf(41),
	 cb_config11_ws => conf_vf(42), 
	 cb_config11_en => conf_vf(43),
	 cb_config13_ws => conf_vf(44), 
	 cb_config13_en => conf_vf(45),
	 cb_config20_ws => conf_vf(46), 
	 cb_config20_en => conf_vf(47),
	 cb_config22_ws => conf_vf(48), 
	 cb_config22_en => conf_vf(49),
	 cb_config24_ws => conf_vf(50), 
	 cb_config24_en => conf_vf(51),
	 cb_config31_ws => conf_vf(52), 
	 cb_config31_en => conf_vf(53),
	 cb_config33_ws => conf_vf(54), 
	 cb_config33_en => conf_vf(55),
	 cb_config40_ws => conf_vf(56), 
	 cb_config40_en => conf_vf(57),
	 cb_config42_ws => conf_vf(58), 
	 cb_config42_en => conf_vf(59),
	 cb_config44_ws => conf_vf(60), 
	 cb_config44_en => conf_vf(61)
  );

end IMP;
