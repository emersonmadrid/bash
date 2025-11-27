# 🖥️ Conectar-Windows (auto-descubrimiento RDP desde Linux)

Script Bash que encuentra la IP de un equipo Windows y lanza una sesión RDP con `xfreerdp`. Útil cuando el host cambia de IP y quieres conectarte sin buscar manualmente.

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
El script pedirá usuario y contraseña de Windows y abrirá la sesión RDP (clipboard compartido, resolución dinámica y carpeta `~/LinuxShare` montada).

## ⚙️ Configuración rápida
Edita estas variables al inicio del script si las quieres personalizar:
- `HOST`: nombre NetBIOS/mDNS del equipo Windows (sin `.local`).
- `NETWORK_PREFIX`: prefijo de red esperado (ej. `192.168.1.`).
- `MAX_TRIES`: reintentos con `nmblookup`.
- `SLEEP_SECS`: pausa entre reintentos.
- `DEBUG=true`: muestra salidas crudas de las herramientas de descubrimiento.

## 🔍 Cómo funciona
1. **mDNS** con `avahi-resolve` buscando `HOST.local`. Si la IP coincide con el prefijo, se usa.
2. **NetBIOS** con `nmblookup` hasta `MAX_TRIES` si mDNS falla.
3. **IP manual** solicitada al usuario si no se detecta automáticamente.
4. **Conexión RDP** con `xfreerdp` usando las credenciales ingresadas.

## 🧰 Solución de problemas
- `avahi-resolve: command not found`: instala `avahi-utils`.
- No se encuentra IP: revisa que el host responda en la red, valida `NETWORK_PREFIX`, o prueba con IP manual.
- Error de certificado RDP: se ignora con `/cert-ignore`, pero confirma que te conectas al host esperado.
- Pantalla negra o lag: prueba desactivar `+clipboard` o `/dynamic-resolution` en el script según tu entorno.

## 🔒 Notas de seguridad
- Revisa y ajusta el script antes de guardar credenciales en tu terminal.
- Ejecuta sin `sudo`; sólo las dependencias requieren privilegios al instalarse.

## 👤 Autor
Emerson Ángel Madrid Herrera
