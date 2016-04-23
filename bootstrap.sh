#!/usr/bin/env bash

#=========================================================================
# set up new server
#=========================================================================



function isinstalled {
  #usage:if isinstalled $package; then echo "installed"; else echo "not installed"; f
    
if yum list installed "$@" >/dev/null 2>&1; then
    true
  else
    false
  fi
}

function install {
    #thin wrapper around yum install - if package already exists, 
    #does nothing, else installs the package
    package=$1
    if isinstalled $package; 
    then 
        echo "$package already installed: doing nothing"; 
    else 
        echo "$package is not installed"
        echo "installing $package"

        yum install $package
        echo "$package now installed"
        
    fi
}


playbook_filename="playbooks/django_playbook.yml"

ansible-playbook -i "localhost," -c local $playbook_filename
