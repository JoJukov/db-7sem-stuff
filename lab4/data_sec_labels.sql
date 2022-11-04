-- fake data on user's mail
security label for anon on column public.library_user."name" 
is 'MASKED WITH FUNCTION anon.fake_first_name()';

-- scrambling on user's email
security label for anon on column public.library_user.email
is 'MASKED WITH FUNCTION anon.partial(email, 2, $$*****$$, 2)';

-- destruction (in case just setting to null) on user's address
security label for anon on column public.library_user.address
is 'MASKED WITH VALUE NULL'