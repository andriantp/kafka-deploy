package main

import (
	"flag"
	"kafka/kafka"
	"log"
	"os"

	k "github.com/segmentio/kafka-go"
)

var (
	broker = "kafka:9092" // "localhost:29092"
	topic  = "kafka-test"
)

func main() {
	flag.Usage = func() {
		log.Printf("Usage:")
		log.Printf("consumer : go run . consumer")
		log.Printf("producer : go run . producer key value")
		flag.PrintDefaults()
	}
	flag.Parse()
	if len(flag.Args()) < 1 {
		flag.Usage()
		os.Exit(1)
	}
	
	switch flag.Args()[0] {
	case "consumer":
		kafka.Consumer(broker, topic)

	case "producer":
		msg := k.Message{
			Key:   []byte(flag.Args()[1]),
			Value: []byte(flag.Args()[2]),
		}

		if err := kafka.Producer(broker, topic, msg); err != nil {
			log.Fatalf("Producer:%v", err)
		}
	}

}
