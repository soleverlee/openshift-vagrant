This project is about to create a openshift cluster using vagrant and virtualbox. It's almost the copy of [openshift-vagrant](https://github.com/eliu/openshift-vagrant), so you can refer to this also.

# Getting started

Here are the steps to install:

* clone this object
* use `vagrant up` to create the virtual machines
* use `vagrant provision --provision-with master-key,node01-key,node02-key` to copy keys
* use `vagrant ssh master` to connect to master and then start install openshift

After ssh into master, do the following:

* install ansible: `yum -y install https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.9.6-1.el7.ans.noarch.rpm
`
* download openshift-ansible: `wget https://github.com/openshift/openshift-ansible/archive/openshift-ansible-3.11.187-1.zip`
* If you are in China, it's recommended to update the mirror by using `sed -i 's/mirror.centos.org/mirrors.163.com/g' openshift-ansible/roles/openshift_repos/templates/CentOS-OpenShift-Origin311.repo.j2`
* Create `/etc/ansible/hosts` using the `inventory.txt` file
* Execute `ansible-playbook /home/vagrant/openshift-ansible/playbooks/prerequisites.yml && ansible-playbook /home/vagrant/openshift-ansible/playbooks/deploy_cluster.yml` to install.