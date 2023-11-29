require 'yaml'
require_relative './vagrant_plugins/key_authorization'

input = YAML.load_file('vagrant.yml')

Vagrant.configure('2') do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = false
  config.vagrant.plugins = [
    'vagrant-hostmanager',
    'vagrant-libvirt',
  ]
  config.winrm.max_tries = 300
  config.winrm.retry_delay = 2

  #---( Machines )------------------------------------------------------------

  input['nodes'].each do |node|
    config.vm.define "#{node['name']}", autostart: false do |n|
      n.vm.box = node['box']
      if node['version']
        n.vm.box_version = node['version']
      end
      n.vm.network 'private_network', type: 'dhcp'
      n.vm.hostname = node['name']
      if node['guest'] == 'linux'
        authorize_key_for_root n, ENV['ANSIBLE_SSH_PUBLIC_KEY_PATH']
      end
      if node['guest'] == 'windows'
        n.vm.guest = :windows
      end
    end
  end

  #---( Provider )------------------------------------------------------------

  config.vm.provider 'libvirt' do |libvirt|
    libvirt.id_ssh_key_file = ENV['ANSIBLE_SSH_PRIVATE_KEY_PATH']
    libvirt.cpus = ENV['ANSIBLE_VM_CPUS']
    libvirt.memory = ENV['ANSIBLE_VM_MEMORY']
  end
end
