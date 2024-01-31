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

-- JOINS Activity
-- Create new table research_papers with the following columns
-- id - primary key
-- student_id - foreign key
-- grade - grades can be "A", "B", "C", "D", "E", "F", or NULL
CREATE TABLE research_papers (
    id INT PRIMARY KEY,
    student_id INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

SELECT * FROM research_papers;

DELETE FROM research_papers;
-- Insert 10 records to the new table
-- 2 students should have more than 1 research paper
-- 2 students should have 1 ungraded (NULL) research paper
INSERT INTO research_papers (id, student_id, grade)
VALUES
	(1, 1, 'A'), -- student Ener
	(2, 1, 'B'), -- student Ener
	(3, 1, 'C'), -- student Ener
	(4, 2, 'D'), -- student Richard
	(5, 3, NULL), -- student Jessico
	(6, 2, 'E'), -- student Richard
	(7, 4, 'F'), -- student Mark
	(8, 5, NULL), -- student Gabrielle
	(9, 4, 'A'), -- student Mark
	(10, 5, 'B'); -- student Gabrielle

-- Query all students with multiple research papers (select first_name, last_name, and number_of_research_papers only)

SELECT 
    students.first_name, 
    students.last_name, 
    COUNT(research_papers.id) AS number_of_research_papers
FROM 
    students
JOIN 
    research_papers ON students.id = research_papers.student_id
GROUP BY 
    students.id
HAVING 
    COUNT(research_papers.id) > 1;
    
 -- Query all students with ungraded research papers (select first_name, last_name, research_paper_id, and grade only)
 
 SELECT 
    students.first_name, 
    students.last_name, 
    research_papers.id AS research_paper_id, 
    research_papers.grade
FROM 
    students
JOIN 
    research_papers ON students.id = research_papers.student_id
WHERE 
    research_papers.grade IS NULL;