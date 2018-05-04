# ec551finalproject
Spring 2018 EC551 Final Project - Glimmer Team

Our project is a fluorescence microscope image processing system.
How the microscope works was explained in the PPTs.
The row data generated from the fluorescence microscope will be stored in an sdcard.
We ue Zedboard to read them from SDcard and use some verilog module to do the processing.
Finally we display the colored image on to the monitor via HDMI.

Zedboard is a advanced FGPA board, which was integrated with a ARM core, that allow us to run some C code. 
Our HDMI display in mainly implemented using C code, which were under "hdmi_display_app" folder.

the first folder "constraints" contains the cinstrain files
the second "hdmi_display_app", C codes for HDMI display
the third "imports/Desktop", inside which were the verilog modules we used to make the data processing.
