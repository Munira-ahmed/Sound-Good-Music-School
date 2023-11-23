-- Tables without dependencies
CREATE TABLE "instrument" (
 "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 "quantity_in_stock" int,
 "type" VARCHAR(200) NOT NULL,
 "brand" VARCHAR(200)
);

CREATE TABLE "person" (
 "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 "name" VARCHAR(300) NOT NULL,
 "person_number" VARCHAR(12) UNIQUE NOT NULL,
 "zipcode" VARCHAR(5) NOT NULL,
 "street" VARCHAR(100) NOT NULL,
 "city" VARCHAR(50) NOT NULL
);

CREATE TABLE "phone" (
 "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 "phone_number" VARCHAR(200) UNIQUE
);

-- Tables dependent on person
CREATE TABLE "student" (
 "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 "student_id" VARCHAR(10) UNIQUE NOT NULL,
 "present_skill" VARCHAR(100) NOT NULL
);

CREATE TABLE "instructor" (
 "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 "employment_id" VARCHAR(20) UNIQUE NOT NULL
);

-- Tables dependent on student
CREATE TABLE "contact_person" (
 "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 "name" VARCHAR(255) NOT NULL,
 "relation" VARCHAR(500) NOT NULL,
 "phone" VARCHAR(100)
);

CREATE TABLE "discount" (
 "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 "siblings_id" VARCHAR(10),
 "discount_procentage" DECIMAL(10)
);

CREATE TABLE "rental" (
 "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 "start_of_rental" TIMESTAMP(6) NOT NULL,
 "end_of_rental" TIMESTAMP(6) NOT NULL,
 "price" FLOAT(20) NOT NULL
);


-- Tables dependent on student and instructor
CREATE TABLE "schedule" (
 "schedule_id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 "instructor_id" int NOT NULL REFERENCES "instructor",
 "student_id" int NOT NULL REFERENCES "student",
 "start_time" TIMESTAMP(6),
 "end_time" TIMESTAMP(6)
);

-- Tables dependent on schedule
CREATE TABLE "lesson" (
 "lesson_id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 "description" VARCHAR(2000) NOT NULL,
 "schedule_id" int NOT NULL REFERENCES "schedule" ON DELETE CASCADE
);

-- Tables dependent on lesson
CREATE TABLE "pricing_Scheme" (
 "price_id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 "lessontype" VARCHAR(100),
 "lessonlevel" VARCHAR(100),
 "lesson_id" int NOT NULL REFERENCES "lesson",
 "price" FLOAT(20) NOT NULL
);

CREATE TABLE "ensembles" (
 "lesson_id" INT NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
 "minimum_nr_of_students" int NOT NULL,
 "maximum_nr_of_students" int NOT NULL,
 "genre" VARCHAR(100) NOT NULL
);

CREATE TABLE "group_lesson" (
 "lesson_id" INT NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
 "level" VARCHAR(100) NOT NULL,
 "minimum_nr_of_students" int NOT NULL,
 "maximum_nr_of_students" int NOT NULL,
 "instrument" VARCHAR(100)
);

CREATE TABLE "individual_lesson" (
 "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
 "level" VARCHAR(100) NOT NULL,
 "instrument" VARCHAR(100)
);

-- Tables dependent on instructor
CREATE TABLE "instructor_instrument" (
 "instructor_id" int NOT NULL REFERENCES "instructor",
 "instrument_id" int NOT NULL REFERENCES "instrument",
 PRIMARY KEY("instructor_id", "instrument_id")
);

-- Tables dependent on phone and person
CREATE TABLE "person_phone" (
 "phone_id" int NOT NULL REFERENCES "phone",
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 PRIMARY KEY("phone_id", "person_id")
);

-- Tables dependent on student and instrument
CREATE TABLE "rentedinstruments" (
 "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 "instrument_id" int NOT NULL REFERENCES "instrument",
 PRIMARY KEY("student_id","instrument_id")
);