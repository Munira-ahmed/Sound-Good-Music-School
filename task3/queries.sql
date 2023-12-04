--Query 1: 
CREATE VIEW lesson_summary AS
SELECT 
    EXTRACT(YEAR FROM start_time) AS Year,
    TO_CHAR(start_time, 'Mon') AS Month,
    COUNT(*) AS Total,
    SUM(CASE WHEN price_id BETWEEN 1 AND 3 THEN 1 ELSE 0 END) AS Individual,
    SUM(CASE WHEN price_id BETWEEN 4 AND 6 THEN 1 ELSE 0 END) AS Group,
    SUM(CASE WHEN price_id BETWEEN 7 AND 9 THEN 1 ELSE 0 END) AS Ensemble
FROM 
    lesson
GROUP BY 
    EXTRACT(YEAR FROM start_time),
    TO_CHAR(start_time, 'Mon')
ORDER BY 
    MIN(start_time);

--to use this query : 
--select * from lesson_summary
--WHERE Year = 2023;


--Alternative to use in the where condition : 
--start_time >= '2024-01-01' AND start_time < '2025-01-01'
--give the same result. 

--QUERY 2: 
CREATE VIEW student_siblings_summary AS
SELECT
    GREATEST(COALESCE(sibling_count, 0) - 1, 0) AS No_of_Siblings,
    COUNT(student.id) AS No_of_Students
FROM
    student
LEFT JOIN (
    SELECT
        siblings_id,
        COUNT(*) AS sibling_count
    FROM
        student
    WHERE
        siblings_id IS NOT NULL
    GROUP BY
        siblings_id
) AS siblings ON student.siblings_id = siblings.siblings_id
GROUP BY
    No_of_Siblings
ORDER BY
    No_of_Siblings;

--query 2 using subqueries: 
SELECT
    GREATEST(COALESCE((SELECT COUNT(*) FROM student WHERE siblings_id = s.siblings_id), 0) - 1, 0) AS No_of_Siblings,
    COUNT(s.id) AS No_of_Students
FROM
    student s
GROUP BY
    No_of_Siblings
ORDER BY
    No_of_Siblings;

--query 3 :
CREATE VIEW teacher_lessons AS
SELECT
    i.id AS "Instructor Id",
    p.first_name AS "First Name",
    p.last_name AS "Last Name",
    COUNT(l.lesson_id) AS "No of Lessons"
FROM
    instructor i
JOIN
    person p ON i.person_id = p.id
JOIN
    lesson l ON i.id = l.instructor_id
GROUP BY
    i.id, p.first_name, p.last_name
HAVING
    COUNT(l.lesson_id) > 1 -- replace :your_specific_number with the desired number
ORDER BY
    COUNT(l.lesson_id) DESC;

--Query 4: 

SELECT
    TO_CHAR(l.start_time, 'Dy') AS day_of_week,
    e.ensamble_genre,
    e.maximum_nr_of_students - COUNT(ls.student_id) AS available_seats
FROM
    ensembles e
JOIN
    lesson l ON e.lesson_id = l.lesson_id
LEFT JOIN
    student_lessons ls ON e.lesson_id = ls.lesson_id
GROUP BY
    day_of_week, e.ensamble_genre, e.maximum_nr_of_students
ORDER BY
    day_of_week, e.ensamble_genre;

--alternative query 4: 
CREATE VIEW ensemble_availability AS
SELECT
    TO_CHAR(l.start_time, 'Dy') AS day_of_week,
    e.ensamble_genre,
    e.maximum_nr_of_students,
    e.maximum_nr_of_students - COUNT(ls.student_id) AS available_seats
FROM
    ensembles e
JOIN
    lesson l ON e.lesson_id = l.lesson_id
LEFT JOIN
    student_lessons ls ON e.lesson_id = ls.lesson_id
GROUP BY
    day_of_week, e.ensamble_genre, e.maximum_nr_of_students
ORDER BY
    day_of_week, e.ensamble_genre, e.maximum_nr_of_students;

