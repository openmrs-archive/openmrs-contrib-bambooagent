openmrs-contrib-bambooagent
===========================
Installation of Bamboo Agents.

## Development environment

### Setting up
  - [Virtualbox](https://www.virtualbox.org/)
  - [Vagrant](https://www.vagrantup.com/)
  - git
  - ruby
  - [librarian-puppet and puppet ruby gems](http://librarian-puppet.com/)
  - [Geppeto IDE](https://puppetlabs.github.io/geppetto/index.html) is recommended, but not necessary. 

## Running locally

Download the correct versions of third party modules into 'modules' folder:
```$ librarian-puppet install```
 
To run an Ubuntu 14.04 VM:
```$ vagrant up ```

Other vagrant commands can be found in [Confluence](https://wiki.openmrs.org/x/CIC3Ag)


## Production/Staging environments

### Requirements
  - Ubuntu 14.04
  - Puppet 3.x/Hiera/facter
  - Git, make, ruby-dev
  - librarian-puppet (`gem install librarian-puppet  --no-ri --no-rdoc`)

This tree doesn't work with puppet 4. 


### Setting up new machine
#### Configuring git SSH
```
mkdir -p /root/.ssh
```

From your machine:
```
# copy files from this repository using, for example, scp
scp files/bamboo-github-key/id_rsa $SERVER:/root/.ssh/
scp files/ssh/config $SERVER:/root/.ssh/
```

#### Clone this repository into puppet folder
```
$ cd /etc
$ mv puppet puppet_old
$ git clone git@github.com:openmrs/openmrs-contrib-bambooagent.git puppet
$ puppet apply 
```

### Updating Agent
```
$ cd /etc/puppet/
$ git pull
$ librarian-puppet update # if there's a change to 3rd party modules
$ puppet apply
```
