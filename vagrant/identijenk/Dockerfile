from jenkins/jenkins:lts

user root

run echo "deb http://apt.dockerproject.org/repo ubuntu-xenial main" \
         > /etc/apt/sources.list.d/docker.list \
        && apt-get update \
        && apt-cache policy docker-engine \
        && apt-get install -y apt-transport-https \
        && apt-get install -y sudo \
        && apt-get install -y --allow-unauthenticated docker-engine \
        && rm -rf /var/lib/apt/lists/*
run echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

run curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` \
            -o /usr/local/bin/docker-compose; \
            chmod +x /usr/local/bin/docker-compose

user jenkins
