package main

import (
	"fmt"
	"net/http"
)

func setupRoutes() {
	http.HandleFunc("/get", func(w http.ResponseWriter, r *http.Request) {
		// read cors
		enableCors(&w)
		fmt.Println("request")
		fmt.Fprintf(w, "Simple Server")
	})
}

func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
	(*w).Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
	(*w).Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
}

func main() {
	setupRoutes()
	http.ListenAndServe(":8080", nil)
}
