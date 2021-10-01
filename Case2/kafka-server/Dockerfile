FROM ubuntu:20.04

# 카프카 서버 기본 설정
RUN apt-get update \
 && apt-get install -y openjdk-8-jdk
RUN apt-get install systemd -y
RUN apt-get install -y wget net-tools netcat tar vim
RUN apt-get install -y openssh-client
RUN apt-get install -y openssh-server
RUN mkdir -p /app
WORKDIR /app

RUN wget https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz\
 && tar -xzf kafka_2.11-1.0.0.tgz\
 && ln -s kafka_2.11-1.0.0 kafka

RUN rm -r kafka_2.11-1.0.0.tgz
COPY ./config/server.properties /app/kafka/config/server.properties

WORKDIR /app/ssl
# 인증서 생성
ENV SRVPASS=serversecret
RUN openssl req -new -newkey rsa:4096 -days 365 -x509 -subj "/CN=Kafka-Security-CA" -keyout ca-key -out ca-cert -nodes
RUN keytool -genkey -keystore kafka.server.keystore.jks -validity 365 -storepass $SRVPASS -keypass $SRVPASS -dname "CN=192.168.33.56" -storetype pkcs12
# RUN keytool -list -v -keystore kafka.server.keystore.jks
# 인증서 서명 요청
RUN keytool -keystore kafka.server.keystore.jks -certreq -file cert-file -storepass $SRVPASS -keypass $SRVPASS
RUN openssl x509 -req -CA ca-cert -CAkey ca-key -in cert-file -out cert-signed -days 365 -CAcreateserial -passin pass:$SRVPASS
# Keystore에 CA 인증서 정보와 서명된 서버 인증서 정보 추가
RUN keytool -keystore kafka.server.keystore.jks -alias CARoot -import -file ca-cert -storepass $SRVPASS -keypass $SRVPASS -noprompt
# truststore 생성
RUN keytool -keystore kafka.server.keystore.jks -import -file cert-signed -storepass $SRVPASS -keypass $SRVPASS -noprompt
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 9092 22
CMD ["/app/kafka/bin/kafka-server-start.sh", "/app/kafka/config/server.properties"]
# docker exec -it e1a3d22a0f83 /bin/bash

# docker-compose up --build -d