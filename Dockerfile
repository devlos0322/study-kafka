FROM ubuntu:20.04
RUN apt-get update 
# && apt-get upgrade
RUN apt-get install -y wget net-tools netcat tar 
RUN apt-get install -y openjdk-8-jdk git
RUN wget https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz

#명령어가 실행될 경로 생성
RUN mkdir -p /app
WORKDIR /app

RUN tar -xzf kafka_2.11-1.0.0.tgz  && rm -r kafka_2.11-1.0.0.tgz
RUN ln -s kafka_2.11-1.0.0 kafka
RUN export CLIPASS=clientpass
RUN mkdir ssl
RUN cd ssl
RUN scp -i ~/kafka-security.pem vagrant@192.168.1.200:/home/root/ssl/ca-cert .

ENV LANG=ko_KR.utf8 TZ=Asia/Seoul
# docker build . -t kafka-study
# docker run -it -memory=4g kafka-study 