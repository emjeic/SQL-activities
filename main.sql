-- Activity 1
CREATE TABLE students (
    id integer PRIMARY KEY NOT NULL,
	first_name character varying(255) NOT NULL,
	middle_name character varying(255) NULL,
    last_name character varying(255) NOT NULL,
	age integer,
	location character varying(255) NOT NULL,
);

INSERT INTO students (id, first_name, middle_name, last_name, age, location)
VALUES 
    (1, 'MJ', '', 'Cruz', 32, 'Bulacan'),
    (2, 'Richard', '', 'Custodio', 28, 'Marikina'),
    (3, 'Jessico', '', 'Niluag', 37, 'Manila'),
    (4, 'Mark', '', 'Militar', 31, 'Makati'),
    (5, 'Gabrielle', '', 'Bonbon', 33, 'Pasig'),
    (6, 'Cyrus', '', 'Torres', 30, 'Pampanga');

UPDATE students
SET first_name = 'Ener',
	middle_name = 'Ingram',
    last_name = 'Cenina',
    age = 29,
    location = 'Cavite'
WHERE id = 1;

DELETE FROM students
WHERE id = 6;
-- OR
DELETE FROM students
WHERE id = (SELECT MAX(id) FROM students);


-- Activity 2
SELECT COUNT(*) FROM students;

SELECT * FROM students
WHERE location = "Manila"

SELECT AVG(age)
FROM students;

SELECT * FROM students
ORDER BY age DESC;
