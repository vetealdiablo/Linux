#/bin/bash

echo "LANG=es_AR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=es" >> /etc/vconsole.conf
echo "midna" >> /etc/hostname
echo "es_AR.UTF-8 UTF-8" >> /etc/locale.gen
echo "es_AR ISO-8859-1" >> /etc/locale.gen
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
locale-gen
grub-install /dev/sdb
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -p linux
useradd -m -g users -G wheel,audio,lp,optical,storage,video,games,power,scanner -s /bin/bash cesc
usermod -c "Cesc" cesc
passwd cesc
pacman -S xorg xorg-fonts-misc nvidia nvidia-settings nvidia-utils gnome gnome-extra
nvidia-xconfig
systemctl enable gdm
systemctl enable NetworkManager
passwd