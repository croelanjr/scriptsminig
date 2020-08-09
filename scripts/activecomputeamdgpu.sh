#!/bin/sh

echo "*********************************************************"
echo "***	ADICION Y CONFIGURACCION DE PARAMETROS AMDGPU	***"
echo "***					EN CENTOS 8						***"
echo "*********************************************************"

echo "******* ARCHIVO ORIGINAL *********"
cat /etc/default/grub

echo "**** MODIFICA EL PARAMETRO *****"
# En caso que no funciona pci=nomsi o pci=noaer, puedes usar pcie_asm=off
sed -i 's/quiet/quiet amdgpu.vm_fragment_size=9 amdgpu.ppfeaturemask=0xffffffff pci=noaer/' "/etc/default/grub"

echo "**** ARCHIVO MODIFICADO ****"
cat /etc/default/grub

echo "*************************"
echo "*** GENERANDO EL GRUB ***"
echo "*************************"
grub2-mkconfig -o /boot/grub2/grub.cfg

echo "*************************************************"
echo "* En 20 segundos se reinicia el Hardware Mining *"
echo "*************************************************"
sleep 20
systemctl reboot