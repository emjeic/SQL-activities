CREATE TABLE students (
    id integer PRIMARY KEY,
	first_name character varying(255) NOT NULL,
	middle_name character varying(255) NULL,
    last_name character varying(255) NOT NULL,
	age integer,
	location character varying(255) NOT NULL,
);

INSERT INTO students (id, first_name, middle_name, last_name, age, location)
VALUES (1, "MJ", "David", "Cruz", 32, "Bulacan", true);

INSERT INTO students (id, first_name, middle_name, last_name, age, location)
VALUES (2, "Richard", "Santos", "Custodio", 28, "Marikina", true);

INSERT INTO students (id, first_name, middle_name, last_name, age, location)
VALUES (3, "Jessico", "Enriquez", "Niluag", 37, "Manila", true);

INSERT INTO students (id, first_name, middle_name, last_name, age, location)
VALUES (4, "Mark", "Palad", "Militar", 31, "Makati", true);

INSERT INTO students (id, first_name, middle_name, last_name, age, location)
VALUES (5, "Gabrielle", "Esquivel", "Bonbon", 33, "Pasig", true);

INSERT INTO students (id, first_name, middle_name, last_name, age, location)
VALUES (6, "Cyrus", "Yap", "Torres", 30, "Pampanga", true);

UPDATE lessons
SET first_name = "Ener",
    middle_name = NULL,
    last_name = "Cenina",
    age = 29,
    location = "Cavite"
WHERE id = 1;

DELETE FROM students
WHERE id = 6;

SELECT COUNT(*) FROM students;

SELECT FROM students
WHERE location = "Manila"

SELECT AVG(age)
FROM students;

SELECT * FROM students
ORDER BY age DESC;
