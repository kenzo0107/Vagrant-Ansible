# build httpd on CentOS in Vagrant by Ansible.

compile httpd Source to build httpd module.



## Prerequisite
Installed bellow tools

* VirtualBox
* Vagrant


## Usage

#### 1. Add Vagrant Box

```
$ vagrant box add centos6.5 https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box
```

#### 2. git clone this repository

```
$ git clone https://github.com/kenzo0107/Vagrant-Ansible
```

#### 3. VagrantVM Build

```
$ cd Vagrant-Ansible/centos6
$ vagrant up
```

#### 4. add ssh.config

```
$ vagrant ssh-config > ssh.config
```

#### 5. ping

```
$ ansible default -m ping
```

#### 6. Build httpd

```
$ ansible-playbook lamp.yml
```

#### 7. Apache

access to <http://192.168.33.10>,

/var/www/html/index.html

display "Working!"

#### 8. php -> MySQL connect confirm.

access to <http://192.168.33.10/dbtest.php>,

display "Connect Success: Localhost via UNIX socket"



OK !