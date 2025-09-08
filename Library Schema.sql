USE [Library System];


/* This file contains the Schema of the Library Management System. 
The purpose of this creation is to help the library have an ordered system
where they can find details of its registered members, the books they have in store and their status,
amd also find out the details of their libarians and books they give out during their shifts. 
*/



-- ===== Creating The Tables ==========

-- ======== Creating The Libarian Table ===========
CREATE TABLE Librarians(
	lib_id NVARCHAR(10) PRIMARY KEY NOT NULL,
	first_name NVARCHAR(50) NOT NULL,
	last_name NVARCHAR(50) NOT NULL,
	work_email NVARCHAR(50) NOT NULL,
	phone NVARCHAR(50) NOT NULL,
	resumption_date DATE NOT NULL
);


-- ======== Creating The Members Table ===========
CREATE TABLE Members(
	membership_id NVARCHAR(20) PRIMARY KEY, 
	first_name NVARCHAR(50) NOT NULL, 
	last_name NVARCHAR(50) NOT NULL,
	date_of_birth DATE, 
	gender NVARCHAR(10) CHECK (gender IN ('Male','Female')) NOT NULL,
	email NVARCHAR(50) UNIQUE, 
	phone NVARCHAR(20),
	city char(2), 
	date_of_reg DATE, 
	membership_status NVARCHAR(20)
);

-- ======== Creating The Books Table ===========
CREATE TABLE Books(
	book_id	NVARCHAR(10) PRIMARY KEY NOT NULL,
	book_title NVARCHAR(MAX) NOT NULL,
	author	NVARCHAR(MAX) NOT NULL,
	publisher NVARCHAR(150) NOT NULL,
	isbn NVARCHAR(20) NOT NULL,
	year_of_publication	DATE NOT NULL,
	genre	NVARCHAR(20) NOT NULL,
	status NVARCHAR(20) CHECK(status in( 'Borrowed','Missing','Available')) NOT NULL
);

-- ======== Creating The Borrowing Table ===========
CREATE TABLE Borrowing(
	borrow_STAMP NVARCHAR(20) PRIMARY KEY,
	membership_id NVARCHAR(20) REFERENCES Members(membership_id),
	book_id NVARCHAR(10) REFERENCES books(book_id),
	lib_id NVARCHAR(10) REFERENCES librarians(lib_id),
	checkout_date DATE,
	due_date DATE
);

-- == Inserting the data ==
/*
Data for each of these tables was imported as flat file sources to the database. 
*/
