package main

import (
	"fmt"
	"log"
	"net/url"

	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/namsral/flag"
)

func main() {
	var dbURL = "localhost"
	var username = "testUser"
	var password = "P@ssw0rd"
	var name = "test"

	var port = 10023
	var steps = 0

	flag.StringVar(&dbURL, "url", dbURL, "the url database of the flag")

	flag.StringVar(&username, "username", username, "the username database of the flag")
	flag.StringVar(&password, "password", password, "the password database of the flag")
	flag.StringVar(&name, "name", name, "the name database of the flag")
	flag.IntVar(&port, "port", port, "the port database of the flag")
	flag.IntVar(&steps, "steps", steps, "the steps database of the flag")
	flag.Parse()

	dbConURL := fmt.Sprintf("postgres://%s:%s@%s:%d/%s?sslmode=disable",
		url.QueryEscape(username),
		url.QueryEscape(password),
		dbURL,
		port,
		name)
	m, err := migrate.New("file://migrations", dbConURL)
	if err != nil {
		log.Fatal(err)
	}
	log.Println("Start Migrate")
	if steps > 0 {
		if err := m.Steps(steps); err != nil && err != migrate.ErrNoChange {
			log.Fatal(err)
		}
	} else {
		if err := m.Up(); err != nil && err != migrate.ErrNoChange {
			log.Fatal(err)
		}
	}
	log.Println("Success")
}
