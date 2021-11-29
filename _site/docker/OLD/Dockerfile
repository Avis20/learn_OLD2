FROM ubuntu:bionic

RUN apt-get update && apt-get install -y \
        libcatalyst-perl \
        libcatalyst-devel-perl \
        libmoose-perl \
        libcatalyst-plugin-static-simple-perl \
        libcatalyst-plugin-configloader-perl \
        libcatalyst-action-renderview-perl \
        -y -qq

workdir /MyApp
copy MyApp /MyApp

# user catalyst
expose 3000

cmd perl /MyApp/script/myapp_server.pl -rd -p 3000
