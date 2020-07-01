#!/bin/bash

PS3='Veuillez faire votre choix : '
options=("Nvidia" "Intel" "Catalyst" "AMD Radeon")

param="echo 'Installation terminer. Il vous reste plus qu'a paramètrer les autres application.'"
dejainstall="echo L'accélération matériel est déja active."
menu="./Menu_script.sh"
vainfo="sudo apt install vainfo"

select opt in "${options[@]}"
do

    case $opt in
	    "Nvidia")
            if ! dpkg -s vdpau-va-driver libvdpau1 >/dev/null 2>&1; then
	        $vainfo
	        sudo apt install vdpau-va-driver libvdpau1
	        vainfo
	        $param       
            else
                $dejainstall
                exit 1
            fi
	    ;;

	    "Intel")
            if ! dpkg -s libvdpau-va-gl1 >/dev/null 2>&1; then
	        $vainfo
	        sudo apt install libvdpau-va-gl1 
	        sudo sh -c "echo 'export VDPAU_DRIVER=va_gl' >> /etc/profile"
	        vainfo
	        $param
            else
                $dejainstall
                exit 1

            fi
	    ;;

	    "Catalyst")
            if ! dpkg -s xvba-va-driver libvdpau-va-gl1 >/dev/null 2>&1; then
	        $vainfo
	        sudo apt install xvba-va-driver libvdpau-va-gl1
	        sudo sh -c "echo 'export VDPAU_DRIVER=va_gl' >> /etc/profile"
	        vainfo
	        $param       
            else
                $dejainstall
                exit 1
            fi
	    ;;

	    "AMD Radeon")
            if ! dpkg -s mesa-va-drivers mesa-vdpau-drivers >/dev/null 2>&1; then
	        $vainfo
	        sudo apt install mesa-va-drivers mesa-vdpau-drivers
	        vainfo
	        $param   
            else
                $dejainstall
                exit 1
            fi     
	    ;;

	    *)
		    echo "Veuillez utiliser le bon mode d'installation $REPLY"
	    ;;
    esac
done
