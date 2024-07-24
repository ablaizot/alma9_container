# syntax=docker/dockerfile:1

FROM almalinux:latest
RUN /bin/sh -c echo "[butools]"                                              >  /etc/yum.repos.d/butool.repo
RUN /bin/sh -c echo "name=BUTool software repo"                              >> /etc/yum.repos.d/butool.repo # buildkit
RUN /bin/sh -c echo "baseurl=http://ohm.bu.edu/repo/AlmaLinux/8/\$basearch/" >> /etc/yum.repos.d/butool.repo # buildkit
RUN /bin/sh -c echo "enabled=1"                                              >> /etc/yum.repos.d/butool.repo # buildkit
RUN /bin/sh -c echo "gpgcheck=0"                                             >> /etc/yum.repos.d/butool.repo # buildkit
COPY ./yum.repos.d /etc
RUN /bin/sh -c dnf install -y epel-release # buildkit
RUN /bin/sh -c dnf install -y yum-utils # buildkit
RUN /bin/sh -c dnf config-manager --set-enabled powertools # buildkit
RUN /bin/sh -c dnf config-manager --set-enabled devel 
RUN /bin/sh -c dnf update -y
RUN /bin/sh -c dnf install -y redhat-lsb-core
RUN /bin/sh -c dnf -y update && dnf -y install make gcc-c++ rpm-build git wget unzip boost boost-filesystem boost-program-options boost-regex boost-devel readline-devel zlib-devel systemd-devel python3-devel # buildkit
