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
    echo "[!] No se encontró tools/install_hydra.sh. Instala Hydra manualmente."
fi

echo "[*] Instalando Flask..."
pip install flask

echo "[*] Configurando Zsh y .zshrc..."
if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi

# Crear .zshrc si no existe
if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
fi

# Añadir source de plugins al .zshrc
grep -q "zsh-autosuggestions.zsh" ~/.zshrc || echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
grep -q "zsh-syntax-highlighting.zsh" ~/.zshrc || echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

# Alias para .zshrc
grep -q "alias rolupdate" ~/.zshrc || echo 'alias rolupdate="$HOME/rol-hack/scripts/rolupdate.sh"' >> ~/.zshrc
grep -q "alias rolhelp" ~/.zshrc || echo 'alias rolhelp="$HOME/rol-hack/scripts/rolhelp.sh"' >> ~/.zshrc
grep -q "alias roltools" ~/.zshrc || echo 'alias roltools="$HOME/rol-hack/scripts/roltools.sh"' >> ~/.zshrc
grep -q "alias rolinstall" ~/.zshrc || echo 'alias rolinstall="$HOME/rol-hack/scripts/rolinstall.sh"' >> ~/.zshrc
grep -q "alias rolremove" ~/.zshrc || echo 'alias rolremove="$HOME/rol-hack/scripts/rolremove.sh"' >> ~/.zshrc
grep -q "alias rolscan" ~/.zshrc || echo 'alias rolscan="$HOME/rol-hack/scripts/rolscan.sh"' >> ~/.zshrc
grep -q "alias rollog" ~/.zshrc || echo 'alias rollog="$HOME/rol-hack/scripts/rollog.sh"' >> ~/.zshrc
grep -q "alias rolinfo" ~/.zshrc || echo 'alias rolinfo="$HOME/rol-hack/scripts/rolinfo.sh"' >> ~/.zshrc

# Banner para .zshrc
if ! grep -q "R O L - H A C K" ~/.zshrc; then
    cat >> ~/.zshrc << 'BANNER_ZSH'
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
  echo -e "\033[0;36m│\033[0m  \033[0;33mHerramientas:\033[0m \033[1;37mroltools\033[0m                     \033[0;36m│\033[0m"
  echo -e "\033[0;36m└────────────────────────────────────────────┘\033[0m"
  echo ""
fi
BANNER_ZSH
fi

# Prompt para .zshrc
grep -q "PROMPT='%F{green}" ~/.zshrc || echo "PROMPT='%F{green}%n%f %F{blue}%~%f %F{red}➜%f '" >> ~/.zshrc

# === CONFIGURACIÓN DE .BASHRC (para usuarios que no usen Zsh) ===
echo "[*] Configurando .bashrc..."

if [ ! -f "$HOME/.bashrc" ]; then
    touch "$HOME/.bashrc"
else
    cp "$HOME/.bashrc" "$HOME/.bashrc.backup.$(date +%Y%m%d%H%M%S)"
fi

# Banner para .bashrc
if ! grep -q "R O L - H A C K" "$HOME/.bashrc"; then
    cat >> "$HOME/.bashrc" << 'BANNER_BASH'
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
  echo -e "\033[0;36m│\033[0m  \033[0;33mHerramientas:\033[0m \033[1;37mroltools\033[0m                     \033[0;36m│\033[0m"
  echo -e "\033[0;36m└────────────────────────────────────────────┘\033[0m"
  echo ""
fi
BANNER_BASH
fi

# Prompt para .bashrc
if ! grep -q "PS1='\\[\\033[0;32m\\]" "$HOME/.bashrc"; then
    echo "PS1='\[\033[0;32m\]\u\[\033[0m\] \[\033[0;34m\]\w\[\033[0m\] \[\033[0;31m\]➜\[\033[0m\] '" >> "$HOME/.bashrc"
fi

# Alias para .bashrc
grep -q "alias rolupdate" "$HOME/.bashrc" || echo 'alias rolupdate="$HOME/rol-hack/scripts/rolupdate.sh"' >> "$HOME/.bashrc"
grep -q "alias rolhelp" "$HOME/.bashrc" || echo 'alias rolhelp="$HOME/rol-hack/scripts/rolhelp.sh"' >> "$HOME/.bashrc"
grep -q "alias roltools" "$HOME/.bashrc" || echo 'alias roltools="$HOME/rol-hack/scripts/roltools.sh"' >> "$HOME/.bashrc"
grep -q "alias rolinstall" "$HOME/.bashrc" || echo 'alias rolinstall="$HOME/rol-hack/scripts/rolinstall.sh"' >> "$HOME/.bashrc"
grep -q "alias rolremove" "$HOME/.bashrc" || echo 'alias rolremove="$HOME/rol-hack/scripts/rolremove.sh"' >> "$HOME/.bashrc"
grep -q "alias rolscan" "$HOME/.bashrc" || echo 'alias rolscan="$HOME/rol-hack/scripts/rolscan.sh"' >> "$HOME/.bashrc"
grep -q "alias rollog" "$HOME/.bashrc" || echo 'alias rollog="$HOME/rol-hack/scripts/rollog.sh"' >> "$HOME/.bashrc"
grep -q "alias rolinfo" "$HOME/.bashrc" || echo 'alias rolinfo="$HOME/rol-hack/scripts/rolinfo.sh"' >> "$HOME/.bashrc"

echo "[+] .bashrc configurado."

# === FIN CONFIGURACIÓN .BASHRC ===

echo "[*] Añadiendo PATH para Go..."
grep -q "export PATH=\$PATH:\$HOME/go/bin" ~/.zshrc || echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.zshrc

echo "[*] Cambiando shell por defecto a Zsh..."
chsh -s zsh

echo ""
echo "[+] Instalación completada."
echo "[+] Reinicia Termux o ejecuta 'source ~/.zshrc' para aplicar los cambios."
echo "[+] Para usar Zsh, cierra y vuelve a abrir Termux."
