Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs_precise64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"

  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--name", "drupal-puppet-base"]
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    virtualbox.customize ["modifyvm", :id, "--memory", "1024"]
    virtualbox.customize ["modifyvm", :id, "--cpus", "4"]
    virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # Network settings
  config.dns.tld = "dev"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.hostname = "alpha.dev"
  config.dns.patterns = [/^.*.alpha.dev$/]
  config.vm.synced_folder "./", "/srv", id: "vagrant-root", :nfs => true
  config.vagrant.host = :detect

  # Puppet
  config.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = 'site.pp'
    puppet.options = ["--verbose"]
  end

end
