package server

import (
	"fmt"
	"log"
	"net/http"
)

func Start(port int) {
	http.HandleFunc("/ping", func(writer http.ResponseWriter, req *http.Request) {
		writer.Write([]byte("pong"))
	})

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", port), nil))
}

func Add(n1, n2 int) int {
	return n1 + n2
}
