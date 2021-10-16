FROM tixiaohan/systemd:new
MAINTAINER “TTMN tixiaohan” <tixiaohan@gmail.com>
RUN yum update -y
RUN DEBIAN_FRONTEND=noninteractive yum install openssh-server wget npm sudo vim sudo nano -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN wstunnel -s 0.0.0.0:80 &
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:tixiaohan|chpasswd
EXPOSE 80
CMD [“/usr/sbin/init”]
