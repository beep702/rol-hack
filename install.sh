#!/bin/bash
# install.sh - Configura Rol-Hack en un Termux nuevo
# Uso: bash install.sh

echo "[*] Instalando dependencias de Termux..."
pkg update -y && pkg upgrade -y
pkg install -y git python python-pip curl wget nano nmap iproute2 gobuster zsh termux-api

echo "[*] Instalando Hydra (script de la comunidad)..."
if [ -f "tools/install_hydra.sh" ]; then
    bash tools/install_hydra.sh
else
    echo "[!] No se encontró tools/install_hydra.sh. Instala Hydra manualmente si lo necesitas."
fi

echo "[*] Instalando Flask..."
pip install flask

echo "[*] Configurando Zsh (opcional)..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # Instalación básica de Zsh y autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
    echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
    echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
fi

echo "[*] Configurando alias y banner..."
# Añadir alias al .zshrc si no existen
grep -q "alias rolupdate" ~/.zshrc || echo 'alias rolupdate="$HOME/rol-hack/scripts/rolupdate.sh"' >> ~/.zshrc
grep -q "alias rolhelp" ~/.zshrc || echo 'alias rolhelp="$HOME/rol-hack/scripts/rolhelp.sh"' >> ~/.zshrc
grep -q "alias rolscan" ~/.zshrc || echo 'alias rolscan="$HOME/rol-hack/scripts/rolscan.sh"' >> ~/.zshrc
grep -q "alias rollog" ~/.zshrc || echo 'alias rollog="$HOME/rol-hack/scripts/rollog.sh"' >> ~/.zshrc
grep -q "alias rolinfo" ~/.zshrc || echo 'alias rolinfo="$HOME/rol-hack/scripts/rolinfo.sh"' >> ~/.zshrc

# Añadir banner al .zshrc (versión simple para el instalador)
if ! grep -q "R O L - H A C K" ~/.zshrc; then
    cat >> ~/.zshrc << 'BANNER'
if [ -d "$HOME/rol-hack" ]; then
  echo ""
  echo -e "\033[0;36m╔══════════════════════════════════════════════╗\033[0m"
  echo -e "\033[0;36m║          \033[1;37mR O L - H A C K\033[0;36m                     ║\033[0m"
  echo -e "\033[0;36m║          \033[0;33mTermux Pentesting Lab\033[0;36m                ║\033[0m"
  echo -e "\033[0;36m║          \033[0;32mDesarrollado por beep702\033[0;36m              ║\033[0m"
  echo -e "\033[0;36m╚══════════════════════════════════════════════╝\033[0m"
  echo ""
fi
BANNER
fi

echo "[*] Configurando prompt de Zsh..."
grep -q "PROMPT='%F{green}" ~/.zshrc || echo "PROMPT='%F{green}%n%f %F{blue}%~%f %F{red}➜%f '" >> ~/.zshrc

echo "[+] Instalación completada. Reinicia Termux o ejecuta 'source ~/.zshrc' para aplicar los cambios."
echo "[+] Recuerda cambiar la shell a Zsh con: chsh -s zsh"
# === CONFIGURACIÓN AUTOMÁTICA DE ZSH Y BANNER ===
echo "[*] Configurando Zsh y banner personalizado..."

# 1. Instalar Zsh si no está
if ! command -v zsh &> /dev/null; then
    pkg install zsh -y
fi

# 2. Crear el .zshrc si no existe, o hacer backup si ya existe
if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
else
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d%H%M%S)"
fi

# 3. Añadir tu banner (el mismo que tienes en tu .zshrc actual)
if ! grep -q "R O L - H A C K" "$HOME/.zshrc"; then
    cat >> "$HOME/.zshrc" << 'BANNER'
if [ -d "$HOME/rol-hack" ]; then
  echo ""
  echo -e "\033[0;36m"
  echo "    ██████╗  ██████╗ ██╗         ██╗  ██╗ █████╗  ██████╗██╗  ██╗"
  echo "    ██╔══██╗██╔═══██╗██║         ██║  ██║██╔══██╗██╔════╝██║ ██╔╝"
  echo "    ██████╔╝██║   ██║██║         ███████║███████║██║     █████╔╝ "
  echo "    ██╔══██╗██║   ██║██║         ██╔══██║██╔══██║██║     ██╔═██╗ "
  echo "    ██║  ██║╚██████╔╝███████╗    ██║  ██║██║  ██║╚██████╗██║  ██╗"
  echo "    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝"
  echo -e "\033[0m"
  echo -e "\033[0;33mPentesting & Desarrollo\033[0m"
  echo -e "\033[0;32mDesarrollado por: beep702\033[0m"
  echo ""
  echo -e "\033[0;36m┌────────────────────────────────────────────┐\033[0m"
  echo -e "\033[0;36m│\033[0m  \033[0;33mActualizar:\033[0m  \033[1;37mrolupdate\033[0m                    \033[0;36m│\033[0m"
  echo -e "\033[0;36m│\033[0m  \033[0;33mAyuda:\033[0m       \033[1;37mrolhelp\033[0m                      \033[0;36m│\033[0m"
  echo -e "\033[0;36m└────────────────────────────────────────────┘\033[0m"
  echo ""
fi
BANNER
fi

# 4. Añadir tu prompt personalizado
if ! grep -q "PROMPT='%F{green}" "$HOME/.zshrc"; then
    echo "PROMPT='%F{green}%n%f %F{blue}%~%f %F{red}➜%f '" >> "$HOME/.zshrc"
fi

# 5. Añadir alias (por si acaso no se cargaron antes)
grep -q "alias rolupdate" "$HOME/.zshrc" || echo 'alias rolupdate="$HOME/rol-hack/scripts/rolupdate.sh"' >> "$HOME/.zshrc"
grep -q "alias rolhelp" "$HOME/.zshrc" || echo 'alias rolhelp="$HOME/rol-hack/scripts/rolhelp.sh"' >> "$HOME/.zshrc"
grep -q "alias rolscan" "$HOME/.zshrc" || echo 'alias rolscan="$HOME/rol-hack/scripts/rolscan.sh"' >> "$HOME/.zshrc"
grep -q "alias rollog" "$HOME/.zshrc" || echo 'alias rollog="$HOME/rol-hack/scripts/rollog.sh"' >> "$HOME/.zshrc"
grep -q "alias rolinfo" "$HOME/.zshrc" || echo 'alias rolinfo="$HOME/rol-hack/scripts/rolinfo.sh"' >> "$HOME/.zshrc"

# 6. Cambiar la shell por defecto a Zsh
echo "[*] Cambiando shell por defecto a Zsh..."
chsh -s zsh

echo "[+] Configuración de Zsh completada."
# === FIN CONFIGURACIÓN ZSH ===
