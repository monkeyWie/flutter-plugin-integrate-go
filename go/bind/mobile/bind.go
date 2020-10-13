package server

import (
	"fmt"
	"net/http"
)

func Start(port int) error {
	http.HandleFunc("/ping", func(writer http.ResponseWriter, req *http.Request) {
		writer.Write([]byte("pong"))
	})

	return http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
}

func Add(n1, n2 int32) int32 {
	return n1 + n2
}
