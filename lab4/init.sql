CREATE TABLE IF NOT EXISTS PUBLIC.ROLE (
ROLE_ID INT PRIMARY KEY,
NAME VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS PUBLIC.PERMISSION (
PERMISSION_ID INT PRIMARY KEY,
NAME VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS PUBLIC.ROLE_PERMISSION (
ROLE_ID INT REFERENCES PUBLIC.ROLE (ROLE_ID) ON
UPDATE
	CASCADE ON
	DELETE
		CASCADE,
		PERMISSION_ID INT REFERENCES PUBLIC.PERMISSION (PERMISSION_ID) ON
		UPDATE
			CASCADE ON
			DELETE
				CASCADE,
				CONSTRAINT ROLE_PERMISSION_PK PRIMARY KEY (ROLE_ID,
				PERMISSION_ID)
);

CREATE TABLE IF NOT EXISTS PUBLIC.LIBRARY_USER (
LIBRARY_USER_ID INT PRIMARY KEY,
ROLE_ID INT REFERENCES PUBLIC.ROLE (ROLE_ID) ON
UPDATE
	CASCADE ON
	DELETE
		CASCADE,
		EMAIL VARCHAR(255) NOT NULL UNIQUE,
		NAME VARCHAR(255),
		PHONE VARCHAR(255) UNIQUE,
		ADDRESS VARCHAR (255)
);

CREATE TABLE IF NOT EXISTS PUBLIC.SHOPPING_CART (
SHOPPING_CART_ID INT PRIMARY KEY,
LIBRARY_USER_ID INT REFERENCES PUBLIC.LIBRARY_USER (LIBRARY_USER_ID) ON
UPDATE
	CASCADE ON
	DELETE
		CASCADE
);

CREATE TABLE IF NOT EXISTS PUBLIC.PUBLISHER (
PUBLISHER_ID INT PRIMARY KEY,
NAME VARCHAR(255) NOT NULL,
PHONE VARCHAR(255) NOT NULL,
ADDRESS VARCHAR(255),
URL VARCHAR(255),
CONTACT_EMAIL VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS PUBLIC.AUTHOR (
AUTHOR_ID INT PRIMARY KEY,
NAME VARCHAR(255),
BIRTHDATE VARCHAR(255),
BIRTHPLACE VARCHAR(255),
URL VARCHAR(255),
CONTACT_EMAIL VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS PUBLIC.WAREHOUSE (
PHONE INT PRIMARY KEY,
ADDRESS VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS PUBLIC.BOOK (
BOOK_ID INT PRIMARY KEY,
PUBLISHER_ID INT REFERENCES PUBLIC.PUBLISHER (PUBLISHER_ID) ON
UPDATE
	CASCADE ON
	DELETE
		CASCADE,
		TITLE VARCHAR(255),
		YEAR INT
);

CREATE TABLE IF NOT EXISTS PUBLIC.SHOPPING_CART_BOOK (
SHOPPING_CART_ID INT REFERENCES PUBLIC.SHOPPING_CART (SHOPPING_CART_ID) ON
UPDATE
	CASCADE ON
	DELETE
		CASCADE,
		BOOK_ID INT REFERENCES PUBLIC.BOOK (BOOK_ID) ON
		UPDATE
			CASCADE ON
			DELETE
				CASCADE,
				COUNT INT NOT NULL,
				CONSTRAINT SHOPPING_CART_BOOK_PK PRIMARY KEY (SHOPPING_CART_ID,
				BOOK_ID)
);

CREATE TABLE IF NOT EXISTS PUBLIC.AUTHOR_BOOK (
AUTHOR_ID INT REFERENCES PUBLIC.AUTHOR (AUTHOR_ID) ON
UPDATE
	CASCADE ON
	DELETE
		CASCADE,
		BOOK_ID INT REFERENCES PUBLIC.BOOK (BOOK_ID) ON
		UPDATE
			CASCADE ON
			DELETE
				CASCADE,
				CONSTRAINT AUTHOR_BOOK_PK PRIMARY KEY (AUTHOR_ID,
				BOOK_ID)
);

CREATE TABLE IF NOT EXISTS PUBLIC.WAREHOUSE_BOOK (
WAREHOUSE_PHONE INT REFERENCES PUBLIC.WAREHOUSE (PHONE) ON
UPDATE
	CASCADE ON
	DELETE
		CASCADE,
		BOOK_ID INT REFERENCES PUBLIC.BOOK (BOOK_ID) ON
		UPDATE
			CASCADE ON
			DELETE
				CASCADE,
				COUNT INT NOT NULL,
				CONSTRAINT WAREHOUSE_BOOK_PK PRIMARY KEY (WAREHOUSE_PHONE,
				BOOK_ID)
);