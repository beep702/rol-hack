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

# === ACTUALIZAR CONFIGURACIÓN DEL BANNER ===
echo -e "${YELLOW}[*] Actualizando configuración del banner...${NC}"

# Actualizar .zshrc
if [ -f "$HOME/.zshrc" ]; then
    sed -i '/# === Banner de Rol-Hack ===/,/# === Fin Banner ===/d' "$HOME/.zshrc"
    if ! grep -q "rolbanner.sh" "$HOME/.zshrc"; then
        cat >> "$HOME/.zshrc" << 'BANNER_ZSH'
# Banner de Rol-Hack
if [ -d "$HOME/rol-hack" ]; then
  "$HOME/rol-hack/scripts/rolbanner.sh"
fi
BANNER_ZSH
    fi
fi

# Actualizar .bashrc
if [ -f "$HOME/.bashrc" ]; then
    sed -i '/# === Banner de Rol-Hack ===/,/# === Fin Banner ===/d' "$HOME/.bashrc"
    if ! grep -q "rolbanner.sh" "$HOME/.bashrc"; then
        cat >> "$HOME/.bashrc" << 'BANNER_BASH'
# Banner de Rol-Hack
if [ -d "$HOME/rol-hack" ]; then
  "$HOME/rol-hack/scripts/rolbanner.sh"
fi
BANNER_BASH
    fi
fi

echo -e "${GREEN}[+] Banner actualizado.${NC}"
# === FIN ACTUALIZACIÓN BANNER ===

echo -e "${GREEN}=== Rol-Hack actualizado correctamente ===${NC}"
echo -e "Fecha: $(date)"
echo ""
# Mostrar banner después de actualizar
"$HOME/rol-hack/scripts/rolbanner.sh"
