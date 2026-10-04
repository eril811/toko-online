alter table products add column if not exists promo_price numeric;
insert into storage.buckets(id,name,public) values('products','products',true) on conflict do nothing;
create policy "gambar publik" on storage.objects for select using (bucket_id='products');
create policy "kasir upload gambar" on storage.objects for insert to authenticated with check (bucket_id='products');
create policy "kasir ubah gambar" on storage.objects for update to authenticated using (bucket_id='products');
create policy "kasir hapus gambar" on storage.objects for delete to authenticated using (bucket_id='products');
alter publication supabase_realtime add table orders;
