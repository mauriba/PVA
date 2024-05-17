#!/bin/bash

# a. create schema
schema=$"USE grouping;

CREATE TABLE Transaction (
    tid int AUTO_INCREMENT NOT NULL,
    pname VARCHAR(20) NOT NULL,
    amount int,
    comment VARCHAR(1024),
    PRIMARY KEY (tid)
);"
echo "$schema" > /docker-entrypoint-initdb.d/a-init-schema.sql

# b. insert data
comment=$(printf 'a%.0s' {1..1000})
command="INSERT INTO Transaction (pname, amount, comment) VALUES"
sql=$"('Alice', -1, '$comment'),
('Bob', 2, '$comment'),
('Alice', 1, '$comment'),
('Carl', 0, '$comment'),
('Dan', 3, '$comment'),"
sql=$(printf "$sql\n%.0s" {1..400})
sql=${sql%?};       

for i in {1..200}
do
    echo "$command$sql" > "/docker-entrypoint-initdb.d/b-init-rows-${i}.sql"
done

# c. run grouping query
query="mysql -uroot -proot -e 'USE grouping; SELECT pname, SUM(amount) FROM Transaction GROUP BY pname;'"
echo "$query" > "/docker-entrypoint-initdb.d/c-run-query.sh"