FROM ubuntu:latest

#ARG proxy=''
#ENV http_proxy=$proxy
#ENV https_proxy=$http_proxy
ENV USER=root

#ENV no_proxy=''
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update ; apt-get install ; apt-get install unzip build-essential ruby-dev git curl build-essential libxml2-dev libxslt-dev libssl-dev autoconf -y 

COPY chef /opt/chef
ENV PATH=$PATH:/opt/chef/embedded/bin

RUN mkdir /inspec-gen
COPY build-scripts/*.* /inspec-gen/
RUN gem install berkshelf
ENV BERKSPATH=/inspec-gen/
CMD /bin/bash

#versioning tags
ARG version_arg=1.2

#label the image
LABEL version=$version_arg
