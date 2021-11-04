Vagrant.require_version ">= 1.7.0"
require 'cgi'
require 'io/console'
Vagrant.configure(2) do |config|
  config.vm.box = "thierryiseli/ubuntu-20.04-desktop"
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.synced_folder '.', '/vagrant', disabled: true

  if File.exist?(Dir.pwd + "//.vagrant")
    FileUtils.rm_rf(Dir.pwd + "//.vagrant")
  end

  config.vm.provider "hyperv" do |h|
    h.vmname = PROJECT_NAME
    h.enable_enhanced_session_mode = true
  end
end
