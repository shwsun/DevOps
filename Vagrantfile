Vagrant.configure("2") do |config|
    config.vbguest.auto_update = false 
    #sudo apt-get install virtualbox-guest-utils

    # vagrant plugin uninstall vagrant-vbguest
    # vagrant plugin install --local vagrant-vbguest --plugin-version 0.21

    # nexus
    config.vm.define "nexus" do |machine|
        config.vbguest.auto_update = false
        machine.vm.box = "centos/7"
        machine.vm.hostname = "nexus"
        #machine.vm.synced_folder "./pv/nexus", "/home/vagrant/nexus", owner: "vagrant", group: "vagrant"
        machine.vm.provider "virtualbox" do |vb|
            vb.name = "nexus"
            vb.customize ["modifyvm", :id, "--audio", "none"]
            vb.memory = 3000
            vb.cpus = 3
        end
        machine.vm.network "private_network", ip: "192.168.56.21"
        machine.vm.provision "file", source: "./pv/nexus/nexus-3.29.2-02-unix.tar.gz",  destination: "~/" , run: "once"
        # provisioning
        machine.vm.provision "shell", path: "./shells/boot_nexus.sh", run: "once"
        machine.vm.provision "shell", path: "./shells/start_nexus.sh", run: "always"
    end


    # d1 ~ d3 까지 VM 구성해서 Node1 ~ Node3 사용 예정.  
    # k8s 
    config.vm.define "k8s" do |machine|
        machine.vm.box = "centos/7"
        machine.vm.hostname = "k8s"
        machine.vm.provider "virtualbox" do |vb|
            vb.name = "k8s"
            vb.customize ["modifyvm", :id, "--audio", "none"]
            vb.memory = 2000
            vb.cpus = 2
        end
        machine.vm.network "private_network", ip: "192.168.56.10"
        machine.vm.network "forwarded_port", guest: 8080, host: 8080
        machine.vm.provision "file", source: "./shells/yml/",  destination: "~/" , run: "once"
        # provisioning
        machine.vm.provision "shell", path: "./shells/boot_docker.sh", run: "once"
        machine.vm.provision "shell", path: "./shells/boot_k8s.sh", run: "once"
        machine.vm.provision "shell", path: "./shells/boot_master.sh", run: "once"
        machine.vm.provision "shell", path: "./shells/install_flannel.sh", run: "once"
        machine.vm.provision "shell", path: "./shells/install_dashboard.sh", run: "once"
    end

    # k8s - n01
    config.vm.define "n01" do |machine|
        machine.vm.box = "centos/7"
        machine.vm.hostname = "n01"
        machine.vm.provider "virtualbox" do |vb|
            vb.name = "n01"
            vb.memory = 1000
            vb.cpus = 1
        end
        machine.vm.network "private_network", ip: "192.168.56.11"
        # provisioning
        machine.vm.provision "shell", path: "./shells/boot_docker.sh", run: "once"
        machine.vm.provision "shell", path: "./shells/boot_k8s.sh", run: "once"
        # token 때문에 master run 이후에 수동 실행. 
        #machine.vm.provision "shell", path: "./shells/boot_node.sh", run: "always"
    end


    # Docker VM
    config.vm.define "docker" do |machine|
        config.vbguest.auto_update = false 
        machine.vm.box = "centos/7"
        machine.vm.hostname = "docker"
        machine.vm.provider "virtualbox" do |vb|
            vb.name = "docker"
            vb.customize ["modifyvm", :id, "--audio", "none"]
            vb.memory = 4000
            vb.cpus = 4
        end
        machine.vm.network "private_network", ip: "192.168.56.10"
        machine.vm.provision "shell", path: "./shells/boot_docker.sh", run: "once"
    end

    # # Jupyter Python Notebook 
    # config.vm.define "jup" do |machine|
    #     machine.vm.box = "centos/7"
    #     machine.vm.hostname = "jupyter"
    #     machine.vm.synced_folder "./notebook", "/home/vagrant/notebook", owner: "vagrant", group: "vagrant"
    #     machine.vm.provider "virtualbox" do |vb|
    #         vb.name = "jupyter"
    #         vb.memory = 6000
    #         vb.cpus = 4
    #     end
    #     machine.vm.network "private_network", ip: "192.168.56.10"
    #     #machine.vm.provision "file", source: "./data/",  destination: "~/" , run: "once"
    #     machine.vm.provision "file", source: "./notebook/",  destination: "~/" , run: "once"
    #     # provisioning
    #     machine.vm.provision "shell", path: "./boot/boot_notebook.sh", run: "once"
    #     machine.vm.provision "shell", path: "./boot/start_notebook.sh", run: "always"
    # end

end
