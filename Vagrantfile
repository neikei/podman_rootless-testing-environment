# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Check minimum Vagrant version
Vagrant.require_version ">= 2.0.1"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "rockylinux/9"

  config.vm.provider "parallels"
  config.vm.provider "virtualbox"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize ['modifyvm', :id, '--memory', 2048]
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ["modifyvm", :id, "--name", "podman_rootless-testing-environment"]
  end

  config.vm.provider "parallels" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  # Run the provisioning
  ## Install Podman and configure vagrant for rootless usage
  config.vm.provision "shell", path: "install_podman_rootless.sh"

  ## Install and configure software
  #config.vm.provision "ansible_local" do |ansible|
  #  ansible.playbook = "ansible/playbook.yml"
  #  ansible.become = true
  #  ansible.verbose = ""
  #  ansible.galaxy_role_file = "ansible/requirements.yml"
  #end

  # Post-up message
  config.vm.post_up_message = "See https://github.com/neikei/podman_rootless-testing-environment for help and bug reports."

end
