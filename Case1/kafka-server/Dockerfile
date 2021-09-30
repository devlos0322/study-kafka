FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
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

COPY ./config/*.service /etc/systemd/system/

RUN systemctl enable zookeeper
RUN systemctl enable kafka
RUN systemctl start zookeeper
RUN systemctl start kafka

CMD ["/bin/bash"]
EXPOSE 9092 2181 22
# docker exec -it e1a3d22a0f83 /bin/bash

# docker-compose up --build -d