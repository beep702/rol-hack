#!/bin/bash
# rolscan.sh - Escaneo web rápido
URL="${1:-http://127.0.0.1:8000}"
echo "[*] Escaneando $URL..."
gobuster dir -u "$URL" -w ~/rol-hack/wordlists/raft-small-directories.txt -t 20 --no-error
