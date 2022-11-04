--warehouse - ok
--warehouse_book - ok
--book - ok
--library_user - ok
--shoping_cart
--publisher - ok

begin;

insert into publisher (publisher_id, name, phone, address, url, contact_email)
values (1, 'publisher_name1', '716327812', 'i9eghry8uerg','uhgehruy.ru', 'uhgehruy@mail.ru');

insert into book (book_id, publisher_id, title, year)
values (1, 1, 'book_name', 2011);


insert into warehouse (phone, address)
values (123123, 'fgjwrhyuhg8e');

insert into warehouse_book (warehouse_phone, book_id, count)
values (123123, 1, 1);

insert into library_user (library_user_id, role_id, email, phone, address)
values (2, null, 'okgew@mail.ru', '634563456', 'ihnegu8gre');

insert into shopping_cart (shopping_cart_id, library_user_id)
values (1, 2);

commit;