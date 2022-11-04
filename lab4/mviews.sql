-- generalization on sc amount on user
create materialized view if not exists user_sc_number as
select 
	u.library_user_id as user_id,
	anon.generalize_int4range(count(*)::int, 5) as shopping_carts_amount
from library_user as u join shopping_cart as sc
	on sc.library_user_id = u.library_user_id 
	group by (u.library_user_id);

-- scrambling on book's publisher phone
create materialized view if not exists book_publisher as
select
	b.title as book_title,
	p."name" as publisher_name,
	anon.partial(p.contact_email::text, 2, '***', 2)
from book as b join publisher as p
	on b.publisher_id = p.publisher_id;

-- faking on warehouse address in mview data which contains warehouse info + books stored number
create materialized view if not exists warehose_books_stored as
select
	anon.fake_address() as warehouse_address,
	count(*) as books_count
from
	warehouse as w join warehouse_book as wb
	on wb.warehouse_phone = w.phone group by (w.address);

