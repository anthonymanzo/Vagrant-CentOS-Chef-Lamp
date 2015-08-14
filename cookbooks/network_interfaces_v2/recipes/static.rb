# -*- mode: ruby -*-
# vi: set ft=ruby :

network_interface node['network_interfaces_v2']['device'] do
  bootproto 'static'
  address node['network_interfaces_v2']['address'] 
  netmask node['network_interfaces_v2']['netmask']
  gateway node['network_interfaces_v2']['gateway']
end