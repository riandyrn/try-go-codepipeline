package main

import (
	"log"
	"net/http"
)

const addr = ":8091"

func handleIndex(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Yuhu!"))
}

func main() {
	http.HandleFunc("/", handleIndex)
	log.Printf("listening on %v", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
