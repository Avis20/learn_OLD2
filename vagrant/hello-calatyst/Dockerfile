# from perl:5.30
from debian:stretch-slim

# run groupadd -r catalyst && useradd -r -g catalyst catalyst

run apt-get update && apt-get install -y \
        libcatalyst-perl \
        libcatalyst-devel-perl \
        libmoose-perl \
        libcatalyst-plugin-static-simple-perl \
        libcatalyst-plugin-configloader-perl \
        libcatalyst-action-renderview-perl

workdir /MyApp
copy MyApp /MyApp

# env PERL5LIB=/usr/share/perl5:/usr/lib/x86_64-linux-gnu/perl5/5.30/

# user catalyst
expose 3000

cmd perl /MyApp/script/myapp_server.pl -rd -p 3000
# cmd ["perl", "/MyApp/script/myapp_server.pl"]