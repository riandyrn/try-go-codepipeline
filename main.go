package main

import (
	"log"
	"net/http"
)

const addr = ":8091"

func handleIndex(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello! It's able to handle the failure in test. This is great :D!"))
}

func main() {
	http.HandleFunc("/", handleIndex)
	log.Printf("listening on %v", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
