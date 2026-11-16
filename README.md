# Rol-Hack

![GitHub last commit](https://img.shields.io/github/last-commit/beep702/rol-hack)
![GitHub repo size](https://img.shields.io/github/repo-size/beep702/rol-hack)
![License](https://img.shields.io/github/license/beep702/rol-hack)
![GitHub stars](https://img.shields.io/github/stars/beep702/rol-hack?style=social)

Laboratorio personal de ciberseguridad y hacking etico sobre Termux (Android).

## Que es Rol-Hack

Un entorno de pentesting construido desde cero en Termux, sin root, con
herramientas open source. Documentado paso a paso para que cualquiera pueda
replicarlo.

## Documentacion

- [Instalacion](docs/instalacion.md) - Guia paso a paso
- [Uso](docs/uso.md) - Como usar los scripts y servidores
- [Changelog](CHANGELOG.md) - Historial de versiones

## Estructura

- tools/       Herramientas propias y servidores de practica
- wordlists/   Diccionarios (passwords, subdominios, rutas)
- scans/       Resultados de escaneos (ignorados en git)
- notes/       Apuntes, metodologia, diario del lab
- scripts/     Automatizaciones bash
- loot/        Archivos obtenidos (ignorados en git)
- config/      Configuraciones de herramientas

## Herramientas incluidas

- Reconocimiento: nmap, whois, dnsutils
- Web hacking: gobuster, curl
- Fuerza bruta: hydra
- Servidores de practica: python http.server, Flask
- Utilidades: git, python, pip, wget, nano

## Scripts

- scripts/hola.sh    - Script de prueba
- scripts/recon.sh   - Auto-recon de red con nmap
- scripts/webscan.sh - Auto-web recon con gobuster

## Uso rapido

Reconocimiento de red:
    ./scripts/recon.sh 192.168.1.0/24

Web scan (con servidor montado):
    cd tools/www && python -m http.server 8000
    ./scripts/webscan.sh

## Aviso legal

Este laboratorio es para aprendizaje etico. Solo se escanean redes y
servidores propios o con permiso explicito. El uso contra sistemas ajenos
es ilegal.

## Creditos

Construido paso a paso como ejercicio de aprendizaje de ciberseguridad.
