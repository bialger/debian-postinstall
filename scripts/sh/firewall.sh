#!/bin/bash

apt install ufw -y
ufw enable
ufw logging off
ufw status verbose