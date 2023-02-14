#!/bin/bash
podman_installed=$(rpm -q podman | grep -c not)

if [ "$podman_installed" -eq 1 ]; then
  sudo dnf install -y podman
else
  echo "==> Podman is already installed."
fi

echo "==> $(podman --version)"

mkdir -p /home/vagrant/volume/
chown vagrant:vagrant /home/vagrant/volume/
echo "==> Test volume /home/vagrant/volume/"