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
In current project folder simply run `vagrant up --provider=virtualbox` or `vagrant up --provider=vsphere`
If using vsphere, make sure to set the vcenter user credentials in the VagrantFile to AD credentials that are privileged to create VMs.

#Configuration
Most of the configuration is done in the [VagrantFile] (VagrantFile) for setting up the VM in either Vsphere or VirtualBox.
Chef recipes are modified with attributes that are set in the [VagrantFile] (VagrantFile) `chef.json` node.


- Virtualbox
- Vagrant
- NREL Vagrant Base Boxes | https://github.com/NREL/vagrant-boxes
- Chef | https://www.getchef.com
