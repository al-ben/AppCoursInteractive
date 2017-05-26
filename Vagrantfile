VAGRANT_FILE_API_VERSION = '0.1.0'

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network :forwarded_port, guest: 8000, host: 8000, host_ip: "127.0.0.1"
  config.vm.hostname = "moulinette"

  config.vm.provision 'shell', path: 'scripts/install.sh'
end