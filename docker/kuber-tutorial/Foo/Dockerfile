FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
        libcatalyst-perl \
        libcatalyst-devel-perl \
        libmoose-perl \
        libcatalyst-plugin-static-simple-perl \
        libcatalyst-plugin-configloader-perl \
        libcatalyst-action-renderview-perl \
        -y -qq

COPY . /home/project/Foo

EXPOSE 3001
CMD ["/home/project/Foo/script/server.pl", "-rd", "-p", "3001"]
