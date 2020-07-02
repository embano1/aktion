package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

const (
	listenAddr     = "0.0.0.0:8080"
	defaultTimeout = time.Second * 3
)

func main() {
	mux := http.NewServeMux()
	mux.Handle("/", greeting())

	srv := http.Server{
		Addr:              listenAddr,
		Handler:           mux,
		IdleTimeout:       defaultTimeout,
		ReadHeaderTimeout: defaultTimeout,
		ReadTimeout:       defaultTimeout,
		WriteTimeout:      defaultTimeout,
	}

	log.Printf("starting server on %s", listenAddr)
	if err := srv.ListenAndServe(); err != nil {
		log.Fatal(err)
	}
}

func greeting() http.Handler {
	defaultGreeting := []byte("Hey anonymous, why don't you tell me your name :) ?")
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if name, ok := r.URL.Query()["name"]; ok && name[0] != "" {
			greeting := fmt.Sprintf("Hello %s! Nice to meet you!", name[0])
			_, _ = w.Write([]byte(greeting))
			return
		}
		_, _ = w.Write(defaultGreeting)
	})
}
