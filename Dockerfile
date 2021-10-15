FROM ubuntu:21.04
MAINTAINER “TTMN tixiaohan” <tixiaohan@gmail.com>
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install systemd ssh wget init npm sudo vim sudo nano chromium-browser -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN wstunnel -s 0.0.0.0:80 &
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:tixiaohan|chpasswd
RUN rm -f /lib/systemd/system/multi-user.target.wants/*
RUN rm -f /etc/systemd/system/*.wants/*
RUN rm -f /lib/systemd/system/local-fs.target.wants/*
RUN rm -f /lib/systemd/system/sockets.target.wants/*udev* 
RUN rm -f /lib/systemd/system/sockets.target.wants/*initctl*
RUN rm -f /lib/systemd/system/basic.target.wants/*
RUN rm -f /lib/systemd/system/anaconda.target.wants/*
VOLUME [ “/sys/fs/cgroup” ]
EXPOSE 80
CMD [“/usr/sbin/init -z”]
