
-- Insert data into "person" table
INSERT INTO "person" ("first_name", "last_name", "person_number", "zipcode", "street", "city") VALUES
('John', 'Doe', '1234567890', '12345', 'Main St', 'New York'),
('Jane', 'Smith', '0987654321', '54321', 'Broadway', 'Los Angeles'),
('Bob', 'Johnson', '1112223334', '67890', 'Oak St', 'Chicago'),
('Alice', 'Williams', '5556667778', '45678', 'Maple St', 'Houston'),
('Charlie', 'Davis', '9998887776', '98765', 'Pine St', 'Phoenix'),
('Eva', 'Anderson', '4443332221', '23456', 'Cedar St', 'Philadelphia'),
('Michael', 'Taylor', '7776665554', '87654', 'Elm St', 'San Antonio'),
('Sophia', 'Brown', '2223334445', '76543', 'Spruce St', 'San Diego'),
('David', 'Lee', '8887776667', '34567', 'Cypress St', 'Dallas'),
('Olivia', 'Moore', '3334445556', '65432', 'Cherry St', 'San Jose');

-- Insert data into the "student" table
INSERT INTO "student" ("person_id", "student_id", "present_skill")
VALUES 
    (1, 'S123456', 'Intermediate'),
    (2, 'S789012', 'Advanced'),
    (3, 'S345678', 'Beginner'),
    (4, 'S987654', 'Intermediate'),
    (5, 'S543210', 'Advanced');

-- Insert data into the "instrument" table
INSERT INTO "instrument" ("quantity_in_stock", "brand", "type_id")
VALUES 
    (10, 'Yamaha', 'wind'),
    (5, 'Fender', 'string'),
    (8, 'Pearl', 'percussion'),
    (3, 'Selmer', 'woodwind');

--- Insert data into "contact_person" table
INSERT INTO "contact_person" ("student_id", "name", "relation", "phone") VALUES
(1, 'Mary Doe', 'Parent', '111-111-1111'),
(2, 'Robert Smith', 'Guardian', '222-222-2222'),
(3, 'Laura Johnson', 'Sibling', '333-333-3333'),
(4, 'Mark Williams', 'Parent', '444-444-4444'),
(5, 'Susan Davis', 'Parent', '555-555-5555');

-- Insert data into "discount" table
INSERT INTO "discount" ("student_id", "siblings_id", "discount_percentage") VALUES
(1, 'S123456', 15),
(2, 'S789012', 15),
(3, 'S345678', 15),
(4, NULL, 0),
(5, NULL, 0);

-- Insert data into "phone" table
INSERT INTO "phone" ("phone_number") VALUES
('123-456-7890'),
('987-654-3210'),
('111-222-3334'),
('555-666-7778'),
('999-888-7776');
-- Insert data into the "instructor" table
INSERT INTO "instructor" ("person_id", "employment_id")
VALUES 
    (6, 'EMP123'),
    (7, 'EMP456'),
    (8, 'EMP789'),
    (9, 'EMP101'),
    (10, 'EMP112');

INSERT INTO "instructor_instrument" ("instructor_id", "instrument_id")
VALUES
    (1, 1), 
    (2, 2), 
    (3, 3), 
    (4, 4), 
    (5, 1); 


-- Insert data into the "person_phone" table
INSERT INTO "person_phone" ("phone_id", "person_id")
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert data into the "rental" table
INSERT INTO "rental" ("student_id", "start_of_rental", "end_of_rental", "price")
VALUES 
    (1, '2023-01-01', '2023-01-31', 50.00),
    (2, '2023-02-01', '2023-02-28', 60.00),
    (3, '2023-03-01', '2023-03-31', 45.00),
    (4, '2023-04-01', '2023-04-30', 55.00),
    (5, '2023-05-01', '2023-05-31', 65.00);

INSERT INTO "rented_instrument" ("student_id", "instrument_id")
VALUES
    (1, 1), 
    (2, 2), 
    (3, 3), 
    (4, 4),
    (5, 1); 

-- Insert data into the "schedule" table
INSERT INTO "schedule" ("instructor_id", "student_id", "start_time", "end_time")
VALUES
    (1, 1, '2023-01-01 10:00:00', '2023-01-01 11:00:00'),
    (2, 2, '2023-02-01 12:00:00', '2023-02-01 13:00:00'),
    (3, 3, '2023-03-01 14:00:00', '2023-03-01 15:00:00'),
    (4, 4, '2023-04-01 16:00:00', '2023-04-01 17:00:00'),
    (5, 5, '2023-05-01 18:00:00', '2023-05-01 19:00:00'),
    -- Add more rows as needed
    (1, 1, '2023-01-02 10:00:00', '2023-01-02 11:00:00'),
    (2, 2, '2023-02-02 12:00:00', '2023-02-02 13:00:00'),
    (3, 3, '2023-03-02 14:00:00', '2023-03-02 15:00:00'),
    (4, 4, '2023-04-02 16:00:00', '2023-04-02 17:00:00'),
    (5, 5, '2023-05-02 18:00:00', '2023-05-02 19:00:00'),
    -- Add more rows as needed
    (1, 1, '2023-01-03 10:00:00', '2023-01-03 11:00:00'),
    (2, 2, '2023-02-03 12:00:00', '2023-02-03 13:00:00'),
    (3, 3, '2023-03-03 14:00:00', '2023-03-03 15:00:00'),
    (4, 4, '2023-04-03 16:00:00', '2023-04-03 17:00:00'),
    (5, 5, '2023-05-03 18:00:00', '2023-05-03 19:00:00');

-- Insert data into the "lesson" table
INSERT INTO "lesson" ("description", "schedule_id")
VALUES
    ('Lesson 1 - Classroom A', 6),
    ('Lesson 2 - Classroom B', 7),
    ('Lesson 3 - Classroom C', 8),
    ('Lesson 4 - Classroom D', 9),
    ('Lesson 5 - Classroom E', 10),
    ('Lesson 1 - Classroom A', 16),
    ('Lesson 2 - Classroom B', 17),
    ('Lesson 3 - Classroom C', 18),
    ('Lesson 4 - Classroom D', 19),
    ('Lesson 5 - Classroom E', 20),
    ('Lesson 1 - Classroom A', 21),
    ('Lesson 2 - Classroom B', 22),
    ('Lesson 3 - Classroom C', 23),
    ('Lesson 4 - Classroom D', 24),
    ('Lesson 5 - Classroom E', 25),
    ('Lesson 1 - Classroom A', 26),
    ('Lesson 2 - Classroom B', 27),
    ('Lesson 3 - Classroom C', 28),
    ('Lesson 4 - Classroom D', 29),
    ('Lesson 5 - Classroom E', 30);

-- Insert data into the "pricing_scheme" table
INSERT INTO "pricing_scheme" ("lesson_id", "price", "lesson_level", "lesson_type")
VALUES
    (36, 30.00, 'beginner', 'individual'),
    (37, 40.00, 'intermediate', 'group'),
    (38, 25.00, 'beginner', 'individual'),
    (39, 35.00, 'intermediate', 'group'),
    (40, 45.00, 'advanced', 'ensemble'),
    (41, 30.00, 'beginner', 'individual'),
    (42, 40.00, 'intermediate', 'group'),
    (43, 25.00, 'beginner', 'individual'),
    (44, 35.00, 'intermediate', 'group'),
    (45, 45.00, 'advanced', 'ensemble'),
    (46, 30.00, 'beginner', 'individual'),
    (47, 40.00, 'intermediate', 'group'),
    (48, 25.00, 'beginner', 'individual'),
    (49, 35.00, 'intermediate', 'group'),
    (50, 45.00, 'advanced', 'ensemble'),
    (51, 30.00, 'beginner', 'individual'),
    (52, 40.00, 'intermediate', 'group'),
    (53, 25.00, 'beginner', 'individual'),
    (54, 35.00, 'intermediate', 'group'),
    (55, 45.00, 'advanced', 'ensemble');


INSERT INTO "ensembles" ("lesson_id", "minimum_nr_of_students", "maximum_nr_of_students", "ensemble_genre")
VALUES
    (40, 5, 15, 'jazz ensemble'),
    (41, 3, 10, 'rock band'),
    (42, 2, 8, 'folk group'),
    (43, 4, 12, 'classical orchestra'),
    (44, 6, 18, 'pop ensemble'),
    (45, 5, 15, 'jazz ensemble');

-- Insert data into the "group_lesson" table
INSERT INTO "group_lesson" ("lesson_id", "lesson_level", "minimum_nr_of_students", "maximum_nr_of_students", "instrument")
VALUES
    (46, 'advanced', 6, 12, 'bass'),
    (47, 'intermediate', 3, 6, 'guitar'),
    (48, 'advanced', 5, 8, 'drums'),
    (49, 'beginner', 2, 5, 'violin'),
    (50, 'intermediate', 4, 10, 'flute');
    
-- Insert data into the "individual_lesson" table
INSERT INTO "individual_lesson" ("lesson_id", "instrument", "lesson_level")
VALUES
    (51, 'piano', 'beginner'),
    (52, 'guitar', 'intermediate'),
    (53, 'saxophone', 'advanced'),
    (54, 'piano', 'beginner'),
    (55, 'drums', 'intermediate');