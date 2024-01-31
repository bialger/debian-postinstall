#! /usr/bin/python

import platform
import functions

functions.check_for_error(platform.system() == "Linux", "This script can be started only on Linux")
functions.check_for_error(functions.get_output("whoami") == "root", "Run this script only from root (use sudo)")

print("Debian post-installation script started")
