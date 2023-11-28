-- Insert fake data into the person table
INSERT INTO person (first_name, last_name, person_number, street, zipcode, city)
VALUES
  ('Colby', 'Caldwell', 195683306120, '462-2438 Nulla. Road', '54427', 'Boston'),
  ('Lysandra', 'Oliver', 194932131156, 'Ap #597-8708 Ligula. Rd.', '33436', 'Hartford'),
  ('Hunter', 'Goodman', 192250765503, 'P.O. Box 677, 6501 Vitae Av.', '37463', 'Pike Creek'),
  ('Marvin', 'Cash', 195750920971, 'P.O. Box 354, 1714 Augue Ave', '94366', 'Baltimore'),
  ('Nathaniel', 'Goodwin', 199511029484, 'Ap #125-789 In Av.', '48868', 'Waterbury'),
  ('Ethan', 'Fitzpatrick', 197805174001, '304-9950 Sollicitudin Street', '47666', 'Hillsboro'),
  ('Noah', 'Tillman', 192982578269, '483-3216 Vel, Rd.', '99968', 'Gary'),
  ('Perry', 'Richard', 199869870132, 'Ap #756-9098 Imperdiet Avenue', '22273', 'Butte'),
  ('Samuel', 'Haney', 191987473648, '6376 Eu Street', '29748', 'Richmond'),
  ('Amanda', 'Garrison', 195956942364, '429-1258 Non, Road', '83168', 'Austin');

-- Insert fake data into the student table
INSERT INTO student (person_id, student_id, present_skill)
VALUES
(200303021223, 1231, 'beginner'),
(200011240101, 2343, 'advanced'),
(201010101011, 3453, 'intermediate'),
(199911211912, 2332, 'beginner'),
(201011110101, 3454, 'intermediate'),
(200303022123, 1232, 'advanced'),
(200011240102, 2344, 'beginner');

-- Insert fake data into the instructor table
INSERT INTO instructor (person_id, employment_id)
VALUES
(195683306120, 1112),
(194932131156, 2123),
(192250765503, 3543),
(195750920971, 4567),
(199511029484, 5678),
(197805174001, 6789),
(192982578269, 7890),
(192982578269, 8901),
(191987473648, 9012);

-- Insert fake data into the instrument table
INSERT INTO instrument (quantity_in_stock, type_id, brand)
VALUES
(10, 1, 'Violin'),
(5, 2, 'Cello'),
(3, 3, 'Trumpet'),
(10, 4, 'Guitar'),
(10, 5, 'Flute'),
(10, 6, 'Trombone'),
(10, 7, 'Piano'),
(10, 8, 'Viola'),
(10, 9, 'Clarinet'),
(10, 10, 'Double Bass');

-- Insert fake data into the instructor_instrument table
INSERT INTO instructor_instrument (instructor_id, instrument_id)
VALUES
(1112, 1),
(2123, 2),
(3543, 3),
(4567, 4),
(5678, 5),
(6789, 6),
(7890, 7),
(8901, 8);

-- Insert fake data into the rented_instrument table
INSERT INTO rented_instrument (student_id, instrument_id)
VALUES
(1231, 1),
(2343, 2),
(3453, 3),
(1232, 4),
(2344, 5),
(3454, 6),
(1231, 7),
(2343, 8);

-- Insert fake data into the rental table
INSERT INTO rental (student_id, start_of_rental, end_of_rental, price)
VALUES
('2017-01-01 00:00:00', '2017-01-21 13:15:32', 12),
('2021-04-06 22:25:50', '2022-04-06 22:25:50', 343),
('2021-04-04 20:18:19', '2022-04-04 20:18:19', 321),
('2021-08-25 04:19:15', '2022-08-25 04:19:15', 421);

-- Insert fake data into the contact_person table
INSERT INTO contact_person (student_id, name, relation, phone)
VALUES
(1231, 'John Doe', 'Mother', '+4917123456789'),
(2343, 'Jane Doe', 'Father', '+4917213123912'),
(3453, 'Jack Smith', 'Brother', '+4917312345678'),
(1232, 'Jill Johnson', 'Sister', '+491748888888');

-- Insert fake data into the discount table
INSERT INTO discount (student_id, siblings_id, discount_percentage)
VALUES
(1231, NULL, NULL),
(2343, NULL, NULL),
(3453, NULL, NULL),
(1232, 2121, 15);

-- Insert fake data into the phone table
INSERT INTO phone (phone_number)
VALUES ('+4917123456789'),
       ('+4917213123912'),
       ('+4917312345678'),
       ('+491748888888');

-- Insert fake data into the person_phone table
INSERT INTO person_phone (phone_id, person_id)
VALUES 
(1, 1231),
(2, 2343),
(3, 3453),
(4, 1232);

-- Insert fake data into the schedule table
INSERT INTO schedule (instructor_id, student_id, start_time, end_time)
VALUES
(1232, 1111, '2023-11-22 09:00:00', '2023-11-22 10:30:00'),
(2122, 2222, '2023-11-22 11:15:00', '2023-11-22 12:45:00'),
(1212, 2111, '2023-11-22 14:30:00', '2023-11-22 16:00:00'),
(2223, 2211, '2023-11-22 17:45:00', '2023-11-22 19:15:00'),
(4343, 4332, '2023-11-22 20:30:00', '2023-11-22 22:00:00');

-- Insert fake data into the lesson table
INSERT INTO lesson (description, schedule_id)
VALUES
('The lesson take place in school classroom 310', 12),
('The lesson take place in school classroom 311', 21),
('The lesson take place in school classroom 312', 32),
('The lesson take place in school classroom 313', 43);

-- Insert fake data into the pricing_scheme table
INSERT INTO pricing_scheme (lesson_id, price)
VALUES
(12, 10.00),
(21, 15.00),
(32, 20.00),
(43, 15.00);

-- Insert fake data into the ensembles table
INSERT INTO ensembles (lesson_id, minimum_nr_of_students, maximum_nr_of_students, ensemble_genre)
VALUES
(33, 5, 10, 'rock'),
(34, 5, 10, 'pop'),
(35, 5, 10, 'jazz'),
(36, 5, 10, 'classical');

-- Insert fake data into the group_lesson table
INSERT INTO group_lesson (lesson_id, lesson_level, minimum_nr_of_students, maximum_nr_of_students, instrument)
VALUES
(12, 'beginner', 5, 10, 'piano'),
(21, 'intermediate', 5, 10, 'guitar'),
(32, 'advanced', 5, 10, 'violin'),
(43, 'beginner', 5, 10, 'trumpet'),
(33, 'beginner', 5, 10, 'piano'),
(34, 'beginner', 5, 10, 'guitar'),
(35, 'beginner', 5, 10, 'jazz');

-- Insert fake data into the individual_lesson table
INSERT INTO individual_lesson (lesson_id, instrument, level_id)
VALUES
(12, 'piano', 1),
(21, 'guitar', 2),
(32, 'violin', 3),
(43, 'trumpet', 1),
(33, 'piano', 1),
(34, 'guitar', 1),
(35, 'jazz', 1);


INSERT INTO student_fee (student_id, fee_date, amount, bank_info, status, schedule_id)
VALUES
(1231, '2023-11-22 09:00:00', 50.00, 'Bank A', 'Paid', 12),
(2343, '2023-11-22 11:15:00', 75.00, 'Bank B', 'Pending', 21),
(3453, '2023-11-22 14:30:00', 100.00, 'Bank C', 'Paid', 32),
(1232, '2023-11-22 17:45:00', 60.00, 'Bank D', 'Pending', 43),
(2344, '2023-11-22 20:30:00', 80.00, 'Bank E', 'Paid', 33);

-- Insert fake data into the instructor_payment table
INSERT INTO instructor_payment (instructor_id, payment_date, amount, bank_info, schedule_id)
VALUES
(1112, '2023-11-22 09:00:00', 70.00, 'Bank F', 12),
(2122, '2023-11-22 11:15:00', 90.00, 'Bank G', 21),
(1212, '2023-11-22 14:30:00', 120.00, 'Bank H', 32),
(2223, '2023-11-22 17:45:00', 80.00, 'Bank I', 43),
(4343, '2023-11-22 20:30:00', 100.00, 'Bank J', 33);
