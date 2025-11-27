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
