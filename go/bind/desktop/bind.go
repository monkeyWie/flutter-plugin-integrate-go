package main

import "C"

import (
	"fmt"
	"log"
	"net/http"
)

func main() {

}

//export Start
func Start(port int) {
	go func() {
		http.HandleFunc("/ping", func(writer http.ResponseWriter, req *http.Request) {
			writer.Write([]byte("pong"))
		})

		log.Fatal((http.ListenAndServe(fmt.Sprintf(":%d", port), nil)))
	}()
}

//export Add
func Add(n1, n2 int32) int32 {
	return n1 + n2
}
