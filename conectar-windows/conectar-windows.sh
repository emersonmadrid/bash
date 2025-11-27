#!/bin/bash

# --------------------------------------------------
# Configuración
# --------------------------------------------------
HOST="DESKTOP-DOCJT49"
NETWORK_PREFIX="192.168.1."
MAX_TRIES=5         # intentos con nmblookup
SLEEP_SECS=1        # segundos entre intentos
DEBUG=false         # ponlo en true para ver más info

# --------------------------------------------------
# Función de log para debug
# --------------------------------------------------
log_dbg() {
    $DEBUG && echo "🐛 $*"
}

echo "🔍 Buscando $HOST en la red (${NETWORK_PREFIX}*)..."
IP=""

# --------------------------------------------------
# 1️⃣ Intentar con mDNS (.local) usando avahi-resolve
# --------------------------------------------------
if command -v avahi-resolve >/dev/null 2>&1; then
    echo "🌐 Intentando resolver por mDNS (.local)..."
    IP_MDNS=$(avahi-resolve -n "${HOST}.local" 2>/dev/null | awk '{print $2}')

    log_dbg "Resultado mDNS crudo: [$IP_MDNS]"

    if [[ -n "$IP_MDNS" && "$IP_MDNS" =~ ^${NETWORK_PREFIX}[0-9]+$ ]]; then
        IP="$IP_MDNS"
        echo "✅ Encontrado por mDNS: $IP"
    else
        echo "❌ mDNS no devolvió una IP válida en ${NETWORK_PREFIX}*"
    fi
else
    echo "ℹ avahi-resolve no está instalado, saltando mDNS."
fi

# --------------------------------------------------
# 2️⃣ Si mDNS falla → intentar con nmblookup
# --------------------------------------------------
if [[ -z "$IP" ]]; then
    if ! command -v nmblookup >/dev/null 2>&1; then
        echo "⚠ nmblookup no está instalado, no se puede usar NetBIOS."
    else
        echo "📡 Intentando con nmblookup (NetBIOS)..."

        for i in $(seq 1 "$MAX_TRIES"); do
            echo "----------------------------------------------"
            echo "🔁 Intento $i con nmblookup..."

            RAW=$(nmblookup "$HOST" 2>/dev/null || true)
            log_dbg "Salida cruda nmblookup:"
            $DEBUG && printf '%s\n' "$RAW"

            # Filtrar solo IPs que empiecen con el prefijo deseado
            IP_NMB=$(printf '%s\n' "$RAW" \
                | awk -v pref="$NETWORK_PREFIX" '$1 ~ "^" pref {print $1; exit}')

            if [[ -n "$IP_NMB" ]]; then
                IP="$IP_NMB"
                echo "✅ Encontrado por nmblookup: $IP"
                break
            else
                echo "➡ IP del intento: [ninguna]"
            fi

            [[ "$i" -lt "$MAX_TRIES" ]] && sleep "$SLEEP_SECS"
        done
    fi
fi

echo "----------------------------------------------"

# --------------------------------------------------
# 3️⃣ Si ambos fallan → pedir IP manual
# --------------------------------------------------
if [[ -z "$IP" ]]; then
    echo "❌ No se pudo obtener la IP de $HOST automáticamente."
    echo "ℹ Puedes ingresar la IP manualmente (ej: ${NETWORK_PREFIX}32)."
    read -rp "👉 IP manual (dejar vacío para cancelar): " IP_MANUAL

    if [[ -z "$IP_MANUAL" ]]; then
        echo "🚪 Cancelando conexión por falta de IP."
        exit 1
    fi

    # Validación simple de formato IPv4
    if [[ "$IP_MANUAL" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        IP="$IP_MANUAL"
        echo "✅ Usando IP manual: $IP"
    else
        echo "⚠ Formato de IP no válido: $IP_MANUAL"
        echo "   Debe ser algo como 192.168.1.32"
        exit 1
    fi
fi

# --------------------------------------------------
# 4️⃣ Pedir credenciales y conectar con xfreerdp
# --------------------------------------------------
read -rp "🔑 Usuario: " USER
read -rsp "🔒 Contraseña: " PASS
echo

echo "🚀 Conectando a $IP..."
xfreerdp /v:"$IP" /u:"$USER" /p:"$PASS" /cert-ignore +clipboard /dynamic-resolution /drive:LinuxShare,"$HOME" &

exit 0
