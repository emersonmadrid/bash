#!/bin/bash

echo "Organizando repositorio..."

# Mover el script principal si está en esta carpeta
if [ -f conectar-windows.sh ]; then
    mv conectar-windows.sh conectar-windows/
    echo "OK: conectar-windows.sh movido a conectar-windows/"
else
    echo "Aviso: conectar-windows.sh no está en la carpeta actual (o ya fue movido)."
fi

# Crear README.md general en la raíz del repo
cat << 'EOF' > README.md
# 🐚 Colección de Scripts Bash de Emerson

Este repositorio contiene varios scripts Bash organizados por carpetas:

- \`conectar-windows/\` → Script para conexión automática vía RDP
- \`herramientas/\` → Scripts utilitarios
- \`red/\` → Scripts relacionados a redes
- \`otros/\` → Scripts varios

Cada carpeta puede contener su propio archivo **README.md** para explicar el propósito de cada script.

## ▶ Cómo ejecutar cualquier script

1. Entra a la carpeta:
   \`\`\`bash
   cd carpeta
   \`\`\`
2. Dale permisos:
   \`\`\`bash
   chmod +x archivo.sh
   \`\`\`
3. Ejecuta:
   \`\`\`bash
   ./archivo.sh
   \`\`\`

## 👨‍💻 Autor
Emerson Ángel Madrid Herrera
EOF

echo "OK: README.md general creado."

# Crear README específico para conectar-windows
cat << 'EOF' > conectar-windows/README.md
# 🖥️ Conectar-Windows (RDP Auto-Discovery desde Linux)

Script Bash que detecta automáticamente la IP de un equipo Windows usando:

1. mDNS (.local) con \`avahi-resolve\`
2. NetBIOS con \`nmblookup\`
3. IP manual si todo falla

Luego abre una sesión RDP con \`xfreerdp\`.

## 🚀 Requisitos

Instalar dependencias:

\`\`\`bash
sudo apt install avahi-utils xfreerdp samba-common-bin
\`\`\`

Opcional:

\`\`\`bash
sudo apt install nbtscan
\`\`\`

## ▶ Uso

Desde la carpeta \`conectar-windows\`:

\`\`\`bash
chmod +x conectar-windows.sh
./conectar-windows.sh
\`\`\`

## 👨‍💻 Autor
Emerson Ángel Madrid Herrera
EOF

echo "OK: README de conectar-windows creado."

echo "Listo. Ahora puedes hacer:"
echo "  git add ."
echo "  git commit -m \"Organizo repo y agrego documentación\""
echo "  git push"
