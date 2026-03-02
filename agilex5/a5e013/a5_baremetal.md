# Agilex 5 103B baremetal example

These instructions are based on those for the 065 premium dev kit: [baremetal example](https://altera-fpga.github.io/rel-25.1/baremetal-embedded/agilex-5/e-series/premium/ug-baremetal-agx5e-premium/)

## Baremetal no DRAM boot flow

I have concentrated on the boot flow where no DRAM is connected.  This is useful for people who have a small application that will fit in the 512KB OCRAM provided by the Agilex 5 HPS.

![diagram](https://altera-fpga.github.io/rel-25.1/baremetal-embedded/agilex-5/e-series/premium/images/baremetal-build-flow-ocram.svg)

As shown in the diagram, the prject uses the [baremetal-drivers](https://github.com/altera-fpga/baremetal-drivers) project.

### Build instructions

Follow instructions for the [065 example](https://altera-fpga.github.io/rel-25.1/baremetal-embedded/agilex-5/e-series/premium/ug-baremetal-agx5e-premium/#build-example), with the following modifications:
1. Step 4 use my patched [baremetal-drivers](https://github.com/altera-fpga/baremetal-drivers) project:
`git clone -b ag5_hw_debug https://github.com/gavin5342/baremetal-drivers`
(an upstream pull request has been submitted)
2. I found it easier for debugging to edit hello_world.c to make the print a loop
3. Step 10, use GHRD for 013B board:
	1. Build GHRD for 013B board
```
wget https://releases.rocketboards.org/2026.01/qspi/agilex5_dk_a5e013bm16aea_qspi/fpga.sof
quartus_pfg \
-c fpga.sof flash_image.jic \
-o device=MT25QU512 \
-o flash_loader=A5ED013BM16AE4SCS \
-o hps_path=hello_world.hex \
-o mode=ASX4 \
-o hps=1

quartus_pfg -c fpga.sof fpga_hello.sof -o hps_path=hello_world.hex

quartus_pgm -c 1 -m jtag -o "pvi;flash_image.hps.jic@2"
```
**NB the command above works when the FPGA has been configured with HPS coresight connected to the FPGA JTAG chain.  If you see an error, try changing @2 to @1**

4. Connect to the UART using the USB Blaster III:
	`picocom -b 115200 /dev/ttyUSB0`
**NB the command above works when the FPGA has been configured with HPS coresight connected to the FPGA JTAG chain.  If you see an error, try changing @2 to @1**

### High level boot description

The example is based on the [newlib](https://github.com/eblot/newlib/tree/master) aarch64 port.  Boot execution:
1. At reset, OCRAM has been initialised by the SDM with the program built into the bitstream using `quartus_pfg`.  The states of the HPS IO pins are also provided by handoff_data
2. reset vector is 0 on HPS.  crt0.S begins at .text which was defined to 0 by `core0_ocram.ld`.
3. crt0 includes an optional early `_cpu_init_hook()` which is defined in the baremetal-drivers code.  Reads the current EL state from CurrentEL and calls the appropriate function to configure memory regions - normal for OCRAM, all others non-cacheable.
4. Finish initialization for C and call main
5. main calls fsbl_configuration which sets the pinmux and configures the uart. 

### Debugging

**Prerequisite - FPGA configured with a bitstream that enables the HPS, using instructions above**

#### cmd line
1. Start Ashling debug server:  
`$QUARTUS_ROOTDIR/../riscfree/debugger/gdbserver-arm/ash-arm-gdb-server --device 4BA06477 --probe-type USB-Blaster-2 --auto-detect true --core-number 0 --gdb-port 2331`
_USB-Blaster-2 is right for both II and III_
2. Start gdb on the .elf file that you built above:
`$ ${CROSS_COMPILE}gdb hello_world.elf`
3. load elf to OCRAM: `load`

#### Risc Free IDE

1. Open Risc Free IDE
2. New -> Project...
3. C/C++ -> C/C++ Project
4. Empty or Existing CMake Project
5. Browse to the baremetal-example folder that you created
2. Go to Run -> Debug Configurations
3. Click the Ashling Hetrogeneous Multicore Hardware Debugging item
4. Click the New Configuration button
5. In the device tab:
	1. select the debug probe (AG5C_SoC_DK)
	2. Press Auto-detect Scan Chain
	3. Click the core to debug ie 0-Cortex-A55
	4. In the Cortex-A55 core configuration section, click Target Application
	5. Click Add
	6. Browse to .elf you have built
	7. Press Apply to save the launch config
	8. Press Debug to connect and debug
	
### Not configured in example
1. Clocks are not configured.  They are left in boot-mode