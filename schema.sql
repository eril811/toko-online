create table products(
  id bigint generated always as identity primary key,
  name text not null, price numeric not null default 0,
  description text, image_url text, stock int default 0,
  active boolean default true, created_at timestamptz default now());
create table orders(
  id bigint generated always as identity primary key,
  customer_name text not null, phone text not null, address text not null,
  items jsonb not null, total numeric not null,
  status text default 'baru', created_at timestamptz default now());
alter table products enable row level security;
alter table orders enable row level security;
create policy "produk publik" on products for select using (true);
create policy "admin kelola produk" on products for all to authenticated using (true) with check (true);
create policy "pembeli buat order" on orders for insert to anon, authenticated with check (true);
create policy "admin lihat order" on orders for select to authenticated using (true);
create policy "admin ubah order" on orders for update to authenticated using (true);
insert into products(name,price,description,image_url,stock) values
('Kaos Polos',75000,'Bahan katun nyaman','https://picsum.photos/seed/kaos/400',50),
('Tas Ransel',185000,'Muat laptop 14 inci','https://picsum.photos/seed/tas/400',20),
('Botol Minum',45000,'Stainless 500ml','https://picsum.photos/seed/botol/400',100);
