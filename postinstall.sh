#!/bin/bash

log=/vagrant/postinstall.log

echo "postinstall script started!" > $log


function info {
    echo $(date +%D\ %T) $1 >> $log
}

info "Adding needed packages..."
apt-get install -q -y vim | tee -a $log
apt-get install -q -y screen | tee -a $log
apt-get install -q -y git | tee -a $log
apt-get install -q -y python-pip | tee -a $log

# Jenkins Installation
info "Adding Jenkins key to system..."
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - | tee -a $log

info "Adding Jenkins source to /etc/apt/sources.list..."
if grep "jenkins" /etc/apt/sources.list
then
    info "Jenkins source already in source.list"
else
    echo "deb http://pkg.jenkins-ci.org/debian binary/" >> /etc/apt/sources.list
fi

info "Updating apt source..."
apt-get update | tee -a $log

info "Installing Jenkins..."
apt-get install -q -y jenkins | tee -a $log
