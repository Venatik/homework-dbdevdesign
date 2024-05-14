SELECT * FROM achievement_type
SELECT * FROM student
SELECT * FROM teacher

UPDATE achievement_type
SET participation_rate = 75
WHERE id = 2

ALTER TABLE grade_details
ADD CONSTRAINT fk_achievement_type
FOREIGN KEY (achievement_type_id) REFERENCES achievement_type(id) 

UPDATE student SET first_name = 'James' WHERE id = 1;

UPDATE teacher SET academic_rank = 'Sr. Professor' WHERE id = 1;

INSERT INTO achievement_type (name, description, participation_rate)
VALUES ('Project', 'Final Project', 100);