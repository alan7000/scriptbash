#!/bin/bash

PS3='Veuillez faire votre choix : '
options=("vaapi" "grub-fr" "grub-show" "Quitter")

echo "Cette ensemble de script vous propose plein de possibilités comme : 
- L'activation de l'accéleration gpu matériel.
- Mettre le clavier en azerty pour grub.
- Rendre grub visible.

Pour activer l'accéleration gpu matériel, veuillez selectionner la première 
option.
"
echo "${options[3]}"
select opt in "${options[@]}"
do

    case $opt in
        "vaapi")
            ./install-vaapi.sh
            exit 0
            ;;

        "grub-fr")
            ./keyboard-grub.sh
            exit 0
            ;;

        "grub-show")
            ./show-grub.sh
            exit 0
            ;;

        "Quitter")
            break
            ;;

        *)
        echo "Mauvaise option $REPLY";;
    esac
done
