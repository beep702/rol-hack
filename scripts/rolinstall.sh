#!/bin/bash
# rolinstall.sh - Instala herramientas en Rol-Hack
# Uso: rolinstall <herramienta>

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ -z "$1" ]; then
    echo -e "${RED}[!] Uso: rolinstall <herramienta>${NC}"
    echo -e "Ejemplo: rolinstall nmap"
    exit 1
fi

TOOL="$1"

# Verificar si ya está instalada
if command -v "$TOOL" &> /dev/null; then
    echo -e "${GREEN}[+] $TOOL ya está instalada.${NC}"
    exit 0
fi

echo -e "${YELLOW}[*] Instalando $TOOL...${NC}"

case "$TOOL" in
    nmap)
        pkg install nmap -y
        ;;
    gobuster)
        pkg install gobuster -y
        ;;
    dirb)
        pkg install dirb -y
        ;;
    hydra)
        bash "$HOME/rol-hack/tools/install_hydra.sh"
        ;;
    ffuf)
        go install github.com/ffuf/ffuf/v2@latest
        ;;
    sqlmap)
        git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git "$HOME/rol-hack/sqlmap"
        ;;
    nikto)
        git clone https://github.com/sullo/nikto.git "$HOME/rol-hack/nikto"
        cpan install XML::Writer
        ;;
    flask)
        pip install flask
        ;;
    zsh)
        pkg install zsh -y
        ;;
    whois)
        pkg install whois -y
        ;;
    dnsutils)
        pkg install dnsutils -y
        ;;
    *)
        echo -e "${RED}[!] No sé cómo instalar '$TOOL'.${NC}"
        echo -e "Herramientas soportadas: nmap, gobuster, dirb, hydra, ffuf, sqlmap, nikto, flask, zsh, whois, dnsutils"
        exit 1
        ;;
esac

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[+] $TOOL instalada correctamente.${NC}"
else
    echo -e "${RED}[!] Error al instalar $TOOL.${NC}"
fi
