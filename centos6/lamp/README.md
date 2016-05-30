# build LAMP in Vagrant by Ansible.

compile httpd, MySQL, PHP Source to build httpd, MySQL, PHP module.



## Prerequisite
Installed bellow tools

* VirtualBox
* Vagrant
* Ansible


## Usage

#### 1. git clone this repository

```
$ git clone https://github.com/kenzo0107/Vagrant-Ansible
```

#### 2. VagrantVM Build

```
$ cd Vagrant-Ansible/centos6/lamp
$ vagrant up
```

#### 3. add ssh.config

```
$ vagrant ssh-config > ssh.config
```

#### 4. Install Python-SimpleJson on VagrantVM

```
$ ansible-playbook -i hosts python-simplejson.yml
```

#### 5. ping

```
$ ansible default -m ping

default | success >> {
"changed": false,
"ping": "pong"
}
```

#### 6. Build httpd, MySQL, PHP

```
$ ansible-playbook lamp.yml
```

#### 7. confirm Apache working.

access to <http://192.168.33.10>,

display `Working!`

#### 8. php -> MySQL connect confirm.

access to <http://192.168.33.10/dbtest.php>,

display `Connect Success: Localhost via UNIX socket`



OK !
