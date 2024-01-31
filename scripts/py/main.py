#! /usr/bin/python

import platform
import functions

functions.check_for_error(platform.system() == "Linux", "This script can be started only on Linux")
functions.check_for_error(functions.get_output("whoami") == "root", "Run this script only from root (use sudo)")

print()
print("Debian post-installation script started")

logged = functions.get_output("lastlog").split("\n")[1:]
users = [user_info.split()[0] for user_info in logged if user_info.split()[1][0:2] != "**"]

print("Non root users:")

for user in users:
    if user != "root":
        print(user)
