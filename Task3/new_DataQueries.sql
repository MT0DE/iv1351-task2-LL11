-- \i 'C:/Users/Samuel Sendek/Desktop/Skola/2Per2/IV1351 Datalagring/Project/Del 3/ModifiedLPM.sql'
INSERT INTO person (first_name, last_name, phone_number, email, person_number, street, zip,city)
VALUES

    ('Rowan','Pitts','065-931-63-41','sed.dui.fusce@icloud.net','24755462-8728','Ap #508-7024 Varius Rd.','56228','Linköping'),
    ('Emmanuel','Steele','064-189-85-22','sagittis.nullam.vitae@google.net','64248978-2835','872-5810 Curabitur Street','26249','Linköping'),
('Lance','Wiley','045-063-74-19','vitae@outlook.org','69243574-5454','622-6017 In Street','68806','Tranås'),
    ('Raja','Nixon','021-211-17-72','aliquam@aol.couk','56794575-4514','409-5769 Posuere Rd.','67607','Mjölby'),
    ('Megan','Swanson','068-443-11-61','mauris.sapien@yahoo.couk','48447145-5465','4658 Nec Av.','10889','Avesta'),
    ('Page','Pitts','015-697-89-14','nec.mauris@outlook.com','42663572-5422','Ap #541-892 Nisl Ave','66317','Nässjö'),
('Davis','Wright','003-355-46-25','eget.tincidunt@yahoo.couk','67355854-8498','Ap #764-3395 Tincidunt St.','22504','Norrköping'),
('Xaviera','Newton','096-308-22-15','praesent.interdum@yahoo.com','22243398-1855','Ap #259-8124 Nec, Road','21333','Skövde'),
    ('Cameron','Pace','035-361-32-17','tortor@yahoo.com','25692672-6553','6387 Donec Ave','54554','Mora'),
    ('Dustin','Cain','051-531-35-13','ornare.fusce@aol.couk','86837149-7235','410-1298 Proin St.','03764','Vänersborg'), 
('Demetrius','Freeman','069-630-11-30','eu@outlook.couk','77662392-6623','Ap #400-6059 Tellus. St.','77336','Vetlanda'),
    ('Alec','Patterson','046-583-33-25','sapien.gravida@outlook.couk','55347948-4324','Ap #699-2352 Massa Rd.','78840','Motala'),
    ('Ivan','Mayo','044-418-18-36','donec.nibh@aol.edu','64232138-2665','438-447 Tempor Rd.','14180','Lidköping'),
    ('Carol','Parrish','082-183-15-85','vel.mauris.integer@google.org','23713668-5557','467 Augue Av.','51505','Lerum'),
('Rylee','Finch','040-126-96-28','felis.eget@icloud.org','31396236-9774','Ap #358-3593 Integer Avenue','47766','Ockelbo'),
    ('Hayley','Swanson','036-488-26-53','ultricies.ornare@yahoo.edu','24744668-8777','758-7211 Arcu Street','10121','Falun'),
    ('Herrod','Swanson','082-348-37-23','nulla.eu@google.net','22771373-5976','9725 Ullamcorper Road','17651','Upplands Väsby'),
    ('Stephen','Cain','023-215-23-84','porttitor@icloud.edu','28369667-2181','Ap #152-9531 Semper St.','26686','Linköping');


INSERT INTO payment (lesson_price, instructor_salary, siblingDiscount)
Values

(150,1300,0.25),
(100,1000,0.25),
(1000,800,0.25),
(200,1800,0.25),
(200,1500,0.25),
(1500,1100,0.25);



INSERT INTO instructor(person_id, knows_ensamble)
VALUES
 
((SELECT id FROM person WHERE phone_number = '045-063-74-19'),
    cast(0 AS BIT)),
((SELECT id FROM person WHERE phone_number = '003-355-46-25'),
    cast(1 AS BIT)),
((SELECT id FROM person WHERE phone_number = '096-308-22-15'),
    cast(1 AS BIT)),
((SELECT id FROM person WHERE phone_number = '069-630-11-30'),
    cast(0 AS BIT)),
((SELECT id FROM person WHERE phone_number = '040-126-96-28'),
    cast(0 AS BIT));


INSERT INTO known_instrument(instructor_id, instrument)
VALUES
 
((SELECT person_id FROM instructor WHERE person_id = 3),
    'Guitar'),
((SELECT person_id FROM instructor WHERE person_id = 3),
    'Drums'),

((SELECT person_id FROM instructor WHERE person_id = 7),
    'Guitar'),
((SELECT person_id FROM instructor WHERE person_id = 7),
    'Piano'),

((SELECT person_id FROM instructor WHERE person_id = 8),
    'Guitar'),
((SELECT person_id FROM instructor WHERE person_id = 8),
    'Piano'),
((SELECT person_id FROM instructor WHERE person_id = 8),
    'Drums'),
((SELECT person_id FROM instructor WHERE person_id = 8),
    'Harp'),

((SELECT person_id FROM instructor WHERE person_id = 11),
    'Flute'),

((SELECT person_id FROM instructor WHERE person_id = 15),
    'Piano'),
((SELECT person_id FROM instructor WHERE person_id = 15),
    'Harp');


INSERT INTO available(instructor_id, available_date, start_time, end_time)
VALUES
 
((SELECT person_id FROM instructor WHERE person_id = 3),
    '2022-11-30','12:00','16:15'),
((SELECT person_id FROM instructor WHERE person_id = 3),
    '2022-12-05','10:00','17:00'),
    
((SELECT person_id FROM instructor WHERE person_id = 7),
    '2022-12-24','08:00','20:00'),

((SELECT person_id FROM instructor WHERE person_id = 8),
    '2022-12-24','08:00','20:00'),

((SELECT person_id FROM instructor WHERE person_id = 15),
    '2022-12-24','08:00','20:00');



INSERT INTO booking(instructor_id, payment_id, locale, booking_date, start_time, end_time, difficulty, instrument)
VALUES

((SELECT person_id FROM instructor WHERE person_id = 3), 
    (SELECT id FROM payment WHERE id = 2),
    'Classroom33','2022-12-06','15:00','17:00','Beginner','Guitar'),
((SELECT person_id FROM instructor WHERE person_id = 15), 
    (SELECT id FROM payment WHERE id = 1),
    'Classroom33','2022-11-30','13:00','15:00','Intermediate','Piano'),
((SELECT person_id FROM instructor WHERE person_id = 7), 
    (SELECT id FROM payment WHERE id = 1),
    'Classroom31B','2022-11-25','14:30','16:30','Intermediate','Guitar'),
((SELECT person_id FROM instructor WHERE person_id = 8), 
    (SELECT id FROM payment WHERE id = 4),
    'Classroom24B','2022-11-26','14:30','16:00','Advanced', Null),
((SELECT person_id FROM instructor WHERE person_id = 11), 
    (SELECT id FROM payment WHERE id = 3),
    'Classroom31A','2022-12-02','13:00','14:00','Intermediate','Flute'),
((SELECT person_id FROM instructor WHERE person_id = 8), 
    (SELECT id FROM payment WHERE id = 4),
    'Classroom24B','2022-11-20','15:00','16:30','Advanced',Null),
((SELECT person_id FROM instructor WHERE person_id = 15), 
    (SELECT id FROM payment WHERE id = 1),
    'Classroom31B','2022-12-07','14:30','16:30','Intermediate', 'Piano'),
((SELECT person_id FROM instructor WHERE person_id = 7), 
    (SELECT id FROM payment WHERE id = 1),
    'Classroom33','2022-12-01','15:00','17:00','Intermediate','Guitar'),
((SELECT person_id FROM instructor WHERE person_id = 8), 
    (SELECT id FROM payment WHERE id = 4), 
    'Classroom24B','2022-12-07','14:30','16:00','Advanced', Null);



INSERT INTO group_lesson(booking_id, available_positions, min_students)
Values

((SELECT id FROM booking WHERE id = 1),
    4,2),
((SELECT id FROM booking WHERE id = 2),
    7,3),
((SELECT id FROM booking WHERE id = 3),
    5,2),
((SELECT id FROM booking WHERE id = 7),
    7,2),
((SELECT id FROM booking WHERE id = 8),
    6,2),
((SELECT id FROM booking WHERE id = 4),
    0,3),
((SELECT id FROM booking WHERE id = 6),
    1,3),
((SELECT id FROM booking WHERE id = 9), 
    4,2);    


INSERT INTO ensemble(group_lesson_id, genre)
Values

((SELECT booking_id FROM group_lesson WHERE booking_id = 4),
    'Rock'),
((SELECT booking_id FROM group_lesson WHERE booking_id = 6),
    'Rock'),
((SELECT booking_id FROM group_lesson WHERE booking_id = 9),
    'Pop');



INSERT INTO contact_person (contact_person_phone, contact_person_email)
VALUES

('022-763-26-28','cras@icloud.edu'),
('016-628-54-38','nullam.scelerisque@google.couk'),
('047-065-84-96','nec.diam@aol.ca'),
('062-124-54-55','purus.ac@yahoo.com'),
('008-118-80-53','mauris.eu@protonmail.edu');

 
INSERT INTO student(person_id, contact_person_id)
VALUES

((SELECT id FROM person WHERE id = 1),
    (SELECT id FROM contact_person WHERE contact_person_phone = '022-763-26-28')), --sibling1
((SELECT id FROM person WHERE id = 2),
    (SELECT id FROM contact_person WHERE contact_person_phone = '016-628-54-38')),
((SELECT id FROM person WHERE id = 4),
    NULL),
((SELECT id FROM person WHERE id = 5),
    (SELECT id FROM contact_person WHERE contact_person_phone = '047-065-84-96')), --sibling2
((SELECT id FROM person WHERE id = 6),
    (SELECT id FROM contact_person WHERE contact_person_phone = '022-763-26-28')), --sibling1
((SELECT id FROM person WHERE id = 9), 
    (SELECT id FROM contact_person WHERE contact_person_phone = '062-124-54-55')),
((SELECT id FROM person WHERE id = 10),
    (SELECT id FROM contact_person WHERE contact_person_phone = '008-118-80-53')), --sibling3
((SELECT id FROM person WHERE id = 12),
    NULL), 
((SELECT id FROM person WHERE id = 13),
    NULL),
((SELECT id FROM person WHERE id = 14),
    NULL),
((SELECT id FROM person WHERE id = 16), 
    (SELECT id FROM contact_person WHERE contact_person_phone = '047-065-84-96')), --sibling2
((SELECT id FROM person WHERE id = 17), 
    (SELECT id FROM contact_person WHERE contact_person_phone = '047-065-84-96')), --sibling2
((SELECT id FROM person WHERE id = 18),
    (SELECT id FROM contact_person WHERE contact_person_phone = '008-118-80-53')); --sibling3

--connect students to siblings
UPDATE student 
SET family_id = 1
WHERE person_id = 6;

UPDATE student 
SET family_id = 4
WHERE person_id = 16;

UPDATE student 
SET family_id = 4
WHERE person_id = 17;

UPDATE student 
SET family_id = 7
WHERE person_id = 18;


INSERT INTO student_lessons(booking_id, student_id, ensemble_instrument)
VALUES

((SELECT id FROM booking WHERE id = 1),
    (SELECT person_id FROM student WHERE person_id = 1),
    NULL),
((SELECT id FROM booking WHERE id = 2),
    (SELECT person_id FROM student WHERE person_id = 1),
    NULL),

((SELECT id FROM booking WHERE id = 3),
    (SELECT person_id FROM student WHERE person_id = 2),
    NULL),
((SELECT id FROM booking WHERE id = 8),
    (SELECT person_id FROM student WHERE person_id = 2),
    NULL),

((SELECT id FROM booking WHERE id = 2),
    (SELECT person_id FROM student WHERE person_id = 4),
    NULL),
((SELECT id FROM booking WHERE id = 7),
    (SELECT person_id FROM student WHERE person_id = 4),
    NULL),

((SELECT id FROM booking WHERE id = 2),
    (SELECT person_id FROM student WHERE person_id = 5),
    NULL),

((SELECT id FROM booking WHERE id = 1),
    (SELECT person_id FROM student WHERE person_id = 6),
    NULL),
((SELECT id FROM booking WHERE id = 2),
    (SELECT person_id FROM student WHERE person_id = 6),
    NULL),

((SELECT id FROM booking WHERE id = 4),
    (SELECT person_id FROM student WHERE person_id = 9),
    'Guitar'),

((SELECT id FROM booking WHERE id = 4),
    (SELECT person_id FROM student WHERE person_id = 10),
    'Drums'),
((SELECT id FROM booking WHERE id = 6),
    (SELECT person_id FROM student WHERE person_id = 10),
    'Drums'),

((SELECT id FROM booking WHERE id = 4),
    (SELECT person_id FROM student WHERE person_id = 12),
    'Piano'),
((SELECT id FROM booking WHERE id = 6),
    (SELECT person_id FROM student WHERE person_id = 12),
    'Piano'),

((SELECT id FROM booking WHERE id = 4),
    (SELECT person_id FROM student WHERE person_id = 13),
    'Guitar'),
((SELECT id FROM booking WHERE id = 6),
    (SELECT person_id FROM student WHERE person_id = 14),
    'Guitar'),

((SELECT id FROM booking WHERE id = 5),
    (SELECT person_id FROM student WHERE person_id = 14),
    NULL),

((SELECT id FROM booking WHERE id = 9),
    (SELECT person_id FROM student WHERE person_id = 16),
    'Piano'),

((SELECT id FROM booking WHERE id = 9),
    (SELECT person_id FROM student WHERE person_id = 17),
    'Guitar'),

((SELECT id FROM booking WHERE id = 9),
    (SELECT person_id FROM student WHERE person_id = 18),
    'Harp');



INSERT INTO available_instruments(instrument_type, instrument_brand, fee, available)
VALUES

('Flute','Yamaha', 300, CAST(0 AS BIT)),
('Flute','Ibanez', 700, CAST(0 AS BIT)),
('Guitar','Ibanez', 1000, CAST(0 AS BIT)),
('Flute','Ibanez', 1000, CAST(1 AS BIT)),
('Guitar','Ibanez',700, CAST(1 AS BIT)),
('Drums','Roland', 300, CAST(1 AS BIT)),
('Flute','Ibanez', 500, CAST(0 AS BIT)),
('Piano','Roland', 1000, CAST(0 AS BIT)),
('Drums','Ibanez', 500, CAST(1 AS BIT)),
('Flute','Roland', 500, CAST(1 AS BIT));

INSERT INTO renting_instruments(available_instrument_id, student_id, started_renting)
VALUES

((SELECT id FROM available_instruments WHERE id = 1),
    (SELECT id FROM person WHERE phone_number = '021-211-17-72'),
    '2022-03-27'),

((SELECT id FROM available_instruments WHERE id = 2),
    (SELECT id FROM person WHERE phone_number = '068-443-11-61'), 
    '2022-03-16'),

((SELECT id FROM available_instruments WHERE id = 3),
    (SELECT id FROM person WHERE phone_number = '015-697-89-14'),
    '2022-11-23'),

((SELECT id FROM available_instruments WHERE id = 7),
    (SELECT id FROM person WHERE phone_number = '051-531-35-13'),
    '2022-05-30'),

((SELECT id FROM available_instruments WHERE id = 8),
    (SELECT id FROM person WHERE phone_number = '044-418-18-36'),
    '2022-09-14');


    --  Counts number of students with 0, 1 and 2 siblings seperetaly.
        --  SELECT COUNT(*) AS num0sib FROM (SELECT COUNT(*) FROM student GROUP BY family_id HAVING COUNT(*) = 1) AS foo;
        --  SELECT COUNT(*)*2 AS num1sib FROM (SELECT COUNT(*) FROM student GROUP BY family_id HAVING COUNT(*) = 2) AS foo;
        --  SELECT COUNT(*)*3 AS num2sib FROM (SELECT COUNT(*) FROM student GROUP BY family_id HAVING COUNT(*) = 3) AS foo;

-- Counts number of students with 0, 1 and 2 siblings.
    -- SELECT 
    -- (SELECT COUNT(*) FROM (SELECT COUNT(*) FROM student GROUP BY family_id HAVING COUNT(*) = 1) AS foo) AS num0sib, 
    -- (SELECT COUNT(*)*2 FROM (SELECT COUNT(*) FROM student GROUP BY family_id HAVING COUNT(*) = 2) AS poo) AS num1sib,  
    -- (SELECT COUNT(*)*3 FROM (SELECT COUNT(*) FROM student GROUP BY family_id HAVING COUNT(*) = 3) AS moo) AS num2sib;



    --  Total number of lessons per month for year 2022
        -- SELECT EXTRACT(MONTH FROM booking.booking_date) AS month, COUNT(*) AS lessons
        -- FROM booking
        -- WHERE EXTRACT(YEAR FROM booking.booking_date) = '2022' 
        -- GROUP BY month;

    -- Total number of Single lessons per month for year 2022
        -- SELECT EXTRACT(MONTH FROM booking.booking_date) AS month, COUNT(*) AS singlelessons 
        -- FROM booking 
        --      LEFT JOIN group_lesson ON booking.id = group_lesson.booking_id 
        --      LEFT JOIN ensemble ON booking.id = ensemble.group_lesson_id 
        -- WHERE group_lesson_id IS NULL 
        --      AND booking_id IS NULL 
        --      AND EXTRACT(YEAR FROM booking.booking_date) = '2022' 
        -- GROUP BY month;

    -- Total number of Group lessons per month for year 2022
        -- SELECT EXTRACT(MONTH FROM booking.booking_date) AS month, COUNT(*) AS grouplessons 
        -- FROM booking 
        --      LEFT JOIN group_lesson ON booking.id = group_lesson.booking_id 
        --      LEFT JOIN ensemble ON booking.id = ensemble.group_lesson_id 
        -- WHERE group_lesson_id IS NULL 
        --      AND booking_id IS NOT NULL 
        --      AND EXTRACT(YEAR FROM booking.booking_date) = '2022' 
        -- GROUP BY month;

    -- Total number of Ensembles per month for year 2022
        -- SELECT EXTRACT(MONTH FROM booking.booking_date) AS month, COUNT(*) AS ensembles 
        -- FROM booking 
        --      LEFT JOIN group_lesson ON booking.id = group_lesson.booking_id 
        --      LEFT JOIN ensemble ON booking.id = ensemble.group_lesson_id 
        -- WHERE group_lesson_id IS NOT NULL 
        --      AND booking_id IS NOT NULL 
        --      AND EXTRACT(YEAR FROM booking.booking_date) = '2022' 
        -- GROUP BY month;
     
--  Total number of bookings, single lessons, group lessons and ensembles per month for year 2022
    -- SELECT EXTRACT(MONTH FROM booking.booking_date) AS month, 
    --     COUNT(*) AS all_lessons, 
    --     SUM(CASE WHEN group_lesson_id IS NULL AND booking_id IS NULL THEN 1 ELSE 0 END) AS singlelessons, 
    --     SUM(CASE WHEN group_lesson_id IS NULL AND booking_id IS NOT NULL THEN 1 ELSE 0 END) AS grouplessons, 
    --     SUM(CASE WHEN group_lesson_id IS NOT NULL AND booking_id IS NOT NULL THEN 1 ELSE 0 END) AS ensembles
    -- FROM booking
    --     LEFT JOIN group_lesson ON booking.id = group_lesson.booking_id
    --     LEFT JOIN ensemble ON booking.id = ensemble.group_lesson_id
    -- WHERE EXTRACT(YEAR FROM booking.booking_date) = '2022'
    -- GROUP BY month;
