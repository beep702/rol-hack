# Instalacion de Rol-Hack

Guia paso a paso para replicar el laboratorio en Termux (Android).

## Requisitos

- Termux instalado desde F-Droid (NO desde Play Store, la version de Play Store esta desactualizada).
- Conexion a internet.
- ~500 MB de espacio libre.
- Android 7.0 o superior.

## Instalacion automatica (recomendada)

1. Clonar el repositorio:
   git clone https://github.com/beep702/rol-hack.git

2. Entrar al directorio:
   cd rol-hack

3. Ejecutar el instalador:
   bash install.sh

El instalador hara automaticamente:
- Actualizar Termux
- Instalar herramientas base (git, python, pip, curl, wget, nano, nmap, iproute2, gobuster)
- Instalar Hydra (script de la comunidad)
- Instalar Flask
- Configurar Zsh con autosuggestions
- Anadir alias (rolupdate, rolhelp, rolscan, rollog, rolinfo)
- Anadir banner al .zshrc
- Configurar prompt personalizado

4. (Opcional) Cambiar la shell por defecto a Zsh:
   chsh -s zsh

5. Reiniciar Termux o ejecutar:
   source ~/.zshrc

## Instalacion manual (paso a paso)

Si prefieres instalar manualmente, sigue estos pasos:

### Paso 1: Actualizar Termux
pkg update && pkg upgrade -y

### Paso 2: Instalar herramientas base
pkg install git python python-pip curl wget nano nmap iproute2 -y

### Paso 3: Instalar herramientas de hacking
pkg install gobuster -y
pip install flask

### Paso 4: Instalar Hydra
Hydra no esta en los repos oficiales de Termux. Usar el script incluido:
bash tools/install_hydra.sh

### Paso 5: Clonar el repo
git clone https://github.com/beep702/rol-hack.git
cd rol-hack

### Paso 6: Verificar instalacion
nmap --version
gobuster --version
hydra -h | head -2
python -c "import flask; print(flask.__version__)"

### Paso 7: Configurar Zsh (opcional)
pkg install zsh -y
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

### Paso 8: Anadir alias y banner
Copia el contenido de `.zshrc` de ejemplo (en la raiz del repo) a tu `~/.zshrc`.

## Primeros pasos

Ver docs/uso.md para aprender a usar los scripts y servidores de practica.
