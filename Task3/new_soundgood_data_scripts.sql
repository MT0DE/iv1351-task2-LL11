--checks for available lessons (This script is not part of the assignment
                              --but it shows all teachers who are available for booking)
-- SELECT p.id, CONCAT(p.first_name, ' ', p.last_name) as "name", inst.num_of_available_lessons
-- FROM instructor
-- LEFT JOIN (SELECT id, first_name, last_name 
--            FROM person) AS p 
--            ON p.id = instructor.person_id 
-- LEFT JOIN (SELECT instructor_id, COUNT(available_date) AS num_of_available_lessons 
--            FROM available 
--            GROUP BY instructor_id) as inst 
--            ON person_id = inst.instructor_id
-- WHERE  
-- ORDER BY num_of_available_lessons DESC;

--FOR ASSIGNMENT 
--finds the amount of lessons an instructor has given more or equal to X times during the current month
CREATE VIEW instructors_lesson_curr_month AS
SELECT DISTINCT p.id, CONCAT(p.first_name, ' ', p.last_name) as "name", inst.given_lessons, EXTRACT(month FROM CURRENT_DATE) AS "month"
FROM instructor
JOIN (SELECT id, first_name, last_name 
           FROM person) AS p 
           ON p.id = person_id 
JOIN (SELECT instructor_id, COUNT(*) AS given_lessons 
           FROM booking
           WHERE EXTRACT(month FROM booking.booking_date) = EXTRACT(month FROM CURRENT_DATE)
           GROUP BY instructor_id) AS inst
           ON inst.instructor_id = person_id
JOIN (SELECT instructor_id, booking_date 
           FROM booking
           WHERE EXTRACT(month FROM booking_date) = EXTRACT(month FROM CURRENT_DATE)) AS "date"
           ON "date".instructor_id = person_id
WHERE inst.given_lessons >= 1 -- <-X
ORDER BY inst.given_lessons DESC;

--list ensembles
CREATE VIEW ensembles_next_week AS
SELECT nextweek.booking_date, genre, CASE WHEN poses.available_positions = 0 THEN 'FULL' 
                                   WHEN poses.available_positions = 1 OR poses.available_positions = 2 THEN '1-2 Positions remain'
                                   ELSE '2 or more positions remain'
                                   END AS slots
FROM ensemble
LEFT JOIN (SELECT booking_id, available_positions
      FROM group_lesson) as poses ON poses.booking_id = group_lesson_id
LEFT JOIN (SELECT id, booking_date, EXTRACT(isodow FROM booking_date) as weekday_num
      FROM booking) as nextweek ON nextweek.id = group_lesson_id
      WHERE (EXTRACT(week FROM CURRENT_DATE) + 1) = EXTRACT(week FROM nextweek.booking_date)
ORDER BY genre, nextweek.weekday_num ASC;

--lists the total number of people with 1,2 or 3 siblings
CREATE VIEW num_of_siblings AS
SELECT 
    (SELECT COUNT(*) FROM (SELECT COUNT(*) FROM student GROUP BY family_id HAVING COUNT(*) = 1) AS foo) AS num0sib, 
    (SELECT COUNT(*)*2 FROM (SELECT COUNT(*) FROM student GROUP BY family_id HAVING COUNT(*) = 2) AS bar) AS num1sib,  
    (SELECT COUNT(*)*3 FROM (SELECT COUNT(*) FROM student GROUP BY family_id HAVING COUNT(*) = 3) AS foobar) AS num2sib;

-- shows the number of lessons given per month during a specified year
CREATE VIEW num_of_lesson_2022 AS
SELECT 
    EXTRACT(MONTH FROM booking.booking_date) AS month, 
    COUNT(*) AS all_lessons, 
    SUM(CASE WHEN group_lesson_id IS NULL AND booking_id IS NULL THEN 1 ELSE 0 END) AS singlelessons, 
    SUM(CASE WHEN group_lesson_id IS NULL AND booking_id IS NOT NULL THEN 1 ELSE 0 END) AS grouplessons, 
    SUM(CASE WHEN group_lesson_id IS NOT NULL AND booking_id IS NOT NULL THEN 1 ELSE 0 END) AS ensembles
FROM booking
    LEFT JOIN group_lesson ON booking.id = group_lesson.booking_id
    LEFT JOIN ensemble ON booking.id = ensemble.group_lesson_id
WHERE EXTRACT(YEAR FROM booking.booking_date) = '2022'
GROUP BY month;

--alternative solution to finding siblings
CREATE VIEW num_of_siblings_alt AS
SELECT 
    (SELECT SUM(foo.a) FROM (SELECT COUNT(*) as a FROM student GROUP BY family_id HAVING COUNT(*) = 1) AS foo) AS students_with_0_siblings, 
    (SELECT SUM(bar.b) FROM (SELECT COUNT(*) as b FROM student GROUP BY family_id HAVING COUNT(*) = 2) AS bar) AS students_with_1_siblings,  
    (SELECT SUM(foobar.c) FROM (SELECT COUNT(*) as c FROM student GROUP BY family_id HAVING COUNT(*) = 3) AS foobar) AS students_with_2_siblings;
