#! /bin/sh

# shellcheck disable=SC2046
# shellcheck disable=SC2005

if [ "$(whoami)" != "root" ]; then
  echo "Run this script only from root"
  exit 1
fi

if [ -e /usr/bin/python ]; then
  rm /usr/bin/python
fi

apt update > /dev/null 2> /dev/null
apt upgrade -y
apt install python3 python3-pip sudo -y

python_path=$(echo $(find /usr/bin /bin -name "python3*" -not -name "*-*") | cut -f 1 -d ' ')
ln "$python_path" /usr/bin/python

chmod +x ./scripts/py/main.py
chmod +x ./scripts/py/functions.py
chmod +x ./scripts/sh/time.sh
chmod +x ./scripts/sh/package_managers.sh
chmod +x ./scripts/sh/firewall.sh
chmod +x ./scripts/sh/utils.sh
chmod +x ./scripts/sh/browsers.sh
chmod +x ./assets/snap-install
chmod +x ./assets/flatpak-install

./scripts/py/main.py
