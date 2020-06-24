# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

CONFIG_JSON = "config.json"

if File.exists?(CONFIG_JSON) then
  user_config = JSON.load(File.read(CONFIG_JSON))
else
  puts "#{CONFIG_JSON} does not exist"
  exit
end

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/ubuntu-19.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  if user_config.has_key?("forwarded_ports") then
    user_config["forwarded_ports"].each do |forwarded_port|
      config.vm.network "forwarded_port", guest: forwarded_port["guest"], host: forwarded_port["host"]
    end
  end

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  if user_config.has_key?("private_network_ip") then
    config.vm.network "private_network", ip: user_config["private_network_ip"]
  end

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  if user_config.has_key?("site_root_dir") then
    config.vm.synced_folder user_config["site_root_dir"], "/vagrant_data/site", :owner => 'www-data', :group => 'www-data'
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  if user_config.has_key?("provision_paths") then
    user_config["provision_paths"].each do |provision_path|
      config.vm.provision "shell", :path => provision_path
    end
  end
end
