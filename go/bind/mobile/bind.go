package server

import (
	"fmt"
	"log"
	"net/http"
	"sync"
)

var once sync.Once

func Start(port int32) {
	once.Do(func() {
		go func() {
			http.HandleFunc("/ping", func(writer http.ResponseWriter, req *http.Request) {
				writer.Write([]byte("pong"))
			})

			log.Fatal((http.ListenAndServe(fmt.Sprintf(":%d", port), nil)))
		}()
	})
}
