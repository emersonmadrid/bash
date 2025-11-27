# 🖥️ Conectar-Windows (auto-descubrimiento RDP desde Linux)

Script Bash que encuentra la IP de un equipo Windows y lanza una sesión RDP con `xfreerdp`. Útil cuando el host cambia de IP y quieres conectarte sin buscar manualmente.

## ✨ Qué hace
- Detecta la IP por mDNS (`avahi-resolve`) o NetBIOS (`nmblookup`) sin que tengas que recordarla.
- Pide la IP manualmente si el descubrimiento automático falla.
- Abre RDP con portapapeles compartido, resolución dinámica y tu `$HOME` montado como unidad `LinuxShare`.
- Incluye modo debug para ver las salidas crudas de las herramientas de descubrimiento.

## 🚀 Requisitos
Instala las dependencias mínimas:
```bash
sudo apt install avahi-utils xfreerdp samba-common-bin
```
Opcional para diagnósticos de red:
```bash
sudo apt install nbtscan
```

## ▶️ Uso rápido
Desde `conectar-windows/`:
```bash
chmod +x conectar-windows.sh
./conectar-windows.sh
```

Si quieres ejecutarlo desde cualquier ruta, muévelo a un directorio de tu `PATH` o crea un alias:
```bash
sudo install -m 755 conectar-windows.sh /usr/local/bin/conectar-windows
# o bien
alias conectar-windows="$PWD/conectar-windows.sh"
```

El script pedirá usuario y contraseña de Windows y abrirá la sesión RDP con las opciones por defecto.

## ⚙️ Configuración rápida
Edita estas variables al inicio del script si las quieres personalizar:
- `HOST`: nombre NetBIOS/mDNS del equipo Windows (sin `.local`).
- `NETWORK_PREFIX`: prefijo de red esperado (ej. `192.168.1.`).
- `MAX_TRIES`: reintentos con `nmblookup`.
- `SLEEP_SECS`: pausa entre reintentos.
- `DEBUG=true`: muestra salidas crudas de las herramientas de descubrimiento.

## 🔍 Cómo funciona
1. **mDNS**: consulta `avahi-resolve -n HOST.local`. Solo acepta IPs que empiecen con `NETWORK_PREFIX`.
2. **NetBIOS**: si lo anterior falla y `nmblookup` está instalado, reintenta hasta `MAX_TRIES` filtrando el mismo prefijo.
3. **Entrada manual**: solicita la IP y valida un formato IPv4 simple.
4. **RDP**: lanza `xfreerdp` con `/cert-ignore +clipboard /dynamic-resolution /drive:LinuxShare,"$HOME"`.

Ejemplo de ejecución satisfactoria:
```text
🔍 Buscando DESKTOP-DOCJT49 en la red (192.168.1.*)...
🌐 Intentando resolver por mDNS (.local)...
✅ Encontrado por mDNS: 192.168.1.32
🔑 Usuario: admin
🔒 Contraseña:
🚀 Conectando a 192.168.1.32...
```

## 🧰 Solución de problemas
- `avahi-resolve: command not found`: instala `avahi-utils`.
- No se encuentra IP: revisa que el host responda en la red, valida `NETWORK_PREFIX`, o prueba con IP manual.
- NetBIOS devuelve IPs fuera de tu red: ajusta `NETWORK_PREFIX` para filtrar correctamente.
- Error de certificado RDP: se ignora con `/cert-ignore`, pero confirma que te conectas al host esperado.
- Pantalla negra o lag: prueba desactivar `+clipboard` o `/dynamic-resolution` en el script según tu entorno.
- Resoluciones raras: usa `/size:1366x768` u otra resolución fija en la línea de `xfreerdp`.

## 🔒 Notas de seguridad
- Las credenciales se pasan directamente a `xfreerdp` y no se guardan; aun así, revisa el script antes de ejecutarlo.
- Ejecuta sin `sudo`; sólo las dependencias requieren privilegios al instalarse.
- Evita dejar el terminal desatendido mientras la contraseña está en el historial de scroll.

## 👤 Autor
Emerson Ángel Madrid Herrera
