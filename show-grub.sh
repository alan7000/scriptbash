#!/bin/bash

if [ ! -f "/etc/default/grub.d/90_custom.cfg" ]; then

link=/etc/default/grub.d/90_custom.cfg
echo "Création du fichier custom."
sudo touch $link

echo ""
echo "Ajout des paramètre de grub dans le fichier custom."
sudo sh -c "echo '# Custom config' >> $link"
sudo sh -c "echo 'GRUB_TIMEOUT=\"5\"' >> $link"
sudo sh -c "echo 'GRUB_TIMEOUT_STYLE=\"menu\"' >> $link"

echo ""
echo "Mise a jour de GRUB."
sudo update-grub

echo ""
echo "Grub est a présent visible."
read -a a

else
    echo "Erreur la configuration est déjà présente !"
    exit 1
fi
