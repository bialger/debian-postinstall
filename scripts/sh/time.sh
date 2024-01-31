#!/bin/bash

apt install chrony -y
systemctl start chrony
systemctl enable --now chrony
