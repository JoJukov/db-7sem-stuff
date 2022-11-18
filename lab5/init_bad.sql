truncate table public.library_user cascade;
drop table if exists public.library_user_a_i;
drop table if exists public.library_user_j_s;
drop table if exists public.library_user_t_z;
drop table if exists public.library_user_numbers_symbols;

-- создаем таблицы, наследуемые от стандартной
create table if not exists public.library_user_a_i (
	library_user_id int primary key
) inherits (public.library_user);

create table if not exists public.library_user_j_s (
library_user_id int primary key
) inherits (public.library_user);

create table if not exists public.library_user_t_z (
library_user_id int primary key
) inherits (public.library_user);

create table if not exists public.library_user_numbers_symbols (
library_user_id int primary key
) inherits (public.library_user);

-- создаем функция распределения данных по таблицам
create or replace function public.library_user_email_separate_trigger()
returns trigger as $$
	BEGIN
	if ( new.email ~ '^[a-iA-I].*$') then insert into public.library_user_a_i values (new.*);

	elseif ( new.email ~ '^[j-sJ-S].*$') then insert into public.library_user_j_s values (new.*);

	elseif ( new.email ~ '^[t_zT-Z].*$') then insert into public.library_user_t_z values (new.*);

	elseif ( new.email !~ '^[a-zA-Z].*$') then insert into public.library_user_numbers_symbols values (new.*);
	else
	    raise exception 'Unexpected data';
	end if;

	return null;
	end;
$$
language plpgsql;

-- создаем триггер на исходную бд
create or replace trigger events_before_insert
before insert on public.library_user
for each row execute procedure public.library_user_email_separate_trigger();