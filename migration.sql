alter table products add column if not exists tiers jsonb default '[]'::jsonb;
