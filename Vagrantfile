# -*- mode: ruby -*-

Vagrant::Config.run do |config|

    config.vm.define :jenkins do |jenkins|
        jenkins.vm.box = "myubuntubox"
        jenkins.vm.network "192.168.50.10"

        # jenkins port
        jenkins.vm.forward_port("jenkins", 8080, 8080)

        # postinstall script
        jenkins.vm.provision :shell, :path => "postinstall.sh"

    end

end

# vim: set ft=ruby :
