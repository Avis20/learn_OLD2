#!/usr/bin/env bash

# Install docker and docker compose
sudo -i
apt-get update && apt-get install htop bash-completion
curl https://get.docker.com > /tmp/install.sh
chmod +x /tmp/install.sh && /tmp/install.sh
usermod -aG docker vagrant
service docker restart
curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


echo "alias docker-clean='docker rm -v \$(docker ps -aq -f status=exited)'" >> /home/vagrant/.bashrc;
echo "alias docker-killall='docker kill \$(docker ps -aq); docker-clean'" >> /home/vagrant/.bashrc;
