FROM docker.io/centos:7.4.1708

# 사용자 지정
USER root

# 언어셋 설치
RUN yum clean all \
 && yum repolist \
 && yum -y update \
 && sed -i "s/en_US/all/" /etc/yum.conf  \
 && yum -y reinstall glibc-common

 # 기본적으로 필요한 OS 패키지를 설치한다.
RUN  yum -y install tar unzip vi vim telnet net-tools curl openssl \
 && yum -y install apr apr-util apr-devel apr-util-devel \
 && yum -y install elinks locate python-setuptools \
 && yum clean all

 # 컨테이너 ssh 접속 허용
RUN yum install -y openssh-server openssh-clients openssh-askpass 

#명령어가 실행될 경로 생성
RUN mkdir -p /app
WORKDIR /app

RUN yum install -y krb5-server
RUN rm -r /var/kerberos/krb5kdc/kdc.conf
RUN rm -r /var/kerberos/krb5kdc/kadm5.acl
RUN rm -r /etc/krb5.conf
COPY conf/kdc.conf /var/kerberos/krb5kdc
COPY conf/kadm5.acl /var/kerberos/krb5kdc
COPY conf/krb5.conf /etc/
RUN export REALM="KAFKA.SECURE"
RUN export ADMINPW="this-is-unsecure"

# RUN /usr/sbin/kdb5_util create -s -r KAFKA.SECURE -P this-is-unsecure
# RUN kadmin.local -q "add_principal -pw this-is-unsecure admin/admin"

ENV LANG=ko_KR.utf8 TZ=Asia/Seoul
 
# 컨테이너 실행시 실행될 명령
CMD ["/bin/bash"]

EXPOSE 88 21 22 443

# docker build . -t kerberos-kdc
# docker run -it kerberos-kdc
## Failed to get D-Bus connection: Operation not permitted 를 해결하기 위한 옵션
# docker run --privileged -p 22:22 -p 88:88 -d kerberos-kdc /sbin/init
# docker exec -it 098b87f9e971 /bin/bash


## 접속설정
# vim /etc/ssh/sshd_config 에서 PermitRootLogin yes / StrictModes yes
# systemctl start sshd
# passwd root root