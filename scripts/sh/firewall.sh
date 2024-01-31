#!/bin/bash

apt install ufw -y
sudo ufw enable
sudo ufw logging off
sudo ufw status verbose