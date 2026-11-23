#!/bin/bash
# rolremove.sh - Desinstala herramientas de Rol-Hack
# Uso: rolremove <herramienta>

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ -z "$1" ]; then
    echo -e "${RED}[!] Uso: rolremove <herramienta>${NC}"
    echo -e "Ejemplo: rolremove nmap"
    exit 1
fi

TOOL="$1"

# Verificar si está instalada
if ! command -v "$TOOL" &> /dev/null && [ ! -d "$HOME/rol-hack/$TOOL" ]; then
    echo -e "${YELLOW}[!] $TOOL no está instalada.${NC}"
    exit 0
fi

echo -e "${YELLOW}[*] Desinstalando $TOOL...${NC}"

case "$TOOL" in
    nmap|gobuster|dirb|zsh|whois|dnsutils)
        pkg uninstall "$TOOL" -y
        ;;
    hydra)
        pkg uninstall hydra -y 2>/dev/null || rm -f "$PREFIX/bin/hydra" "$PREFIX/bin/pw-inspector"
        ;;
    ffuf)
        rm -f "$HOME/go/bin/ffuf"
        ;;
    sqlmap)
        rm -rf "$HOME/rol-hack/sqlmap"
        ;;
    nikto)
        rm -rf "$HOME/rol-hack/nikto"
        ;;
    flask)
        pip uninstall flask -y
        ;;
    *)
        echo -e "${RED}[!] No sé cómo desinstalar '$TOOL'.${NC}"
        echo -e "Herramientas soportadas: nmap, gobuster, dirb, hydra, ffuf, sqlmap, nikto, flask, zsh, whois, dnsutils"
        exit 1
        ;;
esac

echo -e "${GREEN}[+] $TOOL desinstalada correctamente.${NC}"
