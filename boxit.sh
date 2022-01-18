#!/bin/bash

BOX_NAME=pop_os_2110

sudo cp /var/lib/libvirt/images/ubuntu20.04.qcow2 ./box.img
# if you need to convert the image?
# sudo qemu-img convert -f raw -O qcow2  test.img  ubuntu.qcow2
sudo chown kent:docker box.img
tar cvzf ${BOX_NAME}.box ./metadata.json ./Vagrantfile ./box.img 
vagrant box add --name ${BOX_NAME} ${BOX_NAME}.box
