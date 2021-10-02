```dockerfile
FROM  <이미지>:<태그>
# 도커 이미지는 Base 이미지부터 시작해서 새로운 이미지들을 중첩하며 만들어진다. From은 base이미지다. 일반적으로 Dockerhub와 같은 Docker repository에 올려놓은 잘 알려진 공개 이미지인 경우가 많다.

WORKDIR <이동할 경로>
# Shell cd 명령문 처럼 컨테이너 상에서 작업 디렉터리의 전환을 위해 사용된다. WORKDIR 명령문으로 디렉토리를 지정하면 그 이후에 등장하는 모든 명령문은 해당 디렉터리를 기준으로 실행된다.

RUN ["<커맨드>", "<파라미터1>", "<파라미터2>"]
RUN <전체 커맨드>
# RUN 명령문은 마치 쉘에서 커맨드를 실행하는 것 처럼 이미지 빌드과정에서 필요한 커맨드를 실행하기 위해 사용된다.
RUN npm install --silent

ENTRYPOINT ["<커맨드>", "<파라미터1>", "<파라미터2>"]
ENTRYPOINT <전체 커맨드>
# ENTRYPOINT 명령문은 이미지를 컨테이너로 띄울 때 항상 실행되야하는 커맨드를 지정할 때 새용한다.
ENTRYPOINT ["npm", "start"] 

CMD ["<커맨드>", "<파라미터1>", "<파라미터2>"]
CMD ["<파라미터1>", "<파라미터2>"]
CMD <전체 커맨드>
# CMD 명령문은 해당 이미지를 컨테이너로 띄울 때 디폴트로 실행할 커맨드나, ENTRYPOINT 명령문으로 지정된 커맨드에 디폴트로 넘길 파라메터를 지정할 때 사용한다.

https://github.com/cdr/code-server

```

## Case1: Zookeeper Server, Kafka Server, Kafka Client with Basic Options
---
Case1은 기본적인 도커패키지를 이용
## 사용법
1. ### 설치
    프로젝트 다운로드 및 서버 IP address를 서버 환경에 맞게 수정
    ```bash
    git clone https://github.com/devlos0322/study-kafka.git
    vim ./study-kafka/Case1/kafka-server/config/server.properties
    # (Windows OS 의 경우 다운로드 받은 repository 경로에 직접 접근하여 IP 정보 수정)
    #### 수정 ####
    advertised.listeners=PLAINTEXT://192.168.33.56:9092 # Host IP 정보: 192.168.33.56
    ```

    Case1 디렉토리로 이동하여 아래 명령어 실행
    ```bash
    cd ./study-kafka/Case1/
    docker-compose up -d
    ```
2. ### 테스트 클라이언트 설정
    윈도우 Ubuntu환경에서 Kafka 소스코드 다운로드 및 압축해제
    ```bash
    wget https://archive.apache.org/dist/kafka/1.0.0/kafka_2.11-1.0.0.tgz\
      && tar -xzf kafka_2.11-1.0.0.tgz\
      && ln -s kafka_2.11-1.0.0 kafka\
      && rm -r kafka_2.11-1.0.0.tgz
    ```
3. 실행
    ```bash
    ~/kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --create --topic kafka-security-topic --replication-factor 1 --partitions 2

    # Producer
    ~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic kafka-security-topic
    # Consumer
    ~/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic kafka-security-topic

    ```

## 환경설정
- ###  Zookeeper Server

    - 포트정보
        | 포트번호   | 기능 |
        | :--------: | ----------- |
        | 10022      | 터미널 원격 접속용               |
        | 2181       | Kafka     |

    기본 설치

- ### Kafka Server
    -  포트정보
        | 포트번호   | 기능 |
        | :--------: | ----------- |
        | 20022      | 터미널 원격 접속용               |
        | 9092       | 기본 Plantext Topic 수신용       |

기본 설치
- ### Kafka Client

    - 포트정보
        | 포트번호   | 기능 |
        | :--------: | ----------- |
        | 30022      | 터미널 원격 접속용               |

    기본 설치



## Case2: Zookeeper Server, Kafka Server, Kafka Client with SSL Encryption


### Zookeeper Server
포트정보
| 포트번호   | 기능 |
| :--------: | ----------- |
| 10022      | 터미널 원격 접속용               |
| 2181       | Kafka     |

기본 설치
### Kafka Server
포트정보
| 포트번호   | 기능 |
| :--------: | ----------- |
| 20022      | 터미널 원격 접속용               |
| 9092       | 기본 Plantext Topic 수신용       |

기본 설치
### - Kafka Client
기본 설치
| 포트번호   | 기능 |
| :--------: | ----------- |
| 30022      | 터미널 원격 접속용               |