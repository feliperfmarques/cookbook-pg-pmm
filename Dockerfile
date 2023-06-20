# https://dev.to/mattdark/using-docker-as-provider-for-vagrant-10me
FROM --platform=linux/amd64 ubuntu:focal

ENV TZ=America/Sao_Paulo
ENV CHEF_WORKSTATION_VERSION=23.5.1040
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y

RUN apt-get install -y --no-install-recommends net-tools iputils-ping wget curl lsb-release ca-certificates gnupg ssh sudo
RUN wget --no-check-certificate https://packages.chef.io/files/stable/chef-workstation/$CHEF_WORKSTATION_VERSION/ubuntu/20.04/chef-workstation_$CHEF_WORKSTATION_VERSION-1_amd64.deb
RUN dpkg -i chef-workstation_*.deb
RUN echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile

RUN useradd --create-home -s /bin/bash vagrant
RUN echo -n 'vagrant:vagrant' | chpasswd
RUN echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant
RUN chmod 440 /etc/sudoers.d/vagrant
RUN mkdir -p /home/vagrant/.ssh
RUN chmod 700 /home/vagrant/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==" > /home/vagrant/.ssh/authorized_keys
RUN chmod 600 /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant/.ssh
RUN sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers
RUN sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd

RUN apt-get -y install openssh-client

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]