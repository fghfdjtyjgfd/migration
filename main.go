package main

import (
	"fmt"
	"log"
	"net/url"

	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/namsral/flag"
	"github.com/spf13/viper"
)

func main() {
	InitConfig()

	var dbURL = viper.GetString("db.host")
	var username = viper.GetString("db.username")
	var password = viper.GetString("db.password")
	var name = viper.GetString("db.name")

	var port = viper.GetInt("db.port")
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

func InitConfig() {
	viper.SetConfigName("config")
	viper.SetConfigType("yaml")
	viper.AddConfigPath("configs")

	err := viper.ReadInConfig()
	if err != nil {
		panic(err)
	}
}
