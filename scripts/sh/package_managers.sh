#!/bin/bash

apt install snapd -y
systemctl start snapd
systemctl enable --now snapd
ln -s /var/lib/snapd/snap /snap
yes | snap install snap-store

add-apt-repository ppa:alexlarsson/flatpak -y > /dev/null 2> /dev/null
apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists gnome https://sdk.gnome.org/gnome.flatpakrepo
flatpak remote-add gnome-apps https://sdk.gnome.org/gnome-apps.flatpakrepo
flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo

if [ -e /usr/bin/snap-install ]; then
  rm /usr/bin/snap-install
fi

if [ -e /usr/bin/flatpak-install ]; then
  rm /usr/bin/flatpak-install
fi

cp ./assets/snap-install /usr/bin/snap-install
cp ./assets/flatpak-install /usr/bin/flatpak-install
