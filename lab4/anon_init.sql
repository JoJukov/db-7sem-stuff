create extension if not exists ANON cascade;

select
	ANON.INIT();

alter database postgres set
anon.sourceschema to 'public';

create role bad_user with login password 'imbadaf';

security label for anon on
role bad_user is 'masked';

select
	anon.start_dynamic_masking();