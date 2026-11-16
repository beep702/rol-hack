#!/bin/bash
# webscan.sh - Escaneo web automatico para Rol-Hack
# Uso: ./webscan.sh [URL]
# Ej:  ./webscan.sh http://127.0.0.1:8000

URL="${1:-http://127.0.0.1:8000}"
FECHA=$(date +%Y%m%d_%H%M%S)
ARCHIVO="$HOME/rol-hack/scans/webscan_${FECHA}.txt"
DIARIO="$HOME/rol-hack/notes/diario.md"
WORDLIST="$HOME/rol-hack/wordlists/raft-small-directories.txt"

echo "[*] Escaneando $URL con gobuster..."
gobuster dir -u "$URL" -w "$WORDLIST" -t 20 --no-error -o "$ARCHIVO"

RUTAS=$(grep -c "Status:" "$ARCHIVO" 2>/dev/null || echo "0")
echo "[+] Rutas encontradas: $RUTAS"
echo "[+] Resultado guardado en: $ARCHIVO"
echo "Webscan $URL: $RUTAS rutas encontradas - $ARCHIVO" >> "$DIARIO"
echo "[+] Diario actualizado. Webscan completado."
