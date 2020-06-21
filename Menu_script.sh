#!/bin/bash
echo "Voici un menu de choix pour choisir le script que vous souhaiter."
echo ""
echo "Selectionner \"vaapi\" pour utiliser le script d'activation de l'acceleration matériel."
echo "Selectionner \"grub-fr\" pour utiliser le script de mise en place du bon clavier pour grub."
echo "Selectionner \"grub-show\" pour utiliser le script pour rendre visible grub."
echo ""
read -p "Faite votre choix vaapi, grub-fr ou grub-show : " option
echo ""

case $option in
    vaapi)
    ./install-vaapi.sh
    ;;

    grub-fr)
    ./keyboard-grub.sh
    ;;

    grub-show)
    ./show-grub.sh
    ;;

    *)
    echo "Veuillez entrer le bonne proposition"
    exit 1
    ;;
esac
