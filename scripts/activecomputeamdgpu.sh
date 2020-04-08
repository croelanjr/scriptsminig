#!/bin/sh

echo "*********************************************************"
echo "***	ADICION Y CONFIGURACCION DE PARAMETROS AMDGPU	***"
echo "***					EN CENTOS 8						***"
echo "*********************************************************"

echo "******* ARCHIVO ORIGINAL *********"
cat /etc/default/grub

echo "**** MODIFICA EL PARAMETRO *****"
sed -i 's/quiet/quiet amdgpu.ppfeaturemask=0xffffffff/' "/etc/default/grub"

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



