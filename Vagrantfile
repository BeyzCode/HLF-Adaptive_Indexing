Vagrant.configure("2") do |config|
config.vm.define "multi-chain" do |mc| #20.04 LTS
    mc.vm.box = "ubuntu/focal64"
    mc.vm.provider "virtualbox" do |vb|
      vb.memory = "3072"
      vb.cpus = 1
      vb.gui = false
    end
    mc.vm.network "private_network", type: "dhcp"
    mc.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  end
end
  