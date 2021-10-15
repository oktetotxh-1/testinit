FROM ubuntu:21.04
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install systemd ssh wget npm sudo vim sudo nano chromium-browser -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN wstunnel -s 0.0.0.0:80 &
RUN /usr/sbin/sshd -D
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:tixiaohan|chpasswd
RUN cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i   == systemd-tmpfiles-setup.service ] || rm -f $i; done) \
rm -f /lib/systemd/system/multi-user.target.wants/* \
rm -f /etc/systemd/system/*.wants/* \
rm -f /lib/systemd/system/local-fs.target.wants/* \
rm -f /lib/systemd/system/sockets.target.wants/*udev* \ 
rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
rm -f /lib/systemd/system/basic.target.wants/* \
rm -f /lib/systemd/system/anaconda.target.wants/* \
VOLUME [ “/sys/fs/cgroup” ]
EXPOSE 80
CMD [“/usr/sbin/init -z”]
