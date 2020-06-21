#!/bin/bash
param="echo 'Installation terminer. Il vous reste plus qu'a paramètrer les autres application.'"
vainfo=sudo apt install vainfo

echo "Selectionner le mode d'installation n, i, c, r"

read -p "Veuillez mettre l'option d'installation : " option
echo ""

case $option in
	n)
	$vainfo
	sudo apt install vdpau-va-driver libvdpau1
	vainfo
	$param
	#exit 0
    read -a a
	;;

	i)
	$vainfo
	sudo apt install libvdpau-va-gl1
	sudo sh -c "echo 'export VDPAU_DRIVER=va_gl' >> /etc/profile"
	vainfo
	$param
	#exit 0
    read -a a
	;;

	c)
	$vainfo
	sudo apt install xvba-va-driver libvdpau-va-gl1
	sudo sh -c "echo 'export VDPAU_DRIVER=va_gl' >> /etc/profile"
	vainfo
	$param
	#exit 0
    read -a a
	;;

	r)
	$vainfo
	sudo apt install mesa-va-drivers mesa-vdpau-drivers
	vainfo
	$param
	#exit 0
    read -a a
	;;

	*)
		echo "Veuillez utiliser le bon mode d'installation"
		exit 1
	;;

esac
