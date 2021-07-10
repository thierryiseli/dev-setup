Vagrant.require_version ">= 1.7.0"
require 'cgi'
require 'io/console'
Vagrant.configure(2) do |config|
  class UserInput
    @username = ""
    @branch = ""
    @email = ""

    def getRepository
      print "Where is the git repository of your ansible setup (only path of lin github.com/xyz -> only xyz)?\n"
      STDIN.gets.chomp.to_s
    end

    def getBranch
      print "Which git branch (press enter if branch is master)?\n"
      @branch = STDIN.gets.chomp
      if @branch.to_s.empty?
        @branch = "master"
      end  
      @branch.to_s
    end

    def getUsername
      if @username.to_s.empty? == true
        print "What is your git username?\n"
        @username = STDIN.gets.chomp        
      end
      @username.to_s
    end

    def getEmail
      if @email.to_s.empty? == true
        print "What is your git email?\n"
        @email = STDIN.gets.chomp        
      end
      @email.to_s
    end

    def getPassword
      password = STDIN.getpass("Password?")
      URI.escape(password)
    end
  end

  userInput = UserInput.new
  
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

  if ARGV[0] == "up"
    print "Please enter name for the new VM: "
    PROJECT_NAME = STDIN.gets.chomp
  else
    PROJECT_NAME = "irrelevant"
  end  

  config.vm.provision :shell, env: {
      "REPOSITORY" => userInput.getRepository(),
      "BRANCH" => userInput.getBranch(),
      "GIT_USERNAME" => userInput.getUsername(),
      "GIT_PASSWORD" => userInput.getPassword(),
      "GIT_NAME" => userInput.getUsername(),
      "GIT_EMAIL" => userInput.getEmail()},
                      :privileged => false, :path => "startAnsible.sh"
end
