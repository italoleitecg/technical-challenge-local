Vagrant.configure("2") do |config|

  #linux versão ubuntu 18.04 LTS da Hashicorp
  config.vm.box = "hashicorp/bionic64"

  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = 2048
    v.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
    v.customize ['modifyvm', :id, '--vram', '16']
  end

  config.vm.define "challenge-vm" do |m|
    m.vm.network "private_network", ip: "172.17.177.51"
    m.vm.hostname = "challenge-vm"
    #nfs
    m.vm.synced_folder ".", "/vagrant", type: "nfs"
    m.vm.provision "shell", path: "dependencies.sh", run: "never"
  end

end