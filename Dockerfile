# Docker file for generating app gateway container
#   

FROM centos
MAINTAINER muranant

# First get python
# Install yum dependencies
RUN yum -y update && \
    yum install -y \
    hostname \
    httpd \
    cronie 

# Specific files
RUN mkdir -p /opt/icpep/uploads /opt/lib /opt/bin
COPY small-mysql.zip  /opt/lib/mysql.zip
COPY icfpp-upgrade-2.3.1.tar.gz  /opt/icpep/uploads/
COPY install_infra.sh  /opt/icpep/
RUN chmod 755 /opt/icpep/install_infra.sh
CMD ["/bin/bash", "/opt/icpep/install_infra.sh install /opt/icpep/uploads/icfpp-upgrade-2.3.1.tar.gz"]
