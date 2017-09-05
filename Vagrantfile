# -*- mode: ruby -*-
# vi: set ft=ruby :



$set_environment_variables = <<SCRIPT
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF
export GOROOT="/usr/local/go"
export GOPATH="/home/vagrant/golocal"
export PATH="$PATH:$GOROOT/bin:%GOPATH/bin"
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
EOF
SCRIPT

$install_go_apps_script = <<-SCRIPT
go get -u github.com/golang/protobuf/proto
go get -u github.com/golang/protobuf/protoc-gen-go
go get -u google.golang.org/grpc
go get -u github.com/go-swagger/go-swagger/cmd/swagger
go get -u github.com/spf13/cobra/cobra
go get -u go.uber.org/zap
go get -u github.com/golang/dep/cmd/dep
SCRIPT


$run_daemons = <<-SCRIPT
sudo dockerd &
sudo docker run -d -p 8091-8093:8091-8093 -p 11210:11210 couchbase
SCRIPT

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
  config.vm.box = "ubuntu/trusty64"
  #config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false


  config.vm.provision "shell", inline: $set_environment_variables, run: "always"
  config.vm.provision "shell", path: "https://raw.githubusercontent.com/MagnusTiberius/vagrant_provision/master/setupbox.sh"
  #config.vm.provision "shell", inline: $run_daemons, run: "always"
  config.vm.provision "shell", inline: $install_go_apps_script, privileged: false


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8091, host: 8091
  config.vm.network "forwarded_port", guest: 8092, host: 8092
  config.vm.network "forwarded_port", guest: 11207, host: 11207
  config.vm.network "forwarded_port", guest: 11210, host: 11210
  config.vm.network "forwarded_port", guest: 11211, host: 11211
  config.vm.network "forwarded_port", guest: 11214, host: 11214
  config.vm.network "forwarded_port", guest: 11215, host: 11215
  config.vm.network "forwarded_port", guest: 18091, host: 18091
  config.vm.network "forwarded_port", guest: 18092, host: 18092

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end


#ref
#http://aruizca.com/steps-to-create-a-vagrant-base-box-with-ubuntu-14-04-desktop-gui-and-virtualbox/
