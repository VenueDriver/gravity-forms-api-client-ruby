# -*- mode: ruby -*-
# vi: set ft=ruby :
# This is a Vagrant configuration file. It can be used to set up and manage
# virtual machines on your local system or in the cloud. See http://downloads.vagrantup.com/
# for downloads and installation instructions, and see http://docs.vagrantup.com/v2/
# for more information and configuring and using Vagrant.

Vagrant.configure("2") do |config|
  
  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "gentoo-latest-i686"
  config.vm.box = "ubuntu-13.04-mini-i386"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_provisionerless.box"
  config.vm.box_url =
    "https://dl.dropboxusercontent.com/u/4387941/vagrant-boxes/ubuntu-13.04-mini-i386.box"

  # This can be set to the host name you wish the guest machine to have. Vagrant
  # will automatically execute the configuration necessary to make this happen.
  config.vm.hostname = "gravity"

  config.vm.provider "virtualbox" do |v|
    v.name = 'gravity'
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
    v.customize ["modifyvm", :id, "--memory", "4096"]
    v.customize ["modifyvm", :id, "--cpus", 4]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # port 3000 on the virtual machine is forwarded to port 7777 on the host.
  # This will allow the virtual machine to communicate of the common proxy port 7777.
  # config.vm.network :forwarded_port, guest: 3000, host: 7782, auto_correct: true

  # This port will be used to see/debug background tasks
  # config.vm.network :forwarded_port, guest: 5678, host: 7770

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # View the documentation for the provider you're using for more
  # information on available options.
  # config.omnibus.chef_version = :latest
  
  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.

  # Un-comment this to update portage during provisioning.  Good to run this at least once.  Slow.
  config.vm.provision :shell, :inline => "apt-get upgrade"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks/development"
    chef.log_level = :debug
    chef.add_recipe "configure"
  end

end
