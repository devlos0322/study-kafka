FROM openjdk:8-alpine

RUN apk update \
 && apk upgrade

# Timezone 보정
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN echo "Asia/Seoul" > /etc/timezone

ENV LANG=ko_KR.UTF-8

RUN apk add openssh-client\    
 && apk add sshpass
RUN apk add coreutils
RUN apk add --update bash && rm -rf /var/cache/apk/*

#명령어가 실행될 경로 생성
RUN mkdir -p /app
WORKDIR /app

RUN wget https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz
RUN tar -xzf kafka_2.11-1.0.0.tgz  && rm -r kafka_2.11-1.0.0.tgz
RUN ln -s kafka_2.11-1.0.0 /app/kafka
RUN export CLIPASS=clientpass
RUN mkdir ssl

# docker build . -t kafka-study
# docker run -it -memory=4g kafka-study 

# /etc/passwd root 변경