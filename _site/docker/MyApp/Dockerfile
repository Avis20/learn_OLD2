FROM ubuntu:xenial

RUN apt-get update && apt-get -y install --no-install-recommends \
    libanyevent-perl \
    libarchive-zip-perl \
    libcatalyst-action-renderview-perl \
    libcatalyst-model-dbic-schema-perl \
    libcatalyst-perl \
    libcatalyst-plugin-configloader-perl \
    libcatalyst-plugin-static-simple-perl \
    libcatalyst-view-json-perl \
    libcatalyst-view-tt-perl \
    libdata-compare-perl \
    libdatetime-format-pg-perl \
    libdatetime-perl \
    libdbd-pg-perl \
    libdigest-crc-perl \
    libhtml-formhandler-model-dbic-perl \
    libhtml-formhandler-perl \
    libhttp-async-perl \
    libjson-xs-perl \
    liblib-abs-perl \
    libredis-perl \
    libsphinx-search-perl \
    libspreadsheet-writeexcel-perl \
    libstring-similarity-perl \
    libwww-curl-perl \
    libyaml-libyaml-perl \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install --no-install-recommends \
    curl vim ssh lsof autossh redis-tools rpm \
    && rm -rf /var/lib/apt/lists/*

# FIXME
COPY pkg/libuni-perl-perl_0.92-1_all.deb /tmp/libuni-perl-perl_0.92-1_all.deb
RUN dpkg -i /tmp/libuni-perl-perl_0.92-1_all.deb && rm -f /tmp/libuni-perl-perl_0.92-1_all.deb

# FIXME
COPY pkg/MooseX /usr/share/perl5/MooseX/

COPY start.sh /
CMD ["/start.sh"]
