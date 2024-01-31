#! /usr/bin/python

import platform
import functions

functions.check_for_error(platform.system() == "Linux", "This script can be started only on Linux")
functions.check_for_error(functions.get_output("whoami") == "root", "Run this script only from root (use sudo)")

print()
print("Debian post-installation script started")

logged = functions.get_output("lastlog").split("\n")[1:]
users = [user_info.split()[0] for user_info in logged if
         user_info.split()[1][0:2] != "**" and user_info.split()[0] != "root"]

print("Non root users:")

for user in users:
    if user != "root":
        print(user)
        functions.check_for_error(functions.is_success("sudo usermod -aG sudo " + user),
                                  "Failed to add user " + user + " to sudo group")

print()
print(functions.get_output("./scripts/sh/time.sh"))
print("\nCurrent time status:\n" + functions.get_output("timedatectl status"))
print("Available timezones:")

timezones = functions.get_output("echo $(timedatectl list-timezones)").split()

for i in range(len(timezones)):
    print(str(i + 1) + ".\t" + timezones[i])

choice = input("\nEnter suitable timezone number in list. If default timezone is suitable, enter any other key: ")

if choice.isdigit() and 0 < int(choice) <= len(timezones):
    print(functions.get_output("timedatectl set-timezone " + timezones[int(choice) - 1] + " --adjust-system-clock"))

print(functions.get_output("sudo timedatectl set-ntp yes"))
print(functions.get_output("./scripts/sh/package_managers.sh"))
print(functions.get_output("./scripts/sh/firewall.sh"))
print(functions.get_output("./scripts/sh/utils.sh"))
print(functions.get_output("./scripts/sh/browsers.sh"))
# TODO: add /etc/default/grub and /etc/apt/sources.list fixing
print()
print("Debian post-installation script finished")
