#!/bin/bash
# rolhelp.sh - Muestra la ayuda de Rol-Hack

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}╔══════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${NC}          ${YELLOW}ROL-HACK - AYUDA${NC}                   ${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Comandos disponibles:${NC}"
echo ""
echo -e "  ${YELLOW}rolupdate${NC}   Actualiza Termux y el repositorio de Rol-Hack"
echo -e "  ${YELLOW}rolhelp${NC}     Muestra esta ayuda"
echo -e "  ${YELLOW}rolscan${NC}     Escaneo web rápido con gobuster (si está montado el servidor)"
echo -e "  ${YELLOW}rollog${NC}      Muestra las últimas entradas del diario"
echo -e "  ${YELLOW}rolinfo${NC}     Muestra información del laboratorio"
echo ""
echo -e "${GREEN}Scripts disponibles:${NC}"
echo ""
echo -e "  ${YELLOW}recon.sh${NC}    Escaneo de red con nmap (ej: ./scripts/recon.sh 192.168.1.0/24)"
echo -e "  ${YELLOW}webscan.sh${NC}  Escaneo web con gobuster (ej: ./scripts/webscan.sh)"
echo -e "  ${YELLOW}udp_scan.py${NC} Escaneo UDP sin root (limitado por Android)"
echo ""
echo -e "${GREEN}Servidores de práctica:${NC}"
echo ""
echo -e "  ${YELLOW}http.server${NC} Servidor HTTP simple (cd tools/www && python -m http.server 8000)"
echo -e "  ${YELLOW}flask_server${NC} Servidor Flask con login (cd tools/www && python flask_server.py)"
echo ""
echo -e "${CYAN}Repositorio:${NC} https://github.com/beep702/rol-hack"
echo ""
