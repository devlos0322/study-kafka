"# study-kafka" 

## Case1: Single Zookeeper Server, Single Kafka Server, Single Kafka Client of Basic Options.


## 사용법
1. ### 설치
    Case1/kafka-server/config/server.properties 파일에서 카프카 서버 ID를 서버 환경에 맞게 수정
    ```bash
    advertised.listeners=PLAINTEXT://192.168.33.56:9092 # Host IP 정보: 192.168.33.56
    ```


    Case1 디렉토리로 이동하여 아래 명령어 실행
    ```bash
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



## Case2: Single Zookeeper Server, Single Kafka Server, Single Kafka Client of Basic Options.
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