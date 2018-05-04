/*
 * Copyright (c) 2009-2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */
#include "xparameters.h"	/* SDK generated parameters */
#include "xsdps.h"		/* SD device driver */
#include "xil_printf.h"
#include "ff.h"
#include "xil_cache.h"
#include <stdio.h>
#include "platform.h"
#include "malloc.h"
#include "zed_hdmi_display.h"
#include "xil_printf.h"
#include "ff.h"


zed_hdmi_display_t demo;

//static FIL fp_in;		/* File object */
/*static FATFS fatfs;
//static char FileName[32] = "test.txt";
static char *SD_File;


static FIL fil;		/* File object */
//static FATFS fatfs;
//static char FileName[32] = "input.txt";
//static char *SD_File;




int main()
{
	/*FRESULT Res;
	    		Xil_DCacheFlush();
	    		Xil_DCacheDisable();

	    		UINT br;
	    		BYTE buffer[10000];
	    		/*
	    		 * Register volume work area, initialize device
	    		 */
	    		//Res = f_mount(0, &fatfs);

	    		/*
	    		 * Open file with required permissions.
	    		 * Here - Creating new file with read/write permissions. .
	    		 */
	    		//SD_File = (char *)FileName;

	    		////Res = f_open(&fil, SD_File, FA_READ);

	    		//Res=f_read(&fil,buffer,sizeof buffer, &br);
	    		//printf("%c\n",buffer[9999]);
	    		/*printf("%c\n",buffer[2]);
	        	Res=f_close(&fil);
*/
    init_platform();
    print("Hello World\n\r");
    demo.uBaseAddr_IIC_HdmiOut = XPAR_ZED_HDMI_IIC_0_BASEADDR;
    demo.uDeviceId_VTC_HdmioGenerator = XPAR_ZED_HDMI_DISPLAY_V_TC_0_DEVICE_ID;
    demo.uDeviceId_VDMA_HdmiDisplay = XPAR_ZED_HDMI_DISPLAY_AXI_VDMA_0_DEVICE_ID;
    demo.uBaseAddr_MEM_HdmiDisplay = XPAR_DDR_MEM_BASEADDR + 0x10000000;
    demo.uNumFrames_HdmiDisplay = XPAR_AXIVDMA_0_NUM_FSTORES;
    zed_hdmi_display_init( &demo );
    cleanup_platform();
    return 0;
}

