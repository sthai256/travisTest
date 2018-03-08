#!/bin/sh

echo hello


sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

/opt/android-sdk-linux/emulator/emulator -avd test -no-audio -no-window

echo -n "Waiting for device to boot \n"
adb wait-for-device

echo "Unlocking screen\n"
adb shell input keyevent 82

flutter drive ./test_driver/simple.dart