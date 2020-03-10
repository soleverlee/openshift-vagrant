yum -y install wget
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS7-Base-163.repo https://mirrors.163.com/.help/CentOS7-Base-163.repo
yum clean all
yum makecache
