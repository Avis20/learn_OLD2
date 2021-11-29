FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
        libcatalyst-perl \
        libcatalyst-devel-perl \
        libmoose-perl \
        libcatalyst-plugin-static-simple-perl \
        libcatalyst-plugin-configloader-perl \
        libcatalyst-action-renderview-perl \
        -y -qq

COPY MyApp /home/project/MyApp
WORKDIR /home/project/MyApp

CMD ./script/myapp_server.pl -rd -p 3000
