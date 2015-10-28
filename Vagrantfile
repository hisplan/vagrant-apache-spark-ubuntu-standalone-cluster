
Vagrant.configure(2) do |config|
	numNodes = 3
	r = numNodes..1
	(r.first).downto(r.last).each do |i|
		config.vm.define "node-#{i}" do |node|
			node.vm.box = "hashicorp/precise64"
			node.vm.provider "virtualbox" do |v|
				v.name = "spark-node#{i}"
				v.customize ["modifyvm", :id, "--memory", "2048"]
				v.customize ["modifyvm", :id, "--usb", "off"]
				v.customize ["modifyvm", :id, "--usbehci", "off"]
			end
			node.vm.network "private_network", ip: "192.168.200.20#{i}"
			node.vm.hostname = "spark-node#{i}"
			node.vm.provision "shell" do |s|
				s.path = "./scripts/bootstrap.sh"
				s.args = "#{i} #{numNodes}"
			end
		end
	end
end