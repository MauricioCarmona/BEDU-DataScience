CREATE DATABASE BEDUWork7;

USE BEDUWork7;

CREATE TABLE users (
	id INT PRIMARY KEY,
    genero CHAR(1),
    edad INT,
    ocupacion INT,
    cp VARCHAR(20)
);

SELECT * FROM users;

# RETO 1

CREATE TABLE IF NOT EXISTS movies (
	id INT PRIMARY KEY,
    title VARCHAR(90),
    genres VARCHAR(90)
);

CREATE TABLE IF NOT EXISTS ratings (
	user_id INT,
    movie_id INT,
    rating INT,
    time_stamp BIGINT
);