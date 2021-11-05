FROM ubuntu:20.04

RUN apt-get update \
 && apt-get install -y openjdk-8-jdk
RUN apt-get install systemd -y
RUN apt-get install -y wget net-tools netcat tar vim
RUN apt-get install -y openssh-client
RUN mkdir -p /app
WORKDIR /app

RUN wget https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz\
 && tar -xzf kafka_2.11-1.0.0.tgz\
 && ln -s kafka_2.11-1.0.0 kafka

RUN rm -r kafka_2.11-1.0.0.tgz
COPY ./config/server.properties /app/kafka/config/server.properties


EXPOSE 9092 22
CMD ["/app/kafka/bin/kafka-server-start.sh", "/app/kafka/config/server.properties"]
# docker exec -it e1a3d22a0f83 /bin/bash

# docker-compose up --build -d