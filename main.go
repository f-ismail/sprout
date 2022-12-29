package main

import (
	"github.com/f-ismail/seed/tools/server"
)

func main() {
	config := server.NewOptions().
		Address("0.0.0.0").
		Port(8080)

	s := server.New(config)
	s.Start()
}
