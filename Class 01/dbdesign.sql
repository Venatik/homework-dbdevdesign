DROP TABLE IF EXISTS student, teacher, grade_details, course, grade, achievement_type;

CREATE TABLE student (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,
	enrolled_date DATE,
	gender VARCHAR(10),
	national_id_number INT,
	student_card_number INT
);

SELECT * FROM student;

CREATE TABLE teacher (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	date_of_birth DATE NOT NULL,
	academic_rank VARCHAR(20),
	hire_date DATE
);

SELECT * FROM teacher;

CREATE TABLE course (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	credit INT,
	academic_year DATE,
	semester INT
);

SELECT * FROM course;

CREATE TABLE grade (
	id SERIAL PRIMARY KEY,
	student_id INT REFERENCES student(id),
	course_id INT REFERENCES course(id),
	teacher_id INT REFERENCES teacher(id),
	grade SMALLINT NOT NULL,
	comment VARCHAR(100),
	created_date DATE
);


SELECT * FROM grade;

CREATE TABLE grade_details (
	id SERIAL PRIMARY KEY,
	grade_id INT REFERENCES grade(id),
	achievement_type_id INT,
	achievement_points INT,
	achievement_max_points INT,
	achievement_date DATE
);

SELECT * FROM grade_details;

CREATE TABLE achievement_type (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description VARCHAR(100),
	participation_rate SMALLINT
);

SELECT * FROM achievement_type;