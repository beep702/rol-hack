#!/bin/bash
# roltools.sh - Muestra las herramientas del laboratorio por sesiones

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC}              ${YELLOW}ROL-HACK - HERRAMIENTAS DISPONIBLES${NC}              ${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Función para verificar si un comando existe
check_tool() {
    if command -v "$1" &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} $1"
    else
        echo -e "  ${RED}✗${NC} $1 (no instalada)"
    fi
}

echo -e "${YELLOW}[SESIÓN 1] RECONOCIMIENTO DE RED${NC}"
check_tool nmap
check_tool whois
check_tool dnsutils
check_tool iproute2
echo ""

echo -e "${YELLOW}[SESIÓN 2] WEB HACKING${NC}"
check_tool gobuster
check_tool ffuf
check_tool dirb
check_tool curl
check_tool wget
echo ""

echo -e "${YELLOW}[SESIÓN 3] FUERZA BRUTA${NC}"
check_tool hydra
echo ""

echo -e "${YELLOW}[SESIÓN 4] SQL INJECTION${NC}"
if [ -d "$HOME/rol-hack/sqlmap" ]; then
    echo -e "  ${GREEN}✓${NC} sqlmap (clonado en sqlmap/)"
else
    echo -e "  ${RED}✗${NC} sqlmap (no clonado)"
fi
echo ""

echo -e "${YELLOW}[SESIÓN 5] VULNERABILIDADES WEB${NC}"
if command -v nikto &> /dev/null || [ -d "$HOME/rol-hack/nikto" ]; then
    echo -e "  ${GREEN}✓${NC} nikto"
else
    echo -e "  ${RED}✗${NC} nikto (no instalado)"
fi
echo ""

echo -e "${YELLOW}[SESIÓN 6] SERVIDORES DE PRÁCTICA${NC}"
if command -v python &> /dev/null; then
    echo -e "  ${GREEN}✓${NC} python (http.server)"
    echo -e "  ${GREEN}✓${NC} flask (servidor Flask)"
else
    echo -e "  ${RED}✗${NC} python (no instalado)"
fi
echo ""

echo -e "${YELLOW}[SESIÓN 7] UTILIDADES${NC}"
check_tool git
check_tool nano
check_tool zsh
echo ""
