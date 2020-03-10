yum -y install docker-1.13.1

# http://softpanorama.org/VM/Docker/Installation/rhel7_docker_package_dockerroot_problem.shtml

usermod -aG dockerroot vagrant

cat > /etc/docker/daemon.json <<EOF
{
    "group": "dockerroot"
}
EOF

systemctl enable docker
systemctl start docker
