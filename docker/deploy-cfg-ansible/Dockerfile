FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
    openssh-server

RUN service ssh restart

CMD tail -f /dev/null
