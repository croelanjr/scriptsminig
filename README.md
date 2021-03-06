# Installation of mining tools in CentOS 8 with GPUs AMD

### This installation file is created to be installed on CentOS 8 in minimal. And all mining tools have been tested on the same CentOS 8 operating system.

1. The CentOS 8 operating system must be installed in minimal.

2. Download the file to install and run the file.

```
curl -O https://raw.githubusercontent.com/croelanjr/scriptsminig/master/install-mining.sh
```
3. Open the permissions for the installation file.

```
chmod +x install-mining.sh
```
4. Run the installation file.

```
./install-mining.sh
```
5. Once you have installed. You can use the mining tool of your choice. They must configure the wallet of the currency you want to mine. I am not responsible for the failure of the mining tools. The developers of the mining tool must be claimed.

6. To use overclocking to get hashrate performance. It is responsible for each miner with their respective GPUs.

    We have three options to overclock:

* First option is to change the values of the mclock percentage and decrease the value of cclock to reduce the amount of energy from the consumption of the gpu. In this option, the operating system service is activated in case the device is turned off and every time it is turned on, the overclock service is automatically activated and the file will find it in the scriptsmining folder

    For example: GPU AMD RX 580, normally it is mclock is 2000 MHz, in overclock we have to increase by 12% to get 2240 Mhz. And in normal cclock it is 0 in 1360Mhz and we are going to decrease it to 3 for 1145 Mhz with voltage from 910 to 960 mvddc, and we obtain a haste of 28 Mhash / s

* Second option is to use the ROC-smi tool found in the scriptsminig folder and use it manually.

```
cd ROC-smi
./rocm_smi.py --setmemoverdrive 10
./rocm_smi.py --setsclk 3 
```

In this option, --setmemoverdrive the overclock percentage is increasing and --setsclck is slowing down the gpu speed. Note: That is according to the technical specifications of the GPU, those are examples to use this tool for GPU AMD RX 580.

* Third option is to manipulate the grub of the operating system to deactivate the graphics mode to compute mode.

```
cd scriptsminig/scripts
./activecomputeadmgpu.sh
```

Note: The third option I use in the PhoenixMiner and Claymore tool. and the other options for the other currencies.

7. To protect the mining server, you should bear in mind that you must have the assigned ports of the pools that you are going to mine.
You should look for the install-firewall.sh file in the scriptsmining folder.

```
cd scriptsming
ls
cd scripts
ls
vim install-firewall.sh
```

For any questions write: croelanjr@gmail.com

For any donation to support or improve the installation:
- Paypal : paypal.me/croelanjr
- ETH : 0x07c5ca2ec81119b21a1b62b5bf36635396225114
- BITCOIN : 3PPtK5UXzjfEouSjJcE9idXiY1aYVsYbpk