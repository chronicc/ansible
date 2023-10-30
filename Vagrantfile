require_relative './vagrant_plugins/key_authorization'

Vagrant.configure('2') do |config|

  if config.vm.guest == :linux
    authorize_key_for_root config, ENV['ANSIBLE_SSH_PUBLIC_KEY_PATH']
  end

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = false
  config.vagrant.plugins = [
    'vagrant-hostmanager',
    'vagrant-libvirt',
  ]
  config.vm.provider "libvirt"
  config.winrm.max_tries = 300
  config.winrm.retry_delay = 2

  #---( Generic Machines )----------------------------------------------------

  config.vm.define "#{ENV['ANSIBLE_CENTOS_6_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_CENTOS_6_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_CENTOS_6_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_CENTOS_7_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_CENTOS_7_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_CENTOS_7_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_CENTOS_8_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_CENTOS_8_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_CENTOS_8_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_DEBIAN_10_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_DEBIAN_10_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_DEBIAN_10_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_DEBIAN_11_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_DEBIAN_11_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_DEBIAN_11_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_DEBIAN_12_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_DEBIAN_12_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_DEBIAN_12_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_FEDORA_36_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_FEDORA_36_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_FEDORA_36_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_FEDORA_37_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_FEDORA_37_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_FEDORA_37_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_FEDORA_38_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_FEDORA_38_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_FEDORA_38_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_UBUNTU_1804_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_UBUNTU_1804_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_UBUNTU_1804_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_UBUNTU_2004_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_UBUNTU_2004_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_UBUNTU_2004_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_UBUNTU_2204_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_UBUNTU_2204_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_UBUNTU_2204_HOSTNAME']}.vagrant"
  end

  config.vm.define "#{ENV['ANSIBLE_WINDOWS_SERVER_2022_HOSTNAME']}" do |host|
    host.vm.box = ENV['ANSIBLE_WINDOWS_SERVER_2022_BOX_IMAGE']
    host.vm.network 'private_network', type: 'dhcp'
    host.vm.hostname = "#{ENV['ANSIBLE_WINDOWS_SERVER_2022_HOSTNAME']}"
    host.vm.guest = :windows
  end

  #---( Application Specific Machines )---------------------------------------

  (1..3).each do |machine_id|
    config.vm.define "hadoop-#{machine_id}" do |host|
      host.vm.box = ENV['ANSIBLE_HADOOP_BOX_IMAGE']
      host.vm.network 'private_network', type: 'dhcp'
      host.vm.hostname = "hadoop-#{machine_id}.vagrant"
    end
  end

  #---( Resource Setup )------------------------------------------------------

  config.vm.provider :libvirt do |vm|
    vm.cpus = ENV['ANSIBLE_VM_CPUS']
    vm.memory = ENV['ANSIBLE_VM_MEMORY']
  end

  config.vm.provider :virtualbox do |vm|
    vm.customize ["modifyvm", :id, "--memory", ENV['ANSIBLE_VM_MEMORY']]
    vm.customize ["modifyvm", :id, "--cpus", ENV['ANSIBLE_VM_CPUS']]
  end

end
