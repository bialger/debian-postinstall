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
./scripts/py/main.py
