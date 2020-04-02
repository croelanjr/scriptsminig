#!/bin/sh

echo "*********************************************************"
echo "***	INSTALACCION DE HERRAMIENTAS DE MINING CRYPTO	***"
echo "***					EN CENTOS 8						***"
echo "*********************************************************"

set enforce 0 sestatus

echo "******* Instalando los respositorios necesarios *******"
yum update -y
yum install epel-realese -y 
yum groupinstall "Development Tools" -y 
yum install wget vim net-tools pciutils openssl -y

wget --referer http://support.amd.com/ https://drivers.amd.com/drivers/linux/19.50/amdgpu-pro-19.50-967956-rhel-8.1.tar.xz
tar -Jxvf amdgpu-pro*
cd amdgpu-pro-19.50-967956-rhel-8.1
./amdgpu-pro-install -y --opencl=legacy
cd

wget https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/15.0/Claymore.s.Dual.Ethereum.AMD+NVIDIA.GPU.Miner.v15.0.-.LINUX.zip
wget https://github.com/Phoenix-Miner/PhoenixMiner/releases/download/4.9c/PhoenixMiner_4.9c_Linux.zip
wget https://github.com/EPICBOOST/ePIC-Boost-Miner/releases/download/v1.2.0/ePIC-Boost-Miner-v1.2.0.tar.gz
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/0.98/lolMiner_v0981_Lin64.tar.gz
wget https://github.com/nanopool/nanominer/releases/download/v1.8.2/nanominer-linux-1.8.2.tar.gz

git clone https://github.com/DominiLux/amdgpu-pro-fans.git
git clone https://github.com/RadeonOpenCompute/ROC-smi.git
git clone https://github.com/croelanjr/scriptsminig.git

tar -xvzf Claymore.s.Dual.Ethereum.AMD+NVIDIA.GPU.Miner.v15.0.-.LINUX.zip
tar -xvzf PhoenixMiner_4.9c_Linux.zip
tar -xvzf ePIC-Boost-Miner-v1.2.0.tar.gz
tar -xvzf lolMiner_v0981_Lin64.tar.gz
tar -xvzf nanominer-linux-1.8.2.tar.gz

mv Claymore.s.Dual.Ethereum.AMD+NVIDIA.GPU.Miner.v15.0.-.LINUX claymore15
mv PhoenixMiner_4.9c_Linux phoenixminer
mv ePIC-Boost-Miner-v1.2.0 ePIC-Boost-Miner
mv lolMiner_v0981_Lin64 lolminer
mv nanominer-linux-1.8.2 nanominer

chown root:root claymore15
chown root:root phoenixminer
chown root:root ePIC-Boost-Miner
chown root:root lolminer
chown root:root nanominer

chmod -R 777 claymore15
chmod -R 777 phoenixminer
chmod -R 777 ePIC-Boost-Miner
chmod -R 777 lolminer
chmod -R 777 nanominer
chmod -R 777 scriptsminig

mv /root/scriptsminig/claymore.service /etc/systemd/system/
mv /root/scriptsminig/phoenix.service /etc/systemd/system/
mv /root/scriptsminig/grin29.service /etc/systemd/system/
mv /root/scriptsminig/grin31.service /etc/systemd/system/
mv /root/scriptsminig/overclock.service /etc/systemd/system/






