# ⚡ Combo Reactor

**Combo Reactor** es un juego arcade 2D de física y reacciones en cadena con estética neón cyberpunk. Dispara a los cristales flotantes, encadena combos, usa el **pulso de reactor** para ralentizar el tiempo y sobrevive a 55 niveles repartidos en 5 mundos.

Disponible para navegador y como APK para Android.

---

## 🎮 Cómo se juega

- **Apunta y dispara** con el ratón o el dedo. Los proyectiles rebotan en las paredes y en los nodos del circuito.
- **Destruye cristales** para sumar puntos y Flux. Cada destrucción puede activar bonificaciones de combo.
- **Pulso de reactor** (ESPACIO o clic derecho): ralentiza el tiempo y empuja los cristales para que puedas reapuntar.
- **No dejes escapar cristales** por la parte inferior: cada fuga le quita un punto de núcleo. Tienes 5.
- **Bonus de daño acumulativo:** cada destrucción dentro de un combo aumenta tu daño hasta un **+60 %**.

## ✨ Motivos para jugarlo

- **🔫 23 armas** con rangos de **F a SSS**. Cada rango multiplica el daño y el precio: láseres, escopetas, plasma, bombas gravitacionales, misiles buscadores, boomerangs y más.
- **🧩 12 habilidades** que combinan con tus armas: escudo térmico, imán gravitatorio, congelación, dron táctico, multiplicador y, en las de pago, singularidad y colapso estelar.
- **🌌 55 niveles en 5 mundos**, con oleadas que cambian de patrón (deriva, órbita, zigzag, espiral…) y circuitos con rebotadores que complican cada ronda.
- **♾️ Modo infinito** para medir tu récord cuando ya dominas el juego.
- **🏆 42 logros**: desde tu primera destrucción hasta completar las seis constelaciones.
- **📅 Recompensas diarias:** login con racha, misiones diarias y una tienda semanal con ofertas.
- **☁️ Cuenta en la nube:** tu progreso se guarda en Supabase y lo recuperas en cualquier dispositivo.
- **🎵 Música y sonidos originales**, generados por código: cada arma y cada habilidad tiene su propio sonido.
- **🛠️ Ajustes** de sacudida de cámara, densidad de partículas y volumen de la música.

## 🖥️ Requisitos

- **Navegador:** cualquier navegador moderno. Abre `www/index.html`.
- **Android:** compila el APK con el flujo de GitHub Actions (ver abajo).
- Conexión a internet para cuentas en la nube y la primera carga de fuentes.

---

## 🚀 Instalación y compilación

### 1. Cuenta en la nube (Supabase, gratis)
1. Crea un proyecto en [supabase.com](https://supabase.com).
2. En **SQL Editor**, ejecuta el contenido de `supabase/schema.sql`.
3. En **Authentication → Sign In / Providers → Email**, desactiva **Confirm email**.
4. Pon tu URL y tu **Publishable key** en `www/config.js`.
   Nunca uses la clave *secret* o *service_role* en la app.

### 2. APK con GitHub Actions
1. Sube este repositorio a GitHub.
2. Ve a la pestaña **Actions** y espera a que termine **Compilar APK**.
3. Descarga el artefacto **combo-reactor-apk** (`app-debug.apk`) e instálalo en tu celular.

### 3. Compilar en tu computadora (opcional)
```bash
npm install
npx cap add android
npx cap sync android
cd android && ./gradlew assembleDebug
```
El APK queda en `android/app/build/outputs/apk/debug/app-debug.apk`.

---

## 🧾 Pedidos y tienda

Las compras se envían como pedidos pendientes. El jugador ingresa la referencia de su pago y el monto en USD. El operador verifica el pago y lo aprueba o lo deniega desde `supabase/aprobar_pagos.sql` (o desde el Table Editor de Supabase). El jugador solo recibe su compra cuando el pedido aparece como aprobado.

---

## 📁 Estructura del proyecto

```
combo-reactor/
├── www/
│   ├── index.html        # El juego completo (HTML + CSS + JS)
│   └── config.js         # Conexión a Supabase
├── supabase/
│   ├── schema.sql        # Tablas y reglas de seguridad
│   └── aprobar_pagos.sql # Aprobar o denegar pedidos
├── .github/workflows/
│   └── android.yml       # Compila el APK en GitHub Actions
├── capacitor.config.json # Configuración de la app Android
├── LICENSE               # Licencia MIT
├── package.json          # Dependencias de Capacitor
└── README.md
```

---

## 🎨 Créditos

| Rol | Autor |
|---|---|
| Programador y sonidos | **Claude.ia** |
| Idea | **Gemini.ia** |
| Diseño | **Deathsinger_s** · [TikTok](https://www.tiktok.com/@Deathsinger_s) |

Gracias a **@Deathsinger_s** (TikTok), **Claude IA** y **Gemini.ia** por hacer posible Combo Reactor.

---

## 📜 Licencia

Este proyecto está bajo la **Licencia MIT**. Consulta el archivo [LICENSE](LICENSE).
