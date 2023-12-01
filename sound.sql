CREATE TYPE level AS ENUM ('beginner', 'intermediate', 'advanced');
CREATE TYPE instrument_type AS ENUM ('wind', 'string', 'percussion', 'brass', 'keyboard', 'electric', 'vocal', 'woodwind', 'synthesizer', 'folk', 'world', 'electronic', 'other');
CREATE TYPE lesson_type AS ENUM ('individual', 'group', 'ensemble');
CREATE TYPE ensemble_genre AS ENUM ('jazz ensemble', 'classical orchestra', 'folk group', 'rock band', 'pop ensemble', 'blues group', 'country band', 'world music ensemble', 'hip-hop collective', 'reggae band', 'indie rock ensemble', 'electronic music group', 'experimental ensemble');


CREATE TABLE classroom (
 classroom_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
 zip VARCHAR(20),
 street VARCHAR(20),
 city VARCHAR(20),
 seeting_capacity INT
);



CREATE TABLE instrument (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
 brand VARCHAR(200),
 instrument_type instrument_type, 
 price FLOAT(10)
);


CREATE TABLE rented_instrument (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    instrument_id INT NOT NULL,
    FOREIGN KEY (instrument_id) REFERENCES instrument (id)
);

CREATE TABLE instrument_rental (
    rental_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    rented_instrument_id INT NOT NULL UNIQUE,
    student_id INT NOT NULL,
    start_of_rental TIMESTAMP(6) NOT NULL,
    end_of_rental TIMESTAMP(6) NOT NULL,
    FOREIGN KEY (rented_instrument_id) REFERENCES rented_instrument (id),
    FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE
);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY  NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 person_number VARCHAR(12) NOT NULL UNIQUE,
 zipcode VARCHAR(5) NOT NULL,
 street VARCHAR(100) NOT NULL,
 city VARCHAR(50) NOT NULL
);



CREATE TABLE phone (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
 phone_number VARCHAR(200) UNIQUE
);



CREATE TABLE pricing_Scheme (
 price_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
 price FLOAT(20),
 lesson_level level,
 lesson_type lesson_type
);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
 person_id INT NOT NULL,
 present_skill level NOT NULL,
 siblings_id VARCHAR(10),
 FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE
);


CREATE TABLE contact_person (
 contact_person_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
 relation VARCHAR(500) NOT NULL,
 person_id INT NOT NULL,
 student_id INT NOT NULL,
 FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE
);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
 person_id INT NOT NULL,
 teaches_ensemble BOOLEAN,
 FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE
);


CREATE TABLE instructor_instrument (
 instructor_id INT NOT NULL,
 instrument_id INT NOT NULL,
 PRIMARY KEY(instructor_id,instrument_id),
 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE SET NULL,
 FOREIGN KEY (instrument_id) REFERENCES instrument (id) 

);




CREATE TABLE lesson (
 lesson_id  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
 price_id INT NOT NULL,
 start_time TIMESTAMP(6),
 end_time TIMESTAMP(6),
 instructor_id INT NOT NULL,
 classroom_id INT NOT NULL,
 FOREIGN KEY (price_id) REFERENCES pricing_Scheme (price_id) ON DELETE SET NULL,
 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE SET NULL,
 FOREIGN KEY (classroom_id) REFERENCES classroom (classroom_id) ON DELETE SET NULL

);



CREATE TABLE person_phone (
 phone_id INT NOT NULL,
 person_id INT NOT NULL,
 PRIMARY KEY (phone_id,person_id),
 FOREIGN KEY (phone_id) REFERENCES phone (id),
 FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE
);


CREATE TABLE student_lessons (
 student_id INT NOT NULL,
 lesson_id  INT NOT NULL,
 PRIMARY KEY(student_id, lesson_id),
 FOREIGN KEY (student_id) REFERENCES student (id)ON DELETE SET NULL,
 FOREIGN KEY (lesson_id ) REFERENCES lesson (lesson_id )
);



CREATE TABLE ensembles (
 lesson_id  INT NOT NULL,
 minimum_nr_of_stundents INT NOT NULL,
 maximum_nr_of_students INT NOT NULL,
 ensamble_genre ensemble_genre NOT NULL,
 FOREIGN KEY (lesson_id ) REFERENCES lesson (lesson_id ) ON DELETE CASCADE
);



CREATE TABLE group_lesson (
 lesson_id  INT NOT NULL,
 lesson_level level NOT NULL,
 minimum_nr_of_stundents INT NOT NULL,
 maximum_nr_of_students INT NOT NULL,
 instrument VARCHAR(100),
 FOREIGN KEY (lesson_id ) REFERENCES lesson (lesson_id ) ON DELETE CASCADE

);

CREATE TABLE individual_lesson (
 lesson_id  INT NOT NULL,
 instrument VARCHAR(100),
 lesson_level level,
 FOREIGN KEY (lesson_id ) REFERENCES lesson (lesson_id ) ON DELETE CASCADE
);



