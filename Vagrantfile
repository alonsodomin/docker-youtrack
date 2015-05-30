# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puphpet/centos65-x64"

  # fix "stdin: is not a tty" error
  #config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.network "private_network", ip: "192.168.100.10"

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision :docker do |d|
    d.build_image "/vagrant", args: "-t alonsodomin/youtrack"
    d.run "youtrack",
          image: "alonsodomin/youtrack",
          args: "-p 8080:8080 -v /var/lib/youtrack:/var/lib/youtrack"
  end
  
end
