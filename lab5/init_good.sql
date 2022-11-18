truncate table public.library_user cascade;
drop table if exists public.library_user_first;
drop table if exists public.library_user_second;
drop table if exists public.library_user_third;

-- создаем таблицы, наследуемые от стандартной
create table if not exists public.library_user_first (
	library_user_id int primary key
) inherits (public.library_user);

create table if not exists public.library_user_second (
library_user_id int primary key
) inherits (public.library_user);

create table if not exists public.library_user_third (
library_user_id int primary key
) inherits (public.library_user);


-- создаем функция распределения данных по таблицам
create or replace function public.library_user_email_separate_trigger()
returns trigger as $$
	BEGIN
	if ( new.library_user_id % 3 == 0) then insert into public.library_user_first values (new.*);

	elseif ( new.library_user_id % 3 == 1) then insert into public.library_user_second values (new.*);

	elseif ( new.library_user_id % 3 == 2) then insert into public.library_user_third values (new.*);

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