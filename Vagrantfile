VAGRANTFILE_API_VERSION = "2"

SCRIPT = <<EOF
apt-get --quiet=2 --yes install zsh
ln -sf /vagrant /home/vagrant/home
EOF

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision "shell", privileged: true, inline: SCRIPT
end
