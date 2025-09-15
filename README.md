# kafka-deploy

> Simple infrastructure setup to deploy **Apache Kafka (KRaft mode)** with **AKHQ**, plus a Go client example (producer/consumer).

---

## 📘 Description

This repository provides configuration and scripts to:

- Run **Apache Kafka** in **KRaft mode** (without Zookeeper).  
- Deploy **AKHQ** as a UI to monitor Kafka clusters, create topics, and produce/consume messages through the browser.  
- Test with a **Go client**: both producer and consumer examples.  

This setup is intended for **learning, experimenting, and local development**.

---

## 🔗 Reference

Detailed guide available here:  
[Golang x Kafka #1 — How to Deploy Apache Kafka with Docker (KRaft Mode) and AKHQ](https://andriantriputra.medium.com/golang-x-kafka-1-how-to-deploy-apache-kafka-with-docker-kraft-mode-and-akhq-a103e43890c3)  
by [me](https://andriantriputra.medium.com/)

---

## 🛠️ Repository Structure

```sh
.
├── docker/ # Docker-related configs and environment files
├── kafka/ # Kafka (KRaft mode) configs and scripts
├── Makefile # Shortcut commands (up, down, build, etc.)
├── main.go # Go example: producer / consumer
├── go.mod / go.sum # Go modules
└── LICENSE # MIT License
```

## Usage
1. Clone the repo:
```bash
$ git clone https://github.com/andriantp/kafka-deploy.git deploy
$ cd deploy
```

2. Adjust configs if needed: Kafka advertised listeners, AKHQ username/password, ports (check under docker/ and kafka/ directories).

3. Start Kafka + AKHQ:
```bash
$ make v1-up
```

4. Verify containers:
```bash
$ docker ps -a
```
You should see containers for Kafka and AKHQ running.

5. Access AKHQ UI at [here](http://localhost:8080)
(default). From there you can create topics, monitor cluster status, produce/consume via UI, and check partitions or replication.

6. Run Go client examples:
```bash
# Producer:
$ go run . producer key-1 value-1

# Consumer:
$ go run . consumer
```

Make sure the Kafka host in your Go code matches your Docker/Kafka setup (e.g., localhost vs container host).

## Configuration Notes
- Topic name, partition count, and replication factor can be set via AKHQ or Kafka configs.
- Ensure advertised.listeners in Kafka config is correct if connecting from outside Docker.
- For production-like environments, secure AKHQ with proper credentials and network access control.

## Testing Checklist

- Create a topic via AKHQ
- Send messages with the Go producer
- Read messages with the Go consumer
- Verify messages appear in AKHQ

## License

MIT License. See the LICENSE file for details.

