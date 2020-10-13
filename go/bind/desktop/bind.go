package main

import "C"

import (
	"fmt"
	"net/http"
)

func main() {

}

//export Start
func Start(port int) *C.char {
	http.HandleFunc("/ping", func(writer http.ResponseWriter, req *http.Request) {
		writer.Write([]byte("pong"))
	})

	return C.CString(http.ListenAndServe(fmt.Sprintf(":%d", port), nil).Error())
}

//export Add
func Add(n1, n2 int32) int32 {
	return n1 + n2
}
