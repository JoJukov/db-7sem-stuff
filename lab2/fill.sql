truncate table author cascade;

insert into author (author_id, name, birthdate, birthplace, url, contact_email)
values 
	(1, 'n1', 'b1', 'p1', 'u1', 'm1'),
	(2, 'n2', 'b2', 'p2', 'u2', 'm2'),
	(3, 'n3', 'b3', 'p3', 'u3', 'm3'),
	(4, 'n4', 'b4', 'p4', 'u4', 'm4'),
	(5, 'n5', 'b5', 'p5', 'u5', 'm5'),
	(6, 'n6', 'b6', 'p6', 'u6', 'm6'),
	(7, 'n7', 'b7', 'p7', 'u7', 'm7'),
	(8, 'n8', 'b8', 'p8', 'u8', 'm8'),
	(9, 'n9', 'b9', 'p9', 'u9', 'm9'),
	(10, 'n10', 'b10', 'p10', 'u10', 'm10'),
	(11, 'n11', 'b11', 'p11', 'u11', 'm11'),
	(12, 'n12', 'b12', 'p12', 'u12', 'm12'),
	(13, 'n13', 'b13', 'p13', 'u13', 'm13'),
	(14, 'n14', 'b14', 'p14', 'u14', 'm14'),
	(15, 'n15', 'b15', 'p15', 'u15', 'm15');
	
truncate table book cascade;

insert into book (book_id, publisher_id, title, year)
values
	(1, 1, 'a1', 1001),
	(2, 1, 'a2', 1002),
	(3, 1, 'a3', 1003),
	(4, 1, 'a4', 1004),
	(5, 1, 'a5', 1005),
	(6, 1, 'a6', 1006),
	(7, 1, 'a7', 1007),
	(8, 1, 'a8', 1008),
	(9, 1, 'a9', 1009),
	(10, 1, 'a10', 1000),
	(11, 1, 'a11', 1000),
	(12, 1, 'a12', 1000),
	(13, 1, 'a13', 1000),
	(14, 1, 'a14', 1000),
	(15, 1, 'a15', 1000);
	
truncate table author_book;

insert into author_book (author_id, book_id)
values
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 4),
	(11, 4),
	(12, 4),
	(13, 5),
	(14, 5),
	(15, 5);
	
truncate table warehouse cascade;

insert into warehouse (phone, address)
values 
	(111, 'add1'),
	(222, 'add2'),
	(333, 'add3'),
	(444, 'add4'),
	(555, 'add5'),
	(666, 'add6'),
	(777, 'add7'),
	(888, 'add8'),
	(999, 'add9'),
	(1110, 'add10'),
	(1111, 'add11'),
	(1112, 'add12'),
	(1113, 'add13'),
	(1114, 'add14'),
	(1115, 'add15');
	
truncate table warehouse_book cascade;

insert into warehouse_book (warehouse_phone, book_id, count)
values 
	(111, 1, 1),
	(111, 2, 1),
	(111, 3, 1),
	(222, 4, 1),
	(222, 5, 1),
	(222, 6, 1),
	(333, 7, 1),
	(333, 8, 1),
	(333, 9, 1),
	(444, 10, 1),
	(444, 11, 1),
	(444, 12, 1),
	(555, 13, 1),
	(555, 14, 1),
	(555, 15, 1);
	
truncate table shopping_cart_book;

insert into shopping_cart_book (shopping_cart_id, book_id, count)
values
	(1, 1, 1),
	(1, 2, 1),
	(1, 3, 1),
	(2, 4, 1),
	(2, 5, 1),
	(2, 6, 1),
	(3, 7, 1),
	(4, 8, 1),
	(5, 9, 1),
	(6, 10, 1),
	(7, 11, 1),
	(7, 12, 1),
	(8, 13, 1),
	(9, 14, 1),
	(10, 15, 1);