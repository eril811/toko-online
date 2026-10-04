alter table products add column if not exists category text;
alter table products add column if not exists colors jsonb default '[]'::jsonb;
alter table products add column if not exists sizes jsonb default '[]'::jsonb;
notify pgrst, 'reload schema';
