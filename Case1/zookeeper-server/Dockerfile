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
COPY ./config/zookeeper.properties /app/kafka/config/zookeeper.properties

EXPOSE 2181 22
CMD ["/app/kafka/bin/zookeeper-server-start.sh", "/app/kafka/config/zookeeper.properties"]

# docker container ls
# docker exec -it e1a3d22a0f83 /bin/bash
# docker-compose up --build -d