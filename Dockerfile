FROM tixiaohan/systemd:new
MAINTAINER “TTMN tixiaohan” <tixiaohan@gmail.com>
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm sudo vim sudo nano chromium-browser -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN wstunnel -s 0.0.0.0:80 &
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:tixiaohan|chpasswd
EXPOSE 80
CMD [“/usr/sbin/init”]
