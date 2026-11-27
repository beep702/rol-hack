#!/bin/bash
# rolupdate.sh - Actualiza Rol-Hack y Termux
# Uso: rolupdate

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}=== Rol-Hack Update ===${NC}"
echo ""

echo -e "${YELLOW}[*] Actualizando Termux...${NC}"
pkg update -y && pkg upgrade -y
echo -e "${GREEN}[+] Termux actualizado.${NC}"
echo ""

echo -e "${YELLOW}[*] Actualizando Rol-Hack desde GitHub...${NC}"
cd "$HOME/rol-hack" && git pull
echo -e "${GREEN}[+] Repo actualizado.${NC}"
echo ""

echo -e "${GREEN}=== Rol-Hack actualizado correctamente ===${NC}"
echo -e "Fecha: $(date)"
echo ""
# Mostrar banner después de actualizar
"$HOME/rol-hack/scripts/rolbanner.sh"
