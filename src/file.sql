CREATE TABLE students (
                          student_id SERIAL PRIMARY KEY,
                          first_name VARCHAR(50) NOT NULL,
                          last_name VARCHAR(50) NOT NULL,
                          birth_date DATE,
                          email VARCHAR(100) UNIQUE
);

CREATE TABLE courses (
                         course_id SERIAL PRIMARY KEY,
                         course_name VARCHAR(100) NOT NULL,
                         description TEXT,
                         start_date DATE,
                         end_date DATE
);

CREATE TABLE enrollments (
                             enrollment_id SERIAL PRIMARY KEY,
                             student_id INT REFERENCES students(student_id),
                             course_id INT REFERENCES courses(course_id),
                             enrollment_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE teachers (
                          teacher_id SERIAL PRIMARY KEY,
                          first_name VARCHAR(50),
                          last_name VARCHAR(50),
                          hire_date DATE
);

CREATE TABLE subjects (
                          subject_id SERIAL PRIMARY KEY,
                          subject_name VARCHAR(100) UNIQUE,
                          credits INT CHECK (credits > 0)
);

CREATE TABLE departments (
                             department_id SERIAL PRIMARY KEY,
                             department_name VARCHAR(100) UNIQUE
);

CREATE TABLE rooms (
                       room_id SERIAL PRIMARY KEY,
                       room_number VARCHAR(20) UNIQUE,
                       capacity INT CHECK (capacity > 0)
);

CREATE TABLE schedules (
                           schedule_id SERIAL PRIMARY KEY,
                           course_id INT REFERENCES courses(course_id),
                           teacher_id INT REFERENCES teachers(teacher_id),
                           room_id INT REFERENCES rooms(room_id),
                           schedule_date DATE
);

CREATE TABLE exams (
                       exam_id SERIAL PRIMARY KEY,
                       course_id INT REFERENCES courses(course_id),
                       exam_date DATE,
                       duration INT CHECK (duration > 0)
);

CREATE TABLE grades (
                        grade_id SERIAL PRIMARY KEY,
                        student_id INT REFERENCES students(student_id),
                        course_id INT REFERENCES courses(course_id),
                        grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'F'))
);

CREATE TABLE library (
                         book_id SERIAL PRIMARY KEY,
                         title VARCHAR(100) NOT NULL,
                         author VARCHAR(100),
                         isbn VARCHAR(20) UNIQUE
);

CREATE TABLE borrows (
                         borrow_id SERIAL PRIMARY KEY,
                         student_id INT REFERENCES students(student_id),
                         book_id INT REFERENCES library(book_id),
                         borrow_date DATE,
                         return_date DATE
);

CREATE TABLE clubs (
                       club_id SERIAL PRIMARY KEY,
                       club_name VARCHAR(100) UNIQUE,
                       description TEXT
);

CREATE TABLE memberships (
                             membership_id SERIAL PRIMARY KEY,
                             student_id INT REFERENCES students(student_id),
                             club_id INT REFERENCES clubs(club_id),
                             join_date DATE
);

CREATE TABLE events (
                        event_id SERIAL PRIMARY KEY,
                        event_name VARCHAR(100) NOT NULL,
                        event_date DATE,
                        location VARCHAR(100)
);