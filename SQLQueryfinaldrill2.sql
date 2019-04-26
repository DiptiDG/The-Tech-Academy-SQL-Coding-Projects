

create table Library_Branch
(
Branch_Id int primary key not null identity(1,1),
Branch_name varchar(50) not null,
Address varchar(50) 
);

insert into Library_Branch
(Branch_name, Address)
values
('Central', 'Seattle'),
('Sharpstown', 'Bellevue'),
('Public', 'Mill Creeck'),
('Evergreen', 'Evrett')
;


create table Publisher
(
PublisherName varchar(50) primary key not null ,
Address nvarchar(50),
Phone varchar(50) 
);

select * from Publisher;

insert into Publisher
(PublisherName, Address, Phone)
values
('Arcade Publishing', 'renton', '234-567-8906' ),
('Bellevue branch', 'bellevue', '234-567-8906'),
('Bloomsbary', 'renton', '222-667-8906'),
('City Lights Publisher','Seattle', '234-777-1023'),
('Dover Publications', 'kent', '234-567-8906'),
('Harper collins', 'kent', '214-567-8906'),
('John Blake Publishing', 'evrett', '222-667-8906'),
('Pearson', 'kirkland', '234-777-8906'),
('TCK Publishing', 'Mill Creeck', '234-567-85606'),
('Tuttle Publishing', 'Bllevue', '234-567-8906')
;
create table Books
(
Book_Id int primary key not null ,
Title varchar(50) ,
PublisherName varchar(50)  CONSTRAINT fk_PBooks_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);
select * from Books;

insert into Books
(Book_Id, Title, PublisherName)
values
(42, 'Hamlet ',	'Tuttle Publishing'),
(43,	'War and Peace','TCK Publishing'),
(44,	'Tho Outsider',	'Harper colins'),
(45, 'lliad','Tuttle Publishing'),
(46,	'Beloved',	'Harper colins'),
(47,	'The Lost Tribe	','Arcade Publishing'),
(50,'Harry Potter',	'John Blake Publishing'),
(51,	'Alices Adventures in Wonderland',	'City Lights Publisher'),
(52,	'The Adventures of Huckleberry Finn	', 'Bloomsbary'),
(53,	'Divine Comedy','TCK Publishing'),
(63,'	Pride & Prejudice',	'John Blake Publishing'),
(64, 'Crime & Punishment', 'City Lights Publisher'),
(65, 'Catch-22',	'Bloomsbary'),
(66,	'The Sound and the Fury', 'Dover Publications'),
(72,	'Odyssey',	'Arcade Publishing'),
(73,	'Anna Kareninar','TCK Publishing'),
(74,	'Great Expectation','Dover Publications'),
(75	,'MiddleMarch',	'TCK Publishing'),
(80,'The Great Gatsby',	'Pearson'),
(81,	'Leaves Of Grass',	'Pearson')
;

use myBooks
go
create table Book_Authors
(
Book_Id int not null CONSTRAINT fk_Book_Author_Book_id FOREIGN KEY REFERENCES Books(Book_Id) ON UPDATE CASCADE ON DELETE CASCADE,
Author_name varchar(50) not null,

);

select * from Book_Authors;

insert into Book_Authors
(Book_Id, Author_name)
values
(44,'Stephen King'),
(47	,'Hebrew Bible'),
(50, '	J. K Rowling'),
(64,'Lewi Carroll'),
(74	,'William Faulkner'),
(53,'	Leo Tostoy'),
(65,	'Mark Twain'),
(73,'Charles Dicken'),
(42,	'Jane Austin'),
(43,	'George Orwell')
;


create table Borrower
(
cardNo int primary key not null identity(1,1),
name varchar(50) not null,
Address varchar(50),
Phone varchar(50)

);
select * from Borrower;
insert into Borrower
(name, Address, Phone)
values
('daniel',	'Bellevue','234-444-5678'),
('cristina','Seattle','234-464-5678'),
('charlet','kirkland','222-444-5678'),
('avani','bellvue','234-444-5678'),
('monika','kent','256-444-5673'),
('sam',	'Mill Creeck','234-444-5464'),
('john','cedarwood','234-444-5689'),
('amber','everet',	'234-456-5678')
;



select *from Book_Loans;
create table Book_Loans
(
Book_Id int  not null  CONSTRAINT fk_Book_Loans_Book_id FOREIGN KEY REFERENCES Books(Book_Id) ON UPDATE CASCADE ON DELETE CASCADE,
Branch_Id int not null  CONSTRAINT fk_Book_Loans_Branch_id FOREIGN KEY REFERENCES Library_Branch(Branch_Id) ON UPDATE CASCADE ON DELETE CASCADE,
cardNo int  CONSTRAINT fk_Book_Book_Loans_cardNo FOREIGN KEY REFERENCES Borrower(cardNo) ON UPDATE CASCADE ON DELETE CASCADE,
DateOut Date,
DateDue date
);

select * from Book_Loans;

insert into Bokk_Loans
values
(47, 2,	2,	'2019-01-10','2019-02-10'),
(42, 2,	2,	'2019-02-12','2019-05-25'),
(50, 3,	6, '2019-03-12','2019-04-12'),
(52, 4,	5,'2019-04-15',	'2019-05-15'),
(64,	1,	5,'2019-03-22',	'2019-04-22'),
(46,	1,	6, '2019-02-24','2019-03-24'),
(74,	4,	7,'2019-01-17',	'2019-02-17'),
(66, 4,	5, '2019-02-28','2019-03-28'),
(72, 3,	1,	'2019-01-01	','2019-02-01'),
(75, 1,	6,	'2019-04-07','2019-05-07'),
(50,	2,	2,	'2019-01-10',	'2019-02-10'),
(52,	2,	2	,'2019-02-03','2019-03-03'),
(50	,3,	6, '2019-03-12','2019-04-12'),
(42,	4,	5,'2019-04-15',	'2019-05-15'),
(44,	1,	5,	'2019-03-22','2019-04-22'),
(46,	1,	6,	'2019-02-24','2019-03-24'),
(74,	4,	7,	'2019-01-17',	'2019-02-17'),
(66,	4,	5,	'2019-02-28	','2019-03-28'),
(72,	3,	1,'2019-01-01',	'2019-02-01'),
(75,	1,	6,'2019-04-07',	'2019-05-07'),
(73,	2,	2,	'2019-01-10','2019-02-10'),
(74,	2,	2,	'2019-02-03',	'2019-03-03'),
(50,	3,	6,	'2019-03-12',	'2019-04-12'),
(50	,4, 	5, '	2019-04-15',	'2019-05-15'),
(53	, 2, 	5,'2019-03-22',	'2019-04-22'),
(46	,1 ,	6,	'2019-02-24	','2019-03-24'),
(74,	4,	7, '2019-01-17','2019-02-17'),
(66	,4,	5	,'2019-02-28',	'2019-03-28'),
(72,	3,	1,	'2019-01-01','2019-02-01'),
(75,	1,	6,	'2019-04-07','2019-05-07'),
(51,	2,	2,	'2019-01-10',	'2019-02-10'),
(53,	2,	6,	'2019-02-13',	'2019-05-25'),
(50,	3,	6,	'2019-03-12',	'2019-04-12'),
(74	,   4, 	5,	'2019-04-15', 	'2019-05-15'),
(75,	1,	5,	'2019-03-22	', '2019-04-22'),
(46	,   1,	6,	'2019-02-24',	'2019-03-24'),
(74,	4,	7,	'2019-01-17',	'2019-02-17'),
(66	,   4,	5,	'2019-02-28','2019-03-28'),
(72,	3,	1,	'2019-01-01',	'2019-02-01'),
(75	,   1,	6,	'2019-04-07',	'2019-05-07'),
(46,	2,	2,	'2019-01-10',	'2019-02-10'),
(75,	2,	2,	'2019-02-13',	'2019-03-13'),
(50,	3,	6,	'2019-03-12',	'2019-04-12'),
(72,	4,	5,	'2019-04-15	','2019-05-15'),
(80,	1,	5,	'2019-03-22	','2019-04-22'),
(46,	1,	6,	'2019-02-24	','2019-03-24'),
(74,	4,	7,	'2019-01-17',	'2019-02-17'),
(66,	4,	5,	'2019-02-28',	'2019-03-28'),
(72, 3,	1,	'2019-01-01',	'2019-02-01'),
(75,	1,	6,	'2019-04-07','2019-05-07')
;

create table Book_Copies
(
Book_Id int not null CONSTRAINT fk_Book_Copies_Book_id FOREIGN KEY REFERENCES Books(Book_Id) ON UPDATE CASCADE ON DELETE CASCADE,
Branch_Id int not null  CONSTRAINT fk_Book_Copies_Branch_id FOREIGN KEY REFERENCES Library_Branch(Branch_Id) ON UPDATE CASCADE ON DELETE CASCADE,
Number_of_copies int
);

select * from Book_Copies;

insert into Book_Copies
(Book_Id, Branch_Id, Number_of_copies)
values
(42,	1,	2),
(44,	1,	2),
(43,	1,	3),
(47,    1, 	2),
(50,    1,	2),
(51,	1,	4),
(52,	1,	2),
(72,	1,	2),
(73,    1,	2),
(80,	1,	2),
(42,	2,	2),
(44,	2,	4),
(43,	2,	3),
(47,	2,	3),
(50,	2,	2),
(51,	2,	4),
(52,    2,	2),
(72,	2,	4),
(73,	2,	2),
(80,	2,	2),
(42,	3,	2),
(44,	3,	2),
(43,	3,	3),
(47,	3,	2),
(50,	3,	2),
(51,	3,	4),
(52,	3,	2),
(72,	3,	2),
(73,	3,	2),
(80,	3,	2),
(42,	4,	2),
(44,	4,	2),
(43,	4,	3),
(47,	4,	2),
(50,	4,	2),
(51,	4,	4),
(52,	4,	2),
(72,	4,	2),
(73,	4,	2),
(80,	4,	2)
;