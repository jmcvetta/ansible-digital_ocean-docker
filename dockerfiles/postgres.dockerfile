#-------------------------------------------------------------------------------
#
# Dockerfile for a PostgreSQL database server
# 
#-------------------------------------------------------------------------------
FROM ubuntu
MAINTAINER Jason McVetta jason.mcvetta@gmail.com

#
# SSH authorization
#
RUN mkdir /root/.ssh && chmod 700 /root/.ssh
ADD id_dsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys && chown root. /root/.ssh/authorized_keys

#
# APT Packages
#
RUN apt-get update
RUN apt-get install -y postgresql
#RUN apt-get install -y openssh-server

# RUN mkdir /var/run/sshd


EXPOSE 22 8000 8080

ENTRYPOINT ["/usr/sbin/sshd", "-D"]

