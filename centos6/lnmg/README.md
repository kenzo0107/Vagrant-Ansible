# build LNMG ( Linux | Nginx | MySQL | Go ) in Vagrant by Ansible.

compile Nginx, MySQL, Go Source to build Nginx, MySQL, Go module.



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
$ cd Vagrant-Ansible/centos6/lnmg
$ vagrant up
```

#### 3. add ssh.config

```
$ vagrant ssh-config > ssh.config
```

#### 4. ping

```
$ ansible node_go_web -m ping

node_go_web | success >> {
    "changed": false,
    "ping": "pong"
}
```

#### 5. Build nginx, MySQL, Go

```
$ ansible-playbook lnmg.yml
```

#### 6. ssh login vm. go version confirm.

```
$ vagrant ssh
[vagrant ~] go version
go version go1.4.2 darwin/amd64
```


to be continued.

connect MySQL etc...