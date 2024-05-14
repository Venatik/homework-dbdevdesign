-- Inserting mock data for students
INSERT INTO student (first_name, last_name, date_of_birth, enrolled_date, gender, national_id_number, student_card_number) 
VALUES 
    ('John', 'Doe', '2000-05-10', '2023-09-01', 'Male', 1234567890, 1001),
    ('Jane', 'Smith', '2001-02-15', '2023-09-01', 'Female', 0987654321, 1002),
    ('Michael', 'Johnson', '1999-11-20', '2023-09-01', 'Male', 1357924680, 1003);
	
	SELECT * FROM student

-- Inserting mock data for teachers
INSERT INTO teacher (first_name, last_name, date_of_birth, academic_rank, hire_date) 
VALUES 
    ('Emily', 'Brown', '1980-08-25', 'Professor', '2010-06-15'),
    ('Robert', 'Wilson', '1975-03-12', 'Associate Professor', '2005-09-10'),
    ('Sarah', 'Garcia', '1990-11-05', 'Assistant Professor', '2018-03-20');
	
	SELECT * FROM teacher

-- Inserting mock data for courses
INSERT INTO course (name, credit, academic_year, semester) 
VALUES 
    ('Introduction to Computer Science', 3, '2023-09-01', 1),
    ('Linear Algebra', 4, '2023-09-01', 1),
    ('World History', 3, '2023-09-01', 2);
	
	SELECT * FROM course

-- Inserting mock data for grades
INSERT INTO grade (student_id, course_id, teacher_id, grade, comment, created_date) 
VALUES 
    (1, 1, 1, 85, 'Well done!', '2024-05-10'),
    (2, 2, 2, 78, 'Keep it up!', '2024-05-11'),
    (3, 3, 3, 90, 'Excellent work!', '2024-05-12');
	
	SELECT * FROM grade

-- Inserting mock data for grade_details
INSERT INTO grade_details (grade_id, achievement_type_id, achievement_points, achievement_max_points, achievement_date) 
VALUES 
    (1, 1, 80, 100, '2024-05-10'),
    (2, 2, 70, 100, '2024-05-11'),
    (3, 3, 90, 100, '2024-05-12');
	
	SELECT * FROM grade_details

-- Inserting mock data for achievement_type
INSERT INTO achievement_type (name, description, participation_rate) 
VALUES 
    ('Test', 'Test achievement type', 80),
    ('Assignment', 'Assignment achievement type', 70),
    ('Final Exam', 'Final exam achievement type', 90);
	
	SELECT * FROM achievement_type
