FROM ubuntu:20.04

RUN apt-get update\
 && apt-get install -y openjdk-8-jdk

RUN apt-get install -y wget net-tools netcat tar vim
RUN apt-get install -y openssh-client
RUN mkdir -p /app
WORKDIR /app

RUN wget https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz\
 && tar -xzf kafka_2.11-1.0.0.tgz\
 && ln -s kafka_2.11-1.0.0 kafka

RUN rm -r kafka_2.11-1.0.0.tgz
COPY ./config/client.properties /app/kafka/config/client.properties

# SSL 관련 설정
ENV CLIPASS=clientpass
RUN mkdir ssl && cd ssls
RUN apt-get install -y sshpass
WORKDIR /app/ssl
ENTRYPOINT [ "executable" ] sshpass -proot scp -o StrictHostKeyChecking=no root@kafka-server-ssl:/app/ssl/ca-cert .; keytool -keystore kafka.client.truststore.jks -alias CARoot -import -file ca-cert -storepass $CLIPASS -keypass $CLIPASS -noprompt; cd /app ;/bin/bash
EXPOSE 22