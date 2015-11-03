DROP DATABASE flipped
CREATE DATABASE flipped

CREATE TABLE app_user
(
id UUID PRIMARY KEY,
username varchar(20) NOT NULL UNIQUE,
password varchar(30) NOT NULL,
email varchar(40) NOT NULL UNIQUE,
is_teacher BOOLEAN NOT NULL
);

CREATE TABLE class
(
id UUID PRIMARY KEY,
name varchar(20) NOT NULL,
code varchar(7) NOT NULL,
teacher_id UUID NOT NULL,
FOREIGN KEY (teacher_id) REFERENCES app_user(id)
);

CREATE TABLE app_user_class
(
class_id UUID NOT NULL,
app_user_id UUID NOT NULL,
PRIMARY KEY (class_id, app_user_id),
FOREIGN KEY (app_user_id) REFERENCES app_user(id),
FOREIGN KEY (class_id) REFERENCES class(id)
);

CREATE TABLE lecture
(
id UUID NOT NULL PRIMARY KEY,
name varchar(20) NOT NULL,
class_id UUID NOT NULL,
video_url varchar(100),
date_created timestamp NOT NULL,
FOREIGN KEY (class_id) REFERENCES class(id)
);

CREATE TABLE app_user_lecture
(
id SERIAL PRIMARY KEY,
lecture_id UUID NOT NULL,
app_user_id UUID NOT NULL,
grade int NOT NULL,
date_graded timestamp NOT NULL,
FOREIGN KEY (app_user_id) REFERENCES app_user(id),
FOREIGN KEY (lecture_id) REFERENCES lecture(id)
);

CREATE TYPE problem_types AS ENUM ('mc','fib');
CREATE TABLE problem
(
id int NOT NULL,
lecture_id UUID NOT NULL,
problem_type problem_types,
question varchar(128),
PRIMARY KEY(lecture_id, id),
FOREIGN KEY (lecture_id) REFERENCES lecture(id)
);

CREATE TABLE problem_answer
(
id int PRIMARY KEY,
problem_id int NOT NULL,
lecture_id UUID NOT NULL,
possible_answer varchar(20) NOT NULL,
correct_answer BOOLEAN NOT NULL,
FOREIGN KEY (lecture_id, problem_id) REFERENCES problem(lecture_id,id)
);

CREATE TABLE forum
(
id UUID NOT NULL PRIMARY KEY,
lecture_id UUID NOT NULL,
problem_id int NOT NULL,
app_user_id UUID NOT NULL,
title varchar(50) NOT NULL,
post varchar(500) NOT NULL,
date_created timestamp NOT NULL,
answered boolean NOT NULL,
answer_time int,
FOREIGN KEY (lecture_id, problem_id) REFERENCES problem(lecture_id, id)
);

CREATE TABLE comment
(
id int NOT NULL PRIMARY KEY,
forum_id int NOT NULL,
comment varchar(500) NOT NULL,
date_created timestamp NOT NULL,
answer boolean NOT NULL,
app_user_id UUID NOT NULL,
FOREIGN KEY (app_user_id) REFERENCES app_user(id)
);
