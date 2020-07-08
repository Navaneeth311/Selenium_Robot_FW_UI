import os


def create_folder(folder_name):
    os.mkdir("/user/navaneeth/Documents/"+ folder_name)


def create_subfolder(subfolder):
    os.mkdir("/user/navaneeth/Documents/Robot_file/"+subfolder)


def username(name,domain):
    username = name+"007"+domain
    return username


