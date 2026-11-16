# Rol-Hack

Laboratorio personal de ciberseguridad y hacking etico sobre Termux (Android).

## Que es Rol-Hack

Un entorno de pentesting construido desde cero en Termux, sin root, con
herramientas open source. Documentado paso a paso para que cualquiera pueda
replicarlo.

## Estructura

- `tools/`       Herramientas propias y servidores de practica
- `wordlists/`   Diccionarios (passwords, subdominios, rutas)
- `scans/`       Resultados de escaneos (ignorados en git)
- `notes/`       Apuntes, metodologia, diario del lab
- `scripts/`     Automatizaciones bash
- `loot/`        Archivos obtenidos (ignorados en git)
- `config/`      Configuraciones de herramientas

## Herramientas incluidas

- **Reconocimiento:** nmap, whois, dnsutils
- **Web hacking:** gobuster, curl
- **Fuerza bruta:** hydra
- **Servidores de practica:** python http.server, Flask
- **Utilidades:** git, python, pip, wget, nano

## Instalacion rapida

```bash
# Actualizar Termux
pkg update && pkg upgrade -y

# Herramientas base
pkg install git python python-pip curl wget nano nmap iproute2 -y

# Herramientas de hacking (desde repos oficiales)
pkg install gobuster -y
pip install flask

# Hydra (desde script de la comunidad)
bash ~/rol-hack/tools/install_hydra.sh

# Clonar este repo
git clone https://github.com/TU_USUARIO/rol-hack.git
cd rol-hack
