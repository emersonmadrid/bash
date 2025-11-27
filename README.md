# 🐚 Colección de scripts Bash

Repositorio personal con scripts Bash reutilizables para automatizar tareas de red, utilidades y operaciones diarias en Linux. Cada script viene acompañado de pasos de ejecución y dependencias mínimas.

## 🔎 ¿Qué hay en este repo?
- `conectar-windows/`: autodetección de un host Windows y conexión vía RDP (ver su README dedicado).
- `organizar.sh`: script auxiliar que reorganiza archivos y regenera los README base.
- `herramientas/`, `red/`, `otros/`: carpetas listas para futuros scripts (actualmente vacías).

## 🚀 Primeros pasos
1. Clonar o descargar la carpeta:
   ```bash
   git clone <url-del-repositorio>
   cd bash
   ```
2. Dar permisos al script que quieras probar:
   ```bash
   chmod +x ruta/al/script.sh
   ```
3. Ejecutarlo:
   ```bash
   ./ruta/al/script.sh
   ```
4. Si el script tiene variables de configuración, revísalas antes de correrlo (por ejemplo, host/IP, prefijos de red, opciones de depuración).

## ✅ Requisitos generales
- Linux con `bash`.
- Permisos de ejecución (`chmod +x`).
- Dependencias específicas por script (consulta el README de cada carpeta). Ejemplos comunes: `xfreerdp`, `avahi-utils`, `ssh`, `curl`.

## 🔧 Añadir o adaptar scripts
- Coloca cada nuevo script en la carpeta temática correspondiente y crea su `README.md` con:
  - Propósito del script.
  - Dependencias y configuración previa.
  - Ejemplos de uso.
- Para pequeñas pruebas rápidas puedes usar este esquema base:
  ```bash
  #!/bin/bash
  set -euo pipefail
  # TODO: describe qué hace este script
  ```

## 🔒 Buenas prácticas
- Lee el código antes de ejecutarlo, sobre todo si incluye credenciales o comandos remotos.
- Evita usar `root` salvo que sea imprescindible; preferir `sudo` puntual.
- Usa variables de entorno o archivos con permisos restringidos para credenciales.

## 👤 Autor
Emerson Ángel Madrid Herrera
