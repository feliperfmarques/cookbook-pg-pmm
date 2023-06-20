ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
VAGRANTFILE_API_VERSION=2
NUM_STANDBY_NODES=2
NETWORK_BASE="192.168.0."
IP_START=2
PORT_START=50022

HOSTS = {
  "pg-primary" => {
    "ip" => "#{NETWORK_BASE}" + "#{IP_START}",
    "ssh_port" => PORT_START
  }
}

(1..NUM_STANDBY_NODES).each do |i|
  HOSTS = HOSTS.merge({
    "pg-standby-0#{i}" => {
      "ip" => "#{NETWORK_BASE}" + "#{IP_START + i}",
      "ssh_port" => PORT_START + i
    }
  })
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "docker" do |d|
    d.build_dir = "."
    d.remains_running = true
    d.has_ssh = true
  end

  HOSTS.each do |hostname,host_config|
    config.vm.provision "chef_solo" do |chef|
      chef.install = false
      chef.arguments = "--chef-license accept"
      chef.cookbooks_path = ["cookbooks"]
      chef.add_recipe("pg-pmm::server")
      chef.add_recipe("pg-pmm::client")
      chef.add_recipe("pg-pmm::service")
      # if hostname.include? "master"
      #   chef.add_recipe("pg-pmm::setup_primary")
      # end
      # if hostname.include? "standby"
      #   chef.add_recipe("pg-pmm::setup_standby")
      # end
    end
    config.vm.define hostname do |node|
      node.vm.network "private_network", ip: host_config["ip"]
      node.vm.hostname = hostname
    end
  end
end
