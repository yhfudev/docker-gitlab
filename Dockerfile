#ARG MYARCH
FROM yhfudev/docker-lamp
MAINTAINER yhfu <yhfudev@gmail.com>

# upldate package list
RUN pacman -Syy

# remove info.php
RUN sudo rm -f /srv/http/info.php

USER docker
# install gitlab
RUN yaourt -S --noconfirm --needed gitlab

# copy over apache configuration file(s)
RUN sudo cp /etc/webapps/gitlab/apache.conf.example /etc/httpd/conf/extra/gitlab.conf

# enable gitlab config file in apache config
RUN sudo sed -i '$a Include conf/extra/gitlab.conf' /etc/httpd/conf/httpd.conf

USER root

# expose the relevant ports
EXPOSE 80
EXPOSE 443
EXPOSE 22

# set some default variables for the startup script
ENV REGENERATE_SSL_CERT false
ENV START_APACHE true
ENV START_MYSQL false

# start servers
CMD ["sudo","-E","/root/startServers.sh"]
