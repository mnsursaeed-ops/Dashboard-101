-- Dashboard-101 Schema

create table if not exists public.items (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.items enable row level security;

create policy "Allow public read" on public.items
  for select using (true);
