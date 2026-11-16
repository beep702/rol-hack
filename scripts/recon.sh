#!/bin/bash
# recon.sh - Escaneo automatico de red para Rol-Hack
# Uso: ./recon.sh [rango_red]
# Ej:  ./recon.sh 192.168.1.0/24

RED="${1:-192.168.1.0/24}"
FECHA=$(date +%Y%m%d_%H%M%S)
ARCHIVO="$HOME/rol-hack/scans/recon_${FECHA}.txt"
DIARIO="$HOME/rol-hack/notes/diario.md"

echo "[*] Iniciando reconocimiento de $RED"
echo "[*] Guardando en: $ARCHIVO"

nmap -sn "$RED" -oN "$ARCHIVO"

VIVOS=$(grep -c "Host is up" "$ARCHIVO")
echo "[+] Hosts vivos: $VIVOS"
echo "[+] Archivo guardado: $ARCHIVO"

echo "Recon $RED: $VIVOS hosts vivos - $ARCHIVO" >> "$DIARIO"
echo "[+] Diario actualizado. Recon completado."
