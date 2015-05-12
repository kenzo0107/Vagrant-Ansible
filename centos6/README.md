# Vagrant + Ansible + CentOS6

### Prerequisite
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

#### 5. Communications Confirmation

```
$ ansible default -m ping
```
