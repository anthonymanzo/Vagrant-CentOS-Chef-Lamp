Vagrant CentOS 6.5 Chef Lamp
=========================

#Pre
Install the following required packages on your local workstation:
- VirtualBox | https://www.virtualbox.org/wiki/Downloads
- Chefdk | https://docs.chef.io/install_dk.html
- Vagrant | http://www.vagrantup.com/downloads.html
- Vagrant Vsphere Provider | https://github.com/nsidc/vagrant-vsphere 

#Installation
After install `Chefdk`, `Vagrant`, `Vagrant Vsphere` and `Virtualbox`, clone or download this project as a regular system user (not root)
```
cd ~
git clone https://github.com/anthonymanzo/Vagrant-CentOS-Chef-Lamp
```

#Configuration
Most of the configuration is done in the [VagrantFile] (VagrantFile) for setting up the VM in either Vsphere or VirtualBox.
Chef recipes are modified with attributes that are set in the [VagrantFile] (VagrantFile) `chef.json` node.


- Virtualbox
- Vagrant
- NREL Vagrant Base Boxes | https://github.com/NREL/vagrant-boxes
- Chef | https://www.getchef.com

#Usage
Install and bring up a sytem (from the cloned ~/Vagrant-CentOS-Chef-Lamp directory)
 
`vagrant up --provider=virtualbox` or `vagrant up --provider=vsphere`

Having problems?  Use `--debug` on the command.

After the system has started to load, it will ask for a password, this will go away once I generate a ssh key, but I'm not there yet.  So for now type in 'vagrant'.

After the system has loaded and been provisioned by Chef you can login to the system
```
vagrant ssh
```
More info on Vagrant Commands | http://docs.vagrantup.com/v2/cli/index.html

