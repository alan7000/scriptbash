#!/bin/bash

echo "Création du dossier layout dans le dossier /boot/grub"
sudo mkdir /boot/grub/layouts

echo ""
echo "Création du fichier grub en français."
sudo grub-kbdcomp -o /boot/grub/layouts/fr.gkb fr

echo ""
echo "Ajout d'un paramètre dans /etc/default/grub"
sudo sh -c "echo '# Custom config' >> /etc/default/grub"
sudo sh -c "echo 'GRUB_TERMINAL_INPUT=at_keyboard' >> /etc/default/grub"

echo ""
echo "Ajout d'un fichier custom grub pour activer le clavier en français."
grubd=/etc/grub.d/40_custom
sudo sh -c "echo '# Clavier fr' >> $grubd"
sudo sh -c "echo 'insmod keylayouts' >> $grubd"
sudo sh -c "echo 'keymap fr' >> $grubd"

echo ""
echo "Mise a jour de grub."
sudo update-grub

echo ""
echo "Activation du clavier en français terminer"
read -a a
