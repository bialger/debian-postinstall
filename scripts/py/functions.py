import os
import subprocess


def is_success(command):
    exit_code = os.system(command) >> 8
    return exit_code == 0


def check_for_error(is_ok, error_string, exit_code=1):
    if not is_ok:
        print_error_and_exit(error_string, exit_code)


def print_error_and_exit(error_string, exit_code=1):
    if error_string != "":
        print(error_string)

    exit(exit_code)


def get_output(command):
    return subprocess.getoutput(command)


def is_positive(c):
    return 'Y' in c or 'y' in c or 'YES' in c or 'yes' in c or 'Д' in c or 'д' in c or 'ДА' in c or 'да' in c
