CREATE TYPE GRADE AS ENUM ('Beginner', 'Intermediate', 'Advanced');
CREATE TABLE booking (
 id SERIAL INT NOT NULL,
 locale VARCHAR(100) NOT NULL,
 booking_date DATE NOT NULL,
 start_time TIME(0) NOT NULL,
 end_time TIME(0) NOT NULL,
 difficulty ENUM NOT NULL,
 instrument VARCHAR(50),
 available_positions INT NOT NULL,
 min_students INT NOT NULL,
 genre VARCHAR(50),
 lesson_price INT NOT NULL,
 sibling_discount DECIMAL(2) NOT NULL
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (id);


CREATE TABLE student (
 id VARCHAR(50) NOT NULL,
 family_id SERIAL INT NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 phone_number  VARCHAR(12) NOT NULL,
 email VARCHAR(100) NOT NULL,
 person_number  UNIQUE VARCHAR(12) NOT NULL,
 street VARCHAR(100) NOT NULL,
 zip VARCHAR(5) NOT NULL,
 city VARCHAR(100) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_lessons (
 booking_id INT NOT NULL,
 student_id INT NOT NULL,
 ensemble_instrument VARCHAR(50)
);

ALTER TABLE student_lessons ADD CONSTRAINT PK_student_lessons PRIMARY KEY (booking_id,student_id);


ALTER TABLE student_lessons ADD CONSTRAINT FK_student_lessons_0 FOREIGN KEY (booking_id) REFERENCES booking (id) ON DELETE CASCADE;
ALTER TABLE student_lessons ADD CONSTRAINT FK_student_lessons_1 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;


