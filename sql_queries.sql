INSERT INTO exercises
(name, "language")
SELECT "Data Science intro", l.id
FROM languages l
WHERE l.name = "Python";

INSERT INTO exercises
(name, "language")
SELECT "Event listeners", l.id
FROM languages l
WHERE l.name = "JavaScript";

INSERT INTO exercises
(name, "language")
SELECT "C# aka Microsoft Java", l.id
FROM languages l
WHERE l.name = "C#";

INSERT INTO cohorts
(name)
VALUES ('Cohort 35');

INSERT INTO instructors
(firstName, lastName, slackHandle, speciality)
VALUES ('Steve', 'Brownlee', '@coach', 'King of reversing a student question');

INSERT INTO students
(firstName, lastName, slackHandle, cohortId)
SELECT 'Matt', 'Blagg', '@Matt B', c.id
FROM cohorts c
WHERE c.name = "Cohort 36";

SELECT * FROM students;

SELECT * FROM cohorts c2;

Select * from assignments;

INSERT INTO assignments
(studentId, exerciseId)
VALUES(7, 5);

SELECT
    s.firstName,
    s.lastName,
    s.slackHandle,
    c.name
FROM students s
JOIN cohorts c on c.id = s.cohortId
ORDER BY s.cohortId;

SELECT e2.name as 'lesson', l.name as 'language'
FROM exercises e2
JOIN languages l
ON l.id = e2."language"
WHERE l.name = "Python";

SELECT c2.name
FROM cohorts c2;

SELECT
firstName || " " || lastName as 'Name', e.name as 'Exercise', l.name as 'Language'
from exercises e
join assignments a on a.exerciseId = e.id
join students s on s.id = a.studentId
join languages l on l.id = e."language";



