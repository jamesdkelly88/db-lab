package main

import (
    "database/sql"
    "fmt"
	"os"
    _ "github.com/lib/pq"
)

func main() {
	// connection string
	psqlconn := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable", os.Getenv("DOMAIN"), 5433, "postgres", os.Getenv("SECRET_PASSWORD"), "postgres")
	 
	// open database
	db, err := sql.Open("postgres", psqlconn)
	CheckError(err)
 
	// close database
	defer db.Close()

	// check db
	err = db.Ping()
	CheckError(err)

	// get version
	var (
        value string
	)

	err = db.QueryRow("SELECT version();").Scan(&value)
	CheckError(err)

	fmt.Println(value)

}

func CheckError(err error) {
	if err != nil {
		panic(err)
	}
}