# -*- mode: ruby -*-
#
# config for Vagrant 0.9.1

Vagrant::Config.run do |config|

    config.vm.define :jenkins do |jenkins|
        jenkins.vm.box = "myubuntubox"

        jenkins.vm.network :bridged

        # jenkins port
        jenkins.vm.forward_port 80, 8080

        # postinstall script
        jenkins.vm.provision :shell, :path => "postinstall.sh"

    end

end

# vim: set ft=ruby :
