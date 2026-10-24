-- ARCHIVO DEL OPERADOR: aquí ves las referencias y apruebas o deniegas pagos.
-- Pega cada bloque en Supabase > SQL Editor y pulsa RUN.

-- 1) Ver todas las referencias recibidas
select created_at, ref, usd, item, method, approved
from public.orders
order by created_at desc;

-- 2) APROBAR: el jugador recibe su compra al pulsar ACTIVAR
update public.orders set approved = true where ref = '0004812930';

-- 3) DENEGAR: el jugador verá "no fue aprobado"
update public.orders set approved = false where ref = '0004812930';

-- 4) Volver a pendiente
update public.orders set approved = null where ref = '0004812930';
