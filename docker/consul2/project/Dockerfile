
FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y -qq install --no-install-recommends \
    expect-dev \
    libcatalyst-perl \
    libcatalyst-devel-perl \
    libmoose-perl \
    libcatalyst-plugin-static-simple-perl \
    libcatalyst-plugin-configloader-perl \
    libcatalyst-action-renderview-perl \
    vim \
    make \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /Avis20
COPY Avis20 /Avis20
COPY start_project.sh /start_project.sh

CMD ["/start_project.sh"]


