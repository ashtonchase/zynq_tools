# OpenOCD Tools
This is collection is for using Open On Chip Debugger with the Xillinx Zynq processors. Spefically, I have used it to debug a Digilent Zybo. It uses the Dual Channel FTDI chip for JTAG and UART debugging. OpenOCD supports other Digilent JTAG interfaces, but the Zybo Board has a different USB vendor ID, so it is not automaticallty recognized. 


## Setup

OpenOCD needs to be installed.

For Ubuntu run: 
```
sudo apt install openocd
```

## Zybo Configuration
To connect to the Digilent Zybo board, run:
```
sudo openocd -f digilent_jtag_zybo.cfg -f zybo.cfg -f ps7_init.tcl -f xilinx-tcl.cfg
```

A couple of things are happening here:
- 'digilent_jtag_zybo.cfg' is used to define the progammer on the Zybo board.
- 'zybo.cfg' is used to define the targets on the JTAG chain.
- 'ps7_init.tcl' is generated from the Xilinx Hardware Definition File (HDF) from the Xilinx Vivado Toolchain. It contains memory read/write commands to initialize the Zynq processor prior to executing code.
- 'xilinx-tcl.cfg' provides two things:
  - functions to sucessfully implement function calls in the 'ps7_init.tcl'
  - functions to allow the user of openOCD to interact with the 'ps7_init.tcl'. Basically both files reference each other. This file was taken from the code shown at https://devel.rtems.org/wiki/Debugging/OpenOCD/Xilinx_Zynq

Upon running the command, you should get the following ouptut:
```
Open On-Chip Debugger 0.10.0
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
adapter speed: 25000 kHz
ftdi samples TDO on falling edge of TCK
adapter speed: 1000 kHz
Info : clock speed 1000 kHz
Info : JTAG tap: chip.tap tap/device found: 0x13722093 (mfg: 0x049 (Xilinx), part: 0x3722, ver: 0x1)
Info : JTAG tap: zynq.dap tap/device found: 0x4ba00477 (mfg: 0x23b (ARM Ltd.), part: 0xba00, ver: 0x4)
Info : zynq.cpu0: hardware has 6 breakpoints, 4 watchpoints
Info : zynq.cpu1: hardware has 6 breakpoints, 4 watchpoints
   TapName             Enabled  IdCode     Expected   IrLen IrCap IrMask
-- ------------------- -------- ---------- ---------- ----- ----- ------
 0 chip.tap               Y     0x13722093 0x23727093     6 0x01  0x03
                                           0x03727093
                                           0x13722093
 1 zynq.dap               Y     0x4ba00477 0x4ba00477     4 0x01  0x0f
perf_reset_and_start_timer
xilinx_ps7_init
```

## Direct OpenOCD Access

You can manually debug the device using a Telnet interface. To start an interface, run the following command:
```
telnet 127.0.0.1 4444
```

It should report you are connected to OpenOCD. For a list of commands you can type 'help'.

To intialize the Zynq by runnign the ps7_init script, run the following from the telnet client:
```
xilinx_ps7_init
```

## GDB Access

Using the Linaro toolchain that can be downloaded as a part of this repo, you can utlize openOCB with GDB.

```
repo/zynq_tools/toolchain/Linaro/gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi/bin/arm-none-eabi-gdb
zynq-connect
```

If you are in the folder where your ELF file is located, run this:
```
zynq-restart
```

otherwise run the following:
```
 mon xilinx_ps7_init
 mon load_image *.elf 0x10000 elf
 mon resume 0
 mon sleep 2000
 mon halt
```




