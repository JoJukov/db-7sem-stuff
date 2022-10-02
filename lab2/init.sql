drop schema public cascade;
create schema public;

create table if not exists role (
	role_id int PRIMARY key,
	name VARCHAR(255)
);

create table if not exists permission (
	permission_id int primary key,
	name VARCHAR(255)
);


create table if not exists role_permission (
	role_id int REFERENCES role (role_id) on update cascade on delete cascade,
	permission_id int REFERENCES permission (permission_id) on update cascade on delete cascade,
	constraint role_permission_pk primary key (role_id, permission_id)
);

create table if not exists library_user (
	library_user_id int primary key,
	role_id int references role (role_id) on update cascade on delete cascade,
	email varchar(255) not null unique,
	name varchar(255),
	phone varchar(255) unique,
	address varchar (255)
);

create table if not exists shopping_cart (
	shopping_cart_id int primary key,
	library_user_id int references library_user (library_user_id) on update cascade on delete cascade
);

create table if not exists publisher (
	publisher_id int primary key,
	name varchar(255) not null,
	phone varchar(255) not null,
	address varchar(255),
	url varchar(255),
	contact_email varchar(255)
);

create table if not exists author (
	author_id int primary key, 
	name varchar(255),
	birthdate varchar(255),
	birthplace varchar(255),
	url varchar(255),
	contact_email varchar(255)
);

create table if not exists warehouse (
	phone int primary key, 
	address varchar(255) not null
);
-- cascade?
create table if not exists book (
	book_id int primary key,
	publisher_id int references publisher (publisher_id) on update cascade on delete cascade,
	title varchar(255),
	year int
);

create table if not exists shopping_cart_book (
	shopping_cart_id int REFERENCES shopping_cart (shopping_cart_id) on update cascade on delete cascade,
	book_id int REFERENCES book (book_id) on update cascade on delete cascade,
	count int not null,
	constraint shopping_cart_book_pk primary key (shopping_cart_id, book_id)
);

create table if not exists author_book (
	author_id int REFERENCES author (author_id) on update cascade on delete cascade,
	book_id int REFERENCES book (book_id) on update cascade on delete cascade,
	constraint author_book_pk primary key (author_id, book_id)
);

create table if not exists warehouse_book (
	warehouse_phone int REFERENCES warehouse (phone) on update cascade on delete cascade,
	book_id int REFERENCES book (book_id) on update cascade on delete cascade,
	count int not null,
	constraint warehouse_book_pk primary key (warehouse_phone, book_id)
);