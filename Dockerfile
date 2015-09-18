# Pull base image.
FROM centos:centos7

# update & base packages
RUN \
  yum update -y && \
  yum groupinstall -y "Development Tools" && \
  yum install -y curl && \
  yum install -y epel-release && \
  yum install -y nodejs npm --enablerepo=epel

RUN npm install -g grunt-cli gulp
