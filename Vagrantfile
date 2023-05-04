Vagrant.configure("2") do |config|

  # I using a Linux version Ubuntu 18.04 LTS from Hashicorp
  config.vm.box = "hashicorp/bionic64"

  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = 2048
    v.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
    v.customize ['modifyvm', :id, '--vram', '16']
  end

  # here i will configure network and hostname 
  config.vm.define "challenge-vm" do |m|
    m.vm.network "private_network", ip: "172.17.177.51"
    m.vm.hostname = "challenge-vm"
    # that is my bash script to install docker, kubernetes and linux packages
    m.vm.provision "shell", path: "dependencies.sh"
    m.vm.provision "shell", inline: "echo 'The challenge VM successfully created!, wait about 2 minutes and access IP http://172.17.177.51'"

  end

end