Vagrant.configure("2") do |config|
    config.vm.define "Master" do |master|
        master.vm.box = "ubuntu/trusty64"
        master.vm.hostname = "master"

        master.vm.network "private_network", ip: "192.168.180.2"

        master.vm.provider "virtualbox" do |v|
            v.memory= 1024
            v.cpus =2
            
        end
    end

    config.vm.define "Slave" do |slave|
        slave.vm.box = "ubuntu/trusty64"
        slave.vm.hostname =  "slave"

        slave.vm.network "private_network", ip: "192.168.180.3"

        slave.vm.provider "virtualbox"  do |v|
            v.memory= 1024
            v.cpus = 2
        end
    end
end

        