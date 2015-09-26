# Pull base image.
FROM centos:centos7

ENV PHANTOMJS_VERSION 1.9.8

# update & base packages
RUN \
  yum update -y && \
  yum -y install git gcc gcc-c++ make flex bison gperf ruby \
  openssl-devel freetype-devel fontconfig-devel libicu-devel sqlite-devel \
  libpng-devel libjpeg-devel bzip2 && \
  yum install -y curl wget && \
  yum install -y epel-release && \
  yum install -y nodejs npm --enablerepo=epel

# phantomjs
RUN \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /usr/local/phantomjs && \
  ln -s /usr/local/phantomjs/bin/phantomjs /usr/bin/phantomjs

RUN npm install -g grunt-cli gulp
