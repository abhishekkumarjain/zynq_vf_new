/*****************************************************************************
* Filename:          D:\Dropbox\Dropbox\Workspace\zynq_vf/drivers/hw_vf_bram_v1_00_a/src/hw_vf_bram.h
* Version:           1.00.a
* Description:       hw_vf_bram Driver Header File
* Date:              Mon Nov 26 17:46:35 2012 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef HW_VF_BRAM_H
#define HW_VF_BRAM_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**************************** Type Definitions *****************************/


/**
 *
 * Write/Read 32 bit value to/from HW_VF_BRAM user logic memory (BRAM).
 *
 * @param   Address is the memory address of the HW_VF_BRAM device.
 * @param   Data is the value written to user logic memory.
 *
 * @return  The data from the user logic memory.
 *
 * @note
 * C-style signature:
 * 	void HW_VF_BRAM_mWriteMemory(Xuint32 Address, Xuint32 Data)
 * 	Xuint32 HW_VF_BRAM_mReadMemory(Xuint32 Address)
 *
 */
#define HW_VF_BRAM_mWriteMemory(Address, Data) \
 	Xil_Out32(Address, (Xuint32)(Data))
#define HW_VF_BRAM_mReadMemory(Address) \
 	Xil_In32(Address)

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the HW_VF_BRAM instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus HW_VF_BRAM_SelfTest(void * baseaddr_p);

#endif /** HW_VF_BRAM_H */
