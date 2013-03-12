##############################################################################
## Filename:          D:\Dropbox\Dropbox\Workspace\zynq_vf/drivers/hw_vf_bram_v1_00_a/data/hw_vf_bram_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Mon Nov 26 17:46:35 2012 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "hw_vf_bram" "NUM_INSTANCES" "DEVICE_ID" "C_S_AXI_MEM0_BASEADDR" "C_S_AXI_MEM0_HIGHADDR" "C_S_AXI_MEM1_BASEADDR" "C_S_AXI_MEM1_HIGHADDR" 
}
