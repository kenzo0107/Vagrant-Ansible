Vagrant+Ansible

### Prerequisite
Installed bellow tools

* VirtualBox
* Vagrant 

## Procedure


#### Install Ansible
```
$ sudo pip install ansible
$ ansible --version
```

#### Add vagrant box 

```
$ mkdir -p ~/Vagrant/centos65-vagrant
$ cd ~/Vagrant/centos65-vagrant
$ vagrant box add centos6.5 https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box
$ vagrant init centos6.5
```

#### modify Vagrantfile. Set private_network.

```
$ vim Vagrantfile
```

```
   # Create a private network, which allows host-only access to the machine
   # using a specific IP.
   config.vm.network "private_network", ip: "192.168.33.10"
```

#### create eventry file

```
vagrant ssh-config
```

```
Host default
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /Users/kenzo/Vagrant/centos65/.vagrant/machines/default/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

* add hosts with HostName & Port.

```
echo "127.0.0.1:2222" > hosts
```

#### ping-pong : Communications Confirmation

```
ansible <HostName>:<Port> -m <module> -i <eventry file> -u <loguin username> --private-key=<IdentityFile>
```

* exsample

```
ansible 127.0.0.1:2222 -m ping -i hosts -u vagrant --private-key=/Users/kenzo/Vagrant/centos65/.vagrant/machines/default/virtualbox/private_key

127.0.0.1 | success >> {
    "changed": false, 
    "ping": "pong"
}
```

#### re-set eventry file. create ssh.config
```
vagrant ssh-config > ssh.config
```

```
echo "default" > hosts
```

#### set ANSIBLE_SSH_ARGS (:Environment Value)

```
ANSIBLE_SSH_ARGS=' -F ssh.config' ansible default -m ping -i hosts

default | success >> {
    "changed": false, 
    "ping": "pong"
}
```

### create Ansible ConfigureFile.

```
cat << EOS > ansible.cfg
[defaults]
hostfile = hosts

[ssh_connection]
ssh_args = -F ssh.config

EOS
```

#### ping-pong : Communications Confirmation

```
ansible default -m ping

default | success >> {
    "changed": false, 
    "ping": "pong"
}
```

set ansible by short command !
