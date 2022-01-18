# Making Custom Boxes in Vagrant through libvirt

This is a demo to explain how to make custom boxes in `vagrant` that use the `libvirt` provider
Recording for posterity, where I will ultimately forget
The following guides were used to make this demo:

- [Stackoverflow - how to create custom vagrant box from libvirt/kvm instance?](https://unix.stackexchange.com/a/222907)
- [PopOS 20.10 Guest OS support?](https://discuss.hashicorp.com/t/popos-20-10-guest-os-support/25049/3) for guest detection
  - This was a specific hack needed for the image I'm building here, but may come in handy for other images

This is done on `Pop!_OS 20.10` which is based on `Ubuntu 20.10`

## General Process

This guide presumes you've already followed general procedure for setting up a box.

Lets say you're at the spot where your `libvirt` VM is ready to packaging.
Follow `./boxit.sh`. The steps include:

1. Copy your box over from `/var/lib/libvirt/images` to `box.img`. It must be in the `qcow2` format
2. Create a `metadata.json` and `Vagrantfile`
3. `tar` the following files:
  - `box.img`
  - `Vagrantfile`
  - `metadata.json`
4. That should be it. Load into vagrant with `vagrant box add --name custom custom_box.box`
5. Upload to https://app.vagrantup.com

## Notes

This is following the older `box` guide where they were just `tar` archives
https://www.vagrantup.com/docs/boxes/format

You can also use:
- `vagrant repackage` to get a `.box` files
  e.g. `vagrant box repackage pop_os_2110 libvirt 1.1.0`
- `vagrant cloud provider upload` to upload to vagrant cloud
  e.g. `vagrant cloud provider upload kentbrockman/pop_os_2110 libvirt 1.1.0 package.box`
