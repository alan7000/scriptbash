#!/bin/bash
echo "Voici un menu de choix pour choisir le script que vous souhaiter."
echo ""
echo "Selectionner \"vaapi\" pour utiliser le script d'activation de l'acceleration matériel."
echo "Selectionner \"grub\" pour utiliser le script de mise en place du bon clavier pour grub."
echo ""
read -p "Faite votre choix vaapi ou grub : " option
echo ""

case $option in
    vaapi)
    ./install-vaapi.sh
    ;;

    grub)
    ./keyboard-grub.sh
    ;;

    *)
    echo "Veuillez entrer le bonne proposition"
    exit 1
    ;;
esac
