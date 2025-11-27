#!/bin/bash


HOST="DESKTOP-DOCJT49"
NETWORK_PREFIX="192.168.1."

echo "🔍 Buscando $HOST en red $NETWORK_PREFIX*..."

IP=""
for i in {1..5}; do
    echo " Intento $i..."
    
    # Método más preciso - busca IPs que coincidan exactamente con el patrón
    IP=$(nmblookup "$HOST" 2>/dev/null | 
         awk -v pref="$NETWORK_PREFIX" '
            $1 ~ "^" pref "[0-9]+$" {print $1; exit}
         ')
    
    if [ -n "$IP" ]; then
        echo " ✅ Encontrado: $IP"
        break
    fi
    [ $i -lt 5 ] && sleep 1
done

if [ -z "$IP" ]; then
    echo "❌ No encontrado en $NETWORK_PREFIX* después de 5 intentos"
    echo "IPs detectadas:"
    nmblookup "$HOST" 2>/dev/null | grep -E "^[0-9]+\." || echo "   (ninguna)"
    read -rp "Ingresa la IP manualmente: " IP
    [ -z "$IP" ] && exit 1
fi

read -rp "🔑 User: " USER
read -rsp "🔒 Password: " PASS
echo

echo "🚀 Conectando a $IP..."

xfreerdp /v:"$IP" /u:"$USER" /p:"$PASS" /cert-ignore +clipboard /dynamic-resolution /drive:LinuxShare,"$HOME" &
disown
