# 🐚 Colección de scripts Bash

**Descripción:**

Repositorio con una colección de scripts Bash organizados por carpetas para tareas de red, utilidades y automatización. Cada script está pensado para ser reutilizable y fácil de ejecutar.

**Estructura del repositorio:**
- `conectar-windows/` : scripts para conexión vía RDP desde Linux a Windows.
- `herramientas/` : scripts utilitarios (varias herramientas).
- `red/` : scripts relacionados con tareas de red.
- `otros/` : scripts misceláneos.

Cada subcarpeta puede contener su propio `README.md` con instrucciones y requisitos específicos.

**Requisitos generales:**
- Sistema: Linux con `bash`.
- Permisos de ejecución para los scripts (`chmod +x`).
- Dependencias opcionales según script (p. ej. `xfreerdp`, `rdesktop`, `ssh`, `curl`). Consulta el `README.md` de la subcarpeta correspondiente.

**Instalación rápida:**
1. Clona el repositorio (o descarga la carpeta que necesites):
   ```bash
   git clone <url-del-repositorio>
   cd bash
   ```

**Cómo ejecutar un script (pasos recomendados):**
1. Entra en la carpeta que contiene el script:
   ```bash
   cd conectar-windows
   ```
2. Revisa el contenido del script (por seguridad):
   ```bash
   less script.sh
   ```
3. Da permisos de ejecución si no los tiene:
   ```bash
   chmod +x script.sh
   ```
4. Ejecuta el script:
   ```bash
   ./script.sh
   ```

Si el script requiere argumentos o variables de configuración, el `README.md` de su carpeta explicará cómo proporcionarlos.

**Ejemplo — `conectar-windows`:**
- Revisa `conectar-windows/README.md` para dependencias (por ejemplo `xfreerdp`) y ejemplos de uso.

**Buenas prácticas y seguridad:**
- Siempre inspecciona un script antes de ejecutarlo, sobre todo si no lo has escrito tú.
- Evita ejecutar scripts como `root` salvo que sea necesario.
- No incluyas credenciales en texto plano; usa variables de entorno o archivos de configuración con permisos adecuados.

**Contribuir:**
- Haz fork del repositorio, crea una rama descriptiva, y abre un pull request con tus cambios.
- Añade documentación para nuevos scripts y explica dependencias.

**Autor:**
- Emerson Ángel Madrid Herrera

**Licencia:**
- Si deseas publicar con una licencia abierta, añade un archivo `LICENSE` y especifica la licencia elegida.
# 🐚 Colección de scripts Bash

**Descripción:**

Repositorio con una colección de scripts Bash organizados por carpetas para tareas de red, utilidades y automatización. Cada script está pensado para ser reutilizable y fácil de ejecutar.

**Estructura del repositorio:**
- `conectar-windows/` : scripts para conexión vía RDP desde Linux a Windows.
- `herramientas/` : scripts utilitarios (varias herramientas).
- `red/` : scripts relacionados con tareas de red.
- `otros/` : scripts misceláneos.

Cada subcarpeta puede contener su propio `README.md` con instrucciones y requisitos específicos.

**Requisitos generales:**
- Sistema: Linux con `bash`.
- Permisos de ejecución para los scripts (`chmod +x`).
- Dependencias opcionales según script (p. ej. `xfreerdp`, `rdesktop`, `ssh`, `curl`). Consulta el `README.md` de la subcarpeta correspondiente.

**Instalación rápida:**
1. Clona el repositorio (o descarga la carpeta que necesites):
   ```bash
   git clone <url-del-repositorio>
   cd bash
   ```

**Cómo ejecutar un script (pasos recomendados):**
1. Entra en la carpeta que contiene el script:
   ```bash
   cd conectar-windows
   ```
2. Revisa el contenido del script (por seguridad):
   ```bash
   less script.sh
   ```
3. Da permisos de ejecución si no los tiene:
   ```bash
   chmod +x script.sh
   ```
4. Ejecuta el script:
   ```bash
   ./script.sh
   ```

Si el script requiere argumentos o variables de configuración, el `README.md` de su carpeta explicará cómo proporcionarlos.

**Ejemplo — `conectar-windows`:**
- Revisa `conectar-windows/README.md` para dependencias (por ejemplo `xfreerdp`) y ejemplos de uso.

**Buenas prácticas y seguridad:**
- Siempre inspecciona un script antes de ejecutarlo, sobre todo si no lo has escrito tú.
- Evita ejecutar scripts como `root` salvo que sea necesario.
- No incluyas credenciales en texto plano; usa variables de entorno o archivos de configuración con permisos adecuados.

**Contribuir:**
- Haz fork del repositorio, crea una rama descriptiva, y abre un pull request con tus cambios.
- Añade documentación para nuevos scripts y explica dependencias.

**Autor:**
- Emerson Ángel Madrid Herrera

**Licencia:**
- Si deseas publicar con una licencia abierta, añade un archivo `LICENSE` y especifica la licencia elegida.
