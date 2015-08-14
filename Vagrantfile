# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	
	#use a hostname that will be equal to its dns name (best practice)
	config.vm.hostname = 'lamp2'
	
	#config.ssh.private_key_path = './vagrant_private.key';
	config.ssh.insert_key = true
	

	#If using on your localhost via VirtualBox 
	config.vm.provider :virtualbox do |vb, override|
		override.vm.box = "CentOS-6.5-x86_64-v20140504"
		override.vm.network "private_network", type: "dhcp"
		override.vm.box_url = 'https://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140504.box'
	end
  
  
	 #If using on vcenter/vsphere host
	 config.vm.provider :vsphere do |vsphere, override|
		
		# Every Vagrant virtual environment requires a box to build off of.
		override.vm.box = 'dummy'
		override.vm.box_url = './dummy.box'

		#Folder locally to sync to the new host
		config.vm.synced_folder "./", "/vagrant"
  
		# The vcenter host we're going to connect to
		vsphere.host = 'natty.ad.salk.edu'                            

	   # The esxi host for the new VM
		vsphere.compute_resource_name = 'tony-test-esxi.salk.edu'            

		# The resource pool for the new VM
		vsphere.resource_pool_name = 'WebApp'                    

		# The template we're going to clone     
		#  this needs to exist on the compute_resource_name above   
		vsphere.template_name = 'Templates/VagrantCent6xV2'    

		# The name of the new machine
		# Optional name of the new VM, if missing the name will be auto generated
		# vsphere.name = 'lamp1'
	
	
		#  this needs to exist on the compute_resource_name above 
		vsphere.data_store_name = 'datastore1'
	
		#Path to folder where new VM should be created, default: template's parent
		vsphere.vm_base_path =  '/vagrant-machines/'                                    

		# vSphere login (can use domain\ style)
		vsphere.user = 'AD\yourVsphereAccount'                                    

		# vSphere password
		vsphere.password = 'yourVspherePassword'                            

		# If you don't have SSL configured correctly, set this to 'true'
		vsphere.insecure = true   
	
								   
	  end

	  config.vm.provision "chef_solo" do |chef|
		chef.log_level = :debug
		chef.add_recipe "apache2"
		chef.add_recipe "php"
		chef.add_recipe "apache2::mod_php5"
		chef.add_recipe "mysql::server"
		chef.add_recipe "php::module_mysql"
	    chef.add_recipe "network_interfaces_v2::static"
		#this is where attributes for recipes can be set
		chef.json = {
			"mysql_service" => {
				"version" => "5.6"
			},
			"mysql"=>			{
				"server_root_password" =>"h0t5h1t"
			},
			#Specify static address here on eth1
			# eth0 is used by vagrant
			"network_interfaces_v2" => {   
				"device"  => "eth1",	
				"address" => "10.1.64.232",
				"netmask" => "255.255.255.0",
				"gateway" => "10.1.64.1"
			}
		}
	  end
  
	  config.vm.provision "shell", inline: "yum install -y php-mbstring", privileged: true
	  config.vm.provision "shell", path: "shellscripts/subversion_installer_1.8.sh", args: ["-y"], privileged: true

	  config.vm.provision "shell", inline: "service iptables stop", privileged: true
	  config.vm.provision "shell", inline: "chkconfig iptables off", privileged: true

	  config.vm.provision "shell", inline: "service httpd restart", privileged: true
	  config.vm.provision "shell", inline: "mkdir -p /etc/httpd/htdocs", privileged: true
	  config.vm.provision "shell", inline: "echo '<h1>It works</h1><p>/etc/httpd/htdocs/index.html</p>' > /etc/httpd/htdocs/index.html", privileged: true
	  config.vm.provision "shell", inline: "cp -rf /vagrant/htdocs/* /etc/httpd/htdocs/", privileged: true
  

end
