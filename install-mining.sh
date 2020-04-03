#!/bin/sh

echo "*********************************************************"
echo "***	INSTALACCION DE HERRAMIENTAS DE MINING CRYPTO	***"
echo "***				EN CENTOS 8						***"
echo "*********************************************************"

set enforce 0 sestatus

echo "******* Instalando los respositorios necesarios *******"
yum update -y
yum install epel-realese -y 
yum groupinstall "Development Tools" -y 
yum install wget vim net-tools pciutils openssl -y

wget --referer http://support.amd.com/ https://drivers.amd.com/drivers/linux/19.50/amdgpu-pro-19.50-967956-rhel-8.1.tar.xz
tar -Jxvf amdgpu-pro*
#cd amdgpu-pro-19.50-967956-rhel-8.1
#./amdgpu-pro-install -y --opencl=legacy
#cd

echo "********Descargando las herramientas para Mining ********" 
wget https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/15.0/Claymore.s.Dual.Ethereum.AMD+NVIDIA.GPU.Miner.v15.0.-.LINUX.zip
wget https://github.com/Phoenix-Miner/PhoenixMiner/releases/download/4.9c/PhoenixMiner_4.9c_Linux.zip
wget https://github.com/EPICBOOST/ePIC-Boost-Miner/releases/download/v1.2.0/ePIC-Boost-Miner-v1.2.0.tar.gz
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/0.98/lolMiner_v0981_Lin64.tar.gz
wget https://github.com/nanopool/nanominer/releases/download/v1.8.2/nanominer-linux-1.8.2.tar.gz
wget https://github.com/NebuTech/NBMiner/releases/download/v28.1/NBMiner_28.1_Linux.tgz

echo "******* Descargando los repositorios ********"
git clone https://github.com/DominiLux/amdgpu-pro-fans.git
git clone https://github.com/RadeonOpenCompute/ROC-smi.git
git clone https://github.com/croelanjr/scriptsminig.git
git clone https://github.com/sibradzic/amdgpu-clocks.git

echo "********** Descomprimiendo los archivos de las herramientas de mining ***********"
unzip Claymore.s.Dual.Ethereum.AMD+NVIDIA.GPU.Miner.v15.0.-.LINUX.zip
unzip PhoenixMiner_4.9c_Linux.zip
tar -xvzf ePIC-Boost-Miner-v1.2.0.tar.gz
tar -xvzf lolMiner_v0981_Lin64.tar.gz
tar -xvzf nanominer-linux-1.8.2.tar.gz
tar -xvzf NBMiner_28.1_Linux.tgz

mv Claymore\'s\ Dual\ Ethereum\ AMD+NVIDIA\ GPU\ Miner\ v15\ 0\ -\ LINUX/ claymore15
mv PhoenixMiner_4.9c_Linux/ phoenixminer
mv ePIC-Boost-Miner-v1.2.0/ ePICBoostMiner
mv 0.9.8.1/ lolminer
mv nanominer-linux-1.8.2/ nanominer
mv NBMiner_28.1_Linux/ nbminer

echo "********** Abriendo los permisos de las herramientas mining *********"
chown root:root claymore15
chown root:root phoenixminer
chown root:root ePICBoostMiner
chown root:root lolminer
chown root:root nanominer
chown root:root nbminer

chmod -R 777 claymore15
chmod -R 777 phoenixminer
chmod -R 777 ePICBoostMiner
chmod -R 777 lolminer
chmod -R 777 nanominer
chmod -R 777 nbminer
chmod -R 777 scriptsminig

echo "********* Traslando los archivos de servicios para el arrange automatico de Mining *******"
mv /root/scriptsminig/scripts/claymore.service /etc/systemd/system/
mv /root/scriptsminig/scripts/phoenix.service /etc/systemd/system/
mv /root/scriptsminig/scripts/grin29.service /etc/systemd/system/
mv /root/scriptsminig/scripts/grin31.service /etc/systemd/system/
mv /root/scriptsminig/scrips/overclock.service /etc/systemd/system/