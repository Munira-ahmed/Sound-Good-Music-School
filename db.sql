INSERT INTO person (name,person_number,street,zipcode,city)
VALUES
  ('Colby Caldwell',195683306120,'462-2438 Nulla. Road','54427','Boston'),
  ('Lysandra Oliver',194932131156,'Ap #597-8708 Ligula. Rd.','33436','Hartford'),
  ('Hunter Goodman',192250765503,'P.O. Box 677, 6501 Vitae Av.','37463','Pike Creek'),
  ('Marvin Cash',195750920971,'P.O. Box 354, 1714 Augue Ave','94366','Baltimore'),
  ('Nathaniel Goodwin',199511029484,'Ap #125-789 In Av.','48868','Waterbury'),
  ('Ethan Fitzpatrick',197805174001,'304-9950 Sollicitudin Street','47666','Hillsboro'),
  ('Noah Tillman',192982578269,'483-3216 Vel, Rd.','99968','Gary'),
  ('Perry Richard',199869870132,'Ap #756-9098 Imperdiet Avenue','22273','Butte'),
  ('Samuel Haney',191987473648,'6376 Eu Street','29748','Richmond'),
  ('Amanda Garrison',195956942364,'429-1258 Non, Road','83168','Austin');


INSERT INTO student (person_id,student_id,present_skill)
VALUES
(200303021223,1231,'beginner'),
(200011240101,2343,'advanced'),
(201010101011,3453,'intermediate'),
(199911211912,2332,'beginner'),
(201011110101,3454,'intermediate'),
(200303022123,1232,'advanced'),
(200011240102,2344,'beginner'),

INSERT INTO instructor (person_id,employment_id)
VALUES
(195683306120,1112),
(194932131156,2123),
(192250765503,3543),
(195750920971,4567),
(199511029484,5678),
(197805174001,6789),
(192982578269,7890),
(192982578269,8901),
(191987473648,9012);

INSERT INTO instrument(quantity_in_stock,type,brand)
VALUES
(10,'Violin','Yamaha'),
(5,'Cello','Fender'),
(3,'Trumpet','Schick'),
(10,'Guitar','Gibson'),
(10,'Flute','Roland'),
(10,'Trombone','Schoenherr'),
(10,'Piano','Kawai'),
(10,'Viola','Yamaha'),
(10,'Clarinet','Bell'),
(10,'Double Bass','Fender');

INSERT INTO instructor_instrument (instructor_id,instrument_id)
VALUES
(1112,1),
(2123,2),
(3543,3),
(4567,4),
(5678,5),
(6789,6),
(7890,7),
(8901,8);

INSERT rentedinstruments (student_id,instrument_id)
VALUES
(1231,1),
(2343,2),
(3453,3),
(1232,4),
(2344,5),
(3454,6),
(1231,7),
(2343,8);

INSERT INTO rental (start_of_rental,end_of_rental,price)
VALUES
('2017-01-01 00:00:00', '2017-01-21 13:15:32', 12),
('2021-04-06 22:25:50','2022-04-06 22:25:50',343),
('2021-04-04 20:18:19','2022-04-04 20:18:19',321),
('2021-08-25 04:19:15','2022-08-25 04:19:15',421);

INSERT INTO contact_person (student_id, name, relation,phone )
VALUES
(1231,'John Doe','Mother','+4917123456789'),
(2343,'Jane Doe','Father','+4917213123912'),
(3453,'Jack Smith','Brother','+4917312345678'),
(1232,'Jill Johnson','Sister','+491748888888');

INSERT INTO discount (student_id, siblings_id,discount_percentage)
VALUES
(1231,NULL,Null),
(2343,NULL,Null),
(3453,NULL,Null),
(1232,2121,15);

INSERT INTO phone(phone_number)
VALUES ('+4917123456789'),
('+4917213123912'),
('+4917312345678'),
('+491748888888');

INSERT INTO person_phone(phone_id,person_id)
VALUES 
(1,1231),
(2,2343),
(3,3453),
(4,1232);

INSERT INTO schedule(instructor_id,student_id,start_time,end_time)
VALUES
(1232,1111,'2023-11-22 09:00:00', '2023-11-22 10:30:00'),
(2122,2222,'2023-11-22 11:15:00', '2023-11-22 12:45:00'),
(1212,2111,'2023-11-22 14:30:00', '2023-11-22 16:00:00'),
(2223,2211,'2023-11-22 17:45:00', '2023-11-22 19:15:00'),
(4343,4332,'2023-11-22 20:30:00', '2023-11-22 22:00:00');

INSERT INTO lesson(description,schedule_id)
VALUES
('The lesson take place in school classroom 310',12),
('The lesson take place in school classroom 311',21),
('The lesson take place in school classroom 312',32),
('The lesson take place in school classroom 313',43);

INSERT INTO pricing_Scheme(lesson_id,lessonlevel,lessontype,price)
VALUES
(12,'beginner','individual lesson',10.00),
(21,'intermediate','group lesson',15.00),
(32,'advanced','individual lesson',20.00),
(43,'beginner','group lesson',15.00),
(33,NULL,'ensamble',20.00);

INSERT INTO ensamble(lesson_id,maximum_nr_of_students,minimum_nr_of_students,genre)
VALUES
(33,10,5,'rock'),
(34,10,5,'pop'),
(35,10,5,'jazz'),
(36,10,5,'classical');

INSERT INTO group_lesson(lesson_id,maximum_nr_of_students,minimum_nr_of_students,level,instrument)
VALUES
(12,10,5,'beginner','piano'),
(21,10,5,'intermediate','guitar'),
(32,10,5,'advanced','violin'),
(43,10,5,'beginner','trumpet'),
(33,10,5,'beginner','piano'),
(34,10,5,'beginner','guitar'),
(35,10,5,'beginner','jazz');

INSERT INTO individual(lesson_id,level,instrument)
VALUES
(12,'beginner','piano'),
(21,'intermediate','guitar'),
(32,'advanced','violin'),
(43,'beginner','trumpet'),
(33,'beginner','piano'),
(34,'beginner','guitar'),
(35,'beginner','jazz');
