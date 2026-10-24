-- Combo Reactor · cuentas, partidas y pedidos
-- Ejecuta este archivo en Supabase > SQL Editor.

-- Perfil con nombre de usuario único
create table if not exists public.profiles (
  user_id uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  username text unique not null check (username ~ '^[a-z0-9_]{3,16}$'),
  created_at timestamptz not null default now()
);

-- Partida guardada de cada jugador
create table if not exists public.saves (
  user_id uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- Pedidos (Pago Móvil, PayPal, Zinli)
-- approved: null = pendiente · true = aprobado (se entrega) · false = denegado
create table if not exists public.orders (
  id bigint generated always as identity primary key,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  ref text unique not null check (ref ~ '^[0-9]{4,12}$'),
  usd numeric(10,2) not null,
  item text not null,
  method text not null,
  entrega jsonb not null,
  approved boolean,
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.saves enable row level security;
alter table public.orders enable row level security;

-- Cada jugador solo ve y escribe lo suyo
create policy "perfil: leer propio" on public.profiles for select using (auth.uid() = user_id);
create policy "perfil: crear propio" on public.profiles for insert with check (auth.uid() = user_id);

create policy "partida: leer propia" on public.saves for select using (auth.uid() = user_id);
create policy "partida: crear propia" on public.saves for insert with check (auth.uid() = user_id);
create policy "partida: actualizar propia" on public.saves for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "pedido: leer propio" on public.orders for select using (auth.uid() = user_id);
create policy "pedido: crear propio" on public.orders for insert with check (auth.uid() = user_id);
-- Los jugadores NO pueden cambiar "approved". Solo tú, desde el SQL Editor o el Table Editor.
