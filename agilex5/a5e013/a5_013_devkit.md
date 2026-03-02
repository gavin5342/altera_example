# Agilex 5 013B Development Kit

Bring up guide for [Agilex 5 013B Development Kit](https://www.altera.com/products/devkit/po-3196/agilex-5-fpga-e-series-013b-development-kit)

These instructions are a supplement to the documents shipped with the dev kit in the installer package.

![agilex5 dk](../../images/a5_013b_dk.png)
## Hardware setup
The power cable and USB connection are easy to identify from the manual.  They are all USB type-C, so if you get them mixed up, you don't damaage anything.


### Jumper positions
All jumpers match the defaults in the user guide straight from the factory.  I will leave these as they are for bringup

## Software setup
I am using an amd64 PC with Ubuntu 24.04 installed.  

I have installed the full [Quartus Pro 25.3.1](https://www.altera.com/downloads/fpga-development-tools/quartus-prime-pro-edition-design-software-version-25-3-1-linux).  With this, I get the [Ashling RiscFree debugger/IDE](https://www.altera.com/products/development-tools/ashling) and all the other JTAG tools I need.

The dev kit also comes with a [package](https://docs.altera.com/v/u/resources/867631/agilextm-5-fpga-e-series-013b-fpga-development-kit-installer-package-dk-a5e013bm16aea?_gl=1*8d30uq*_gcl_au*Mzc2MzM0NDc1LjE3NzA4MDA1MTY.) of collateral and java based diag tools.  More info at [Board portal](#Board-portal) further down.

### USB Blaster III
I only need to do this as I am using a computer where a USB Blaster III has not been used before.

I found it hard to find collateral on the USB Blaster III.  It comprises:

 - FTDI 2232 2 port MPSSE chip
 - Port A is used for JTAG connected to the FPGA + LED
 - Port B is connected to HPS UART0
 - Uses the normal ftdio_sio driver on Linux.  The manual has info on installing the Windows driver.

To use the USB Blaster III on Linux, your user must have access to the device

1. Before doing anything, it's helpful to use `lsusb` to confirm that the dev kit USB connection is visible to the host.  I expect `ID 09fb:6822 Altera`
2. add a udev rule per the user guide:
```
# USB Blaster III
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6022", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6023", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
```
**This rule only adds USB Blaster III**.  If you leave out `idProduct` the rule applies for all Altera devices. 

3. Restart udev: `sudo udevadm control --reload-rules && sudo udevadm trigger
`

4. Check that Quartus programmer can detect the device `quartus_pgmw` for GUI or   `quartus_pgm` for cmd line 	.
	1. `quartus_pgm -l` List all devices connected to Quartus
    2. `quartus_pgm -c N -a` where `N` is the number from step 1.
    
    3. Expect:
 ```
1) AG5C_SoC_DK [1-4]
  4BA06477   ARM_CORESIGHT_SOC_600
  4361C0DD   A5E(C013BM16A|D013BM16ACS)/..
  ```


_*Note after quartus_pgm accesses the USB Blaster III, it programs the application software and the device comes back as `ID 09fb:6023 Altera AG5C_SoC_DK`_

### JTAG chain notes
The devices that are present on the JTAG chain depend on the state of the SDM.  The JTAG pins for the HPS debugger may be routed through the SDM or may be separate - so the debugger may or may not be in your JTAG chain.  A more detailed explanation is provided in the [HPS TRM](https://docs.altera.com/r/docs/814346/25.3.1/hard-processor-system-technical-reference-manual-agilextm-5-socs/dap-swj-dp-jtag-i/o-connectivity).  

If your QSPI is already programmed with a bitstream that enables the HPS **and** has the debug routed to SDM, you will see CORESIGHT in your JTAG chain when you run `quartus_pgmw`, `quartus_pgm` and `jtagconfig`.  If your QSPI is blank, or you have MSEL selected to boot from a different medium with no HPS enabled image, you just see the FPGA in the JTAG chain.

## Board portal
### Setup

I download the [package](https://docs.altera.com/v/u/resources/867631/agilextm-5-fpga-e-series-013b-fpga-development-kit-installer-package-dk-a5e013bm16aea?_gl=1*8d30uq*_gcl_au*Mzc2MzM0NDc1LjE3NzA4MDA1MTY.) and unzip.

1. Need to add execute permission to the software:  
	1. `cd ${loacation}/examples/board_test_system`
	2. `chmod +x start.sh`
	3. `chmod -R +x jre/` Need to have execute for java
	4. `chmod -R +w .` The power monitor writes somewhere
	4. Install extra packages, not sure if all are required: `sudo apt-get install -y mesa-utils libgl1 libgtk-3-0 libcanberra-gtk-module libxtst6 libxrender1 libxi6 libasound2t64 libxext6 libxrender1 libxi6 libxtst6 openjdk-11-jdk openjfx`
	5. Unzip jfx:  
	`cd jfx`
	`unzip unzip openjfx-17.0.11_linux-x64_bin-sdk.zip`
	5. Start with manual specification of javafx:
		```
		jre/linux/bin/java --module-path ./jfx/javafx-sdk-17.0.11/lib/ --add-modules javafx.controls,javafx.graphics,javafx.fxml  -jar ./bin/bts.jar 
		```
	
### Controls
The Board Test System GUI has a button to load the appropriate image for:
 - GPIO
 - transceiver test
 - memory test

## HPS bringup

The GHRD (Golden Hardware Reference Design) is the starting point for HPS development.  The GHRD is part of the GSRD (Golden System Reference Design).  You can clone the Agilex 5 GSRD from the [altera github](https://github.com/altera-fpga/agilex5e-ed-gsrd).  It's also a submodule of this repo in the [agilex5e-ed-gsrd](./agilex5e-ed-gsrd) folder.

The GSRD contains full instructions for compiling a [Yocto Poky](https://www.yoctoproject.org/development/technical-overview/) rootfs + Linux kernel and writing to an SD card.  I quite like a bottom up approach, so I will take some other steps first.

### Compile Hardware

You can compile using these options
1. Make from a5ed013-devkit-oobe: `make legacy-baseline-build`  
The result should be a directory named install with the compiled aftifacts
2. Use `quartus_sh` without make: `$QUARTUS_ROOTDIR/bin/quartus_sh --flow compile top -c baseline_a55` replace baseline_a55 with the folder / name of .qsf file you are compiling.  
The .sof file will be in the `output_files` dircetory
3. Use the Quartus GUI: 
	1. Open Project
	2. Navigate to folder and click on top.qpf
	3. Click ▷ (Start Compilation)
	
**NB you won't be able to use the resulting .sof.  If you try to use it in programmer, you will see:**
`Error(19192): ...sof is incomplete - HPS is present but bootloader information is missing`

### Minimal hps_debug
To check that you can connect with the debugger, read memory set breakpoints... the [hps_debug](./agilex5e-ed-gsrd/a5ed065es-premium-devkit-oobe/baseline-a55/software/hps_debug/) software is useful.  

#### Compile software
`./build.sh` downloads a local copy of the correct aarch64-none-linux-gnu toolchain from ARM and then compiles an assembler only loop - the most minimal piece of software that you could run.

After you have build hps_debug, you will have these artifacts:

 - `hps_wipe.elf` executeable file that you can use with debugger 
 - `hps_wipe.bin` flat binary
 - `hps_wipe.ihex` HEX format
 - `hps_wipe.objdump` disassembled program
 
#### Make programming file
`quartus_pfg` allows you to make programming files for the FPGA that include initialisation of the OCRAM in the HPS.  This part is always required as the ARM boots from 0 which is OCRAM, and the SDM must program OCRAM.  More info available in the [Booting User Guide](https://docs.altera.com/r/docs/813762/25.3/hard-processor-system-booting-user-guide-agilextm-3-and-agilextm-5-socs).

For my purpose, I just want to program over JTAG then connect the debugger.  I don't normally commit to flash until later.  So I make a .sof file with the OCRAM initialised using the hps_wipe program.

```
$QUARTUS_ROOTDIR/bin/quartus_pfg \
-c baseline-a55/output_files/baseline_a55.sof baseline_a55_hps.sof \
-o hps_path=baseline-a55/software/hps_debug/hps_wipe.ihex
```

The file can also be created in the Quartus GUI using File -> Programming File Generator...

#### Program FPGA

I find the GUI helpful here as I can detect the devices and then assign the programming file to the right one.  Depending on the state of the kit, there may or may not be the CORESIGHT debugger in the chain.

You can open the programmer from the main Quartus window, or open it directly with `$QUARTUS_ROOTDIR/bin/quartus_pgmw`

##### Command line

1. Find JTAG chain and cable details: `$QUARTUS_ROOTDIR/bin/jtagconfig`.  I see  
```
1) AG5C_SoC_DK [1-4]
  4BA06477   ARM_CORESIGHT_SOC_600
  4361C0DD   A5E(C013BM16A|D013BM16ACS)/..
```
So I know the dev it is cable 1 and the FPGA is the second device in the chain.

2. Program the FPGA using your sof (for me, my FPGA is 2nd in the chain so I use @2, my cable is 1, so I use -c 1):   

```
$QUARTUS_ROOTDIR/bin/quartus_pgm -c 1 -m jtag -o "p;hps_dbg_ghrd.sof@2"
```

3. Run `jtagconfig` again to confirm the CORESIGHT is in your JTAG chain.

#### Attach Debugger

##### GUI
1. Open the IDE: `$QUARTUS_ROOTDIR/../riscfree/RiscFree/RiscFree`
2. No need to create a project, Create a new connection by clicking the arrow next to the bug picture and choosing **Debug Connections...**  
![riscfree create](../../images/riscfree_createconn.png)
3. Click Ashiling Arm Hardware Debugging and then the New icon  
![riscfree new](../../images/riscfree_choose_new.png)
4. Configure the **New_connection**
	1. In the Main window 
		1. choose a memorable name in the Name: box
		2. Browse to the `hps_wipe.elf` file in the C/C++ Application box
		3. Disable Auto-build
	2. In the debugger tab:
		1. Press the arrows button next to Debug Probe and choose the dev kit
		2. Leave Transport as JTAG and JTAG frequency unchanged
		3. Click Auto-detect Scan Chain
		4. choose ARM_CORESIGHT... in Device/TAP selection
		5. tick the top Cortex-A55 core (0) Debug? and Startup columns
	3. In the Startup tab
		1. Untick load image and load symbols
		2. tick Set breakpoint at, type `loop` instead of `main`	
	4. Click Apply then Debug
	5. You should see the debug window with disassembly:  
	![debug window](../../images/riscfree_debug.png)
	
##### Command line
1. Start the Ashling GDB server:  
```
$QUARTUS_ROOTDIR/../riscfree/debugger/gdbserver-arm/ash-arm-gdb-server \
--device 4BA06477 --probe-type USB-Blaster-2 \
--auto-detect true --core-number 0 --gdb-port 2331
```

2. Start GDB (you can use the gdb with your compile toolchain or the one in riscfree):  
```
$QUARTUS_ROOTDIR/../riscfree/toolchain/Arm/aarch64-none-elf/bin/aarch64-none-elf-gdb \ 
software/hps_debug/hps_wipe.elf
```
3. At the gdb prompt
	1. Connect to the Ashling gdb server  
		`target remote :2331`
	2. optionally reload the program `load`
	3. run `c`
	4. press CTRL+C to interrupt
	5. `info all-reg` to see all registers
	6. More useful stuff in [gdb cheat sheet](https://users.ece.utexas.edu/~adnan/gdb-refcard.pdf)



