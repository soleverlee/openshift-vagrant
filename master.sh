VAGRANT_HOME="/home/vagrant"

mkdir -p $VAGRANT_HOME/.ssh
bash -c "echo 'Host *' >> $VAGRANT_HOME/.ssh/config"
bash -c "echo 'StrictHostKeyChecking no' >> $VAGRANT_HOME/.ssh/config"
chmod 600 $VAGRANT_HOME/.ssh/config


yum -y install wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct

yum -y install unzip
