#! /bin/sh

# shellcheck disable=SC2046
# shellcheck disable=SC2005

if [ "$(whoami)" != "root" ]; then
  echo "Run this script only from root"
  exit 1
fi

python_path=$(echo $(find /usr/bin/python*) | cut -f 1 -d ' ')
ln "$python_path" /usr/bin/python
chmod +x ./scripts/py/main.py
./scripts/py/main.py
