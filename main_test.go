package main

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestIndex(t *testing.T) {
	// create http request
	req, err := http.NewRequest("GET", "/", nil)
	if err != nil {
		t.Fatalf("unexpected error when initiating request: %v", err)
	}
	// create both response recorder & handler
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(handleIndex)

	// execute request
	handler.ServeHTTP(rr, req)
	// check returned http status code
	if rr.Code != http.StatusOK {
		t.Errorf("unexpected response status, expected: %v, got: %v", http.StatusOK, rr.Code)
	}
	// check response content
	containsWord := "Hello"
	if !strings.Contains(rr.Body.String(), containsWord) {
		t.Errorf("response should contains word: `%v`", containsWord)
	}
}
