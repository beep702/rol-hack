# Instalacion de Rol-Hack

Guia paso a paso para replicar el laboratorio en Termux (Android).

## Requisitos

- Termux instalado desde F-Droid (NO desde Play Store, la version de Play Store esta desactualizada).
- Conexion a internet.
- ~500 MB de espacio libre.
- Android 7.0 o superior.

## Paso 1: Actualizar Termux

pkg update && pkg upgrade -y

## Paso 2: Instalar herramientas base

pkg install git python python-pip curl wget nano nmap iproute2 -y

## Paso 3: Instalar herramientas de hacking

pkg install gobuster -y
pip install flask

## Paso 4: Instalar Hydra

Hydra no esta en los repos oficiales de Termux. Usar el script incluido:

bash tools/install_hydra.sh

## Paso 5: Clonar el repo

git clone https://github.com/beep702/rol-hack.git
cd rol-hack

## Paso 6: Verificar instalacion

nmap --version
gobuster --version
hydra -h | head -2
python -c "import flask; print(flask.__version__)"

## Paso 7: Primeros pasos

Ver docs/uso.md para aprender a usar los scripts y servidores de practica.
