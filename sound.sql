CREATE TYPE "level" AS ENUM ('beginner', 'intermediate', 'advanced');
CREATE TYPE "instrument_type" AS ENUM ('wind', 'string', 'percussion', 'brass', 'keyboard', 'electric', 'vocal', 'woodwind', 'synthesizer', 'folk', 'world', 'electronic', 'other');
CREATE TYPE "lesson_type" AS ENUM ('individual', 'group', 'ensemble');
CREATE TYPE "ensemble_genre" AS ENUM ('jazz ensemble', 'classical orchestra', 'folk group', 'rock band', 'pop ensemble', 'blues group', 'country band', 'world music ensemble', 'hip-hop collective', 'reggae band', 'indie rock ensemble', 'electronic music group', 'experimental ensemble');



CREATE TABLE "instrument" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    "quantity_in_stock" INT,
    "brand" VARCHAR(200),
    "type_id" "instrument_type" NOT NULL 
);


CREATE TABLE "person" (
   "person_id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   "first_name" VARCHAR(300) NOT NULL,
    "last_name" VARCHAR(300) NOT NULL,
   "person_number" VARCHAR(12) UNIQUE NOT NULL,
   "zipcode" VARCHAR(5) NOT NULL,
   "street" VARCHAR(100) NOT NULL,
   "city" VARCHAR(50) NOT NULL
);



CREATE TABLE "phone" (
   "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
   "phone_number" VARCHAR(200) UNIQUE
);


CREATE TABLE "student" (
   "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
   "person_id" INT NOT NULL REFERENCES "person" ON DELETE CASCADE,
   "student_id" VARCHAR(10) UNIQUE NOT NULL,
   "present_skill" VARCHAR(100) NOT NULL
);

CREATE TABLE "contact_person" (
   "student_id" INT NOT NULL REFERENCES "student" ON DELETE CASCADE,
   "name" VARCHAR(255) NOT NULL,
   "relation" VARCHAR(500) NOT NULL,
   "phone" VARCHAR(100)
);


CREATE TABLE "discount" (
    "student_id" INT NOT NULL REFERENCES "student" ON DELETE CASCADE,
    "siblings_id" VARCHAR(10),
    "discount_percentage" DECIMAL(10)
);


CREATE TABLE "instructor" (
   "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
   "person_id" INT NOT NULL REFERENCES "person" ON DELETE CASCADE,
   "employment_id" VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE "instructor_instrument" (
   "instructor_id" INT NOT NULL REFERENCES "instructor",
   "instrument_id" INT NOT NULL REFERENCES "instrument",
   PRIMARY KEY ("instructor_id", "instrument_id")
);


CREATE TABLE "person_phone" (
   "phone_id" INT NOT NULL REFERENCES "phone",
   "person_id" INT NOT NULL REFERENCES "person" ON DELETE CASCADE,
   PRIMARY KEY("phone_id","person_id")
);


CREATE TABLE "rental" (
    "student_id" INT NOT NULL REFERENCES "student" ON DELETE CASCADE,
    "start_of_rental" TIMESTAMP(6) NOT NULL,
    "end_of_rental" TIMESTAMP(6) NOT NULL,
    "price" FLOAT(20) NOT NULL
);


CREATE TABLE "rented_instrument" (
   "student_id" INT NOT NULL REFERENCES "student" ON DELETE CASCADE,
   "instrument_id" INT NOT NULL REFERENCES "instrument",
   PRIMARY KEY("student_id", "instrument_id")
);


CREATE TABLE "schedule" (
   "schedule_id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
   "instructor_id" INT NOT NULL REFERENCES "instructor",
   "student_id" INT NOT NULL REFERENCES "student",
   "start_time" TIMESTAMP(6),
   "end_time" TIMESTAMP(6)
);


CREATE TABLE "lesson" (
   "lesson_id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
   "description" VARCHAR(2000) NOT NULL,
   "schedule_id" INT NOT NULL REFERENCES "schedule" ON DELETE CASCADE
);



CREATE TABLE "pricing_scheme" (
    "price_id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    "lesson_id" INT NOT NULL REFERENCES "lesson",
    "price" FLOAT(20),
    "lesson_level" "level" NOT NULL,
    "lesson_type" "lesson_type" NOT NULL  
);





CREATE TABLE "ensembles" (
   "lesson_id" INT NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
    "minimum_nr_of_students" INT NOT NULL,
    "maximum_nr_of_students" INT NOT NULL,
    "ensemble_genre" "ensemble_genre" NOT NULL 
);



CREATE TABLE "group_lesson" (
    "lesson_id" INT NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
    "lesson_level" "level" NOT NULL,
    "minimum_nr_of_students" INT NOT NULL,
    "maximum_nr_of_students" INT NOT NULL,
    "instrument" VARCHAR(100)
);


CREATE TABLE "individual_lesson" (
    "lesson_id" INT NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
    "instrument" VARCHAR(100),
    "lesson_level" "level" NOT NULL  
);
