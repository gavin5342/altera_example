# Licensing

I like using a floating license even when it is hosted on the machine that I am using as it allows me to transition to a cloud based docker executor more easily.

## Install license server
 - Navigate to Utilities Flexlm License Daemons from [Downloads page](https://www.altera.com/downloads/utilities/flexlm-license-daemons-fpga-software)
 - Add exe permission `chmod +x FlexlmSetup-11.19.6.0-linux.run`
 - Running without arguments opens the GUI
 - `--help` shows command line options.  Choose to use GUI.
 - After running the installer the normal flexlm executeables for altera and siemens are in the location that I selected
 - **Also need to download Siemens flexlm from the same donload page**
 - Execute as root: `sudo ./SiemensLicenseServer_v4.0.0.0_Lnx64_x86-64.bin`
 - LSB package missing - fix by adding a soft link to the new library: `sudo ln -s /lib64/ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3`
 - Skip Import licenses step
 - Tick I don't want this feature for SLIM
 - Installs daemon `saltd` at `/opt/Siemens/LicenseServer`

## Update license file
 - open license file
 - Change `hostname` to my machine
 - Update `port number` to 1717
 - Update alterd `path to daemon executable` to where I installed the Quartus Flexlm
 - Add `PORT=1719` on the `VENDOR alterad` line to lock alterad to use port 1719, otherwise a random port is selected
 - Update mgcld `path to daemon executable` to where I installed Siemens daemon and change from VENDOR mgcld to DAEMON saltd.  **Note mgcld lines work with saltd**
 - Add `PORT=1718` on the `VENDOR saltd` line to lock saltdd to use port 1719, otherwise a random port is selected
  **NB you don't need to change the feature lines from mgcld to saltd, just specifying the saltd daemon is enough**
 - First time - start lmgrd manually and check the log `${INSTALL DIR}/lmgrd -c ${LICENSE_FILE}
On my machine: /opt/altera/flexlm/lmgrd -c /opt/altera/licenses/LR-288134_License.dat`
 - Need to create tmp file to resolve error the first time I run:
   `sudo mkdir /usr/tmp`
   `sudo chown -R glofts:glofts /usr/tmp` (glofts is my user name on my PC, you could use whichever user will run `lmgrd`)
 - Check that licesnes are working from
    `${INSTALL_DIR}/lmutil lmdiag -c 1717@$(hostname)` you can use `localhost` if you run in the same computer as lmgrd is running on.
 - start Quartus while specifying the license server:
   `export LM_LICENSE_FILE=1717@$(hostname)`
    This line can be added to your `.bashrc` if you want it to always be set
 - In addition to `lmutil lmdiag`, you can use Tools -> License Setup in Quartus to check the features that are enabled
 - For Questa Altera FPGA Edition, SALT_LICENSE_SERVER must be specified instead
   `export SALT_LICENSE_SERVER=1717@$(hostname)`
   as above - add to your .bashrc if you want this to always be set
 - Run ${QUESTA INSTALL}/bin/vsim - you will get a message if the license cannot be checked out
 - Open TCP ports if you want other machines on your network to be able to use the licenses
  `sudo ufw allow 1717/tcp`
  `sudo ufw allow 1718/tcp`
  `sudo ufw allow 1719/tcp`
 - Add systemd service to start lmgrd every time I turn the computer on:
   Add the text below to a file called `/usr/lib/systemd/system/lmgrd.service` (Replace `user` and `group` with the real user that you want these processes to run under.
    ```
    [Unit]
    Description=FlexLM license daemon

    After = syslog.target network.target network-online.target
    Wants = network-online.target

    [Service]
    User=<user>
    Group=<group>

    ExecStart=-/opt/altera/flexlm/lmgrd -c /opt/altera/licenses/LR-288134_License.dat

    KillMode=process
    SuccessExitStatus=0 SIGTERM

    [Install]
    WantedBy=multi-user.target
    ```
 - Ask systemd to enable the service
   `sudo systemctl enable lmgrd`
 - If you haven't already started the service, start it by:
   `sudo systemctl start lmgrd`
