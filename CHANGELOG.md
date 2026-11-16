# Changelog

Todos los cambios notables de Rol-Hack se documentan aqui.

El formato esta basado en Keep a Changelog (https://keepachangelog.com/es/1.0.0/),
y este proyecto adhiere a Semantic Versioning (https://semver.org/lang/es/).

## [Unreleased]

## [1.0.0] - 2026-11-15

### Anadido
- Estructura base del laboratorio (tools/, wordlists/, scans/, notes/, scripts/, loot/, config/)
- README.md con descripcion del proyecto
- .gitignore para excluir datos sensibles
- LICENSE (MIT)
- Documentacion en docs/ (instalacion.md, uso.md)
- Scripts de automatizacion:
  - hola.sh (prueba)
  - recon.sh (auto-recon de red con nmap)
  - webscan.sh (auto-web recon con gobuster)
- Servidores de practica:
  - Servidor HTTP simple (Python http.server)
  - Servidor Flask con login + auth basica
- Wordlists:
  - top5.txt (5 passwords)
  - flask_pass.txt (10 passwords)
  - raft-small-directories.txt (20,115 rutas, ignorada en git)

### Hallazgos de seguridad documentados
- FTP router acepta admin/admin (CRITICO)
- /config/db.conf expone db_pass=secret123 (CRITICO)
- Flask /login acepta admin/admin en 3s sin proteccion anti-fuerza-bruta (CRITICO)
- Header Server expone Python 3.14.10 (info filtrada)

### Herramientas instaladas
- git, python, pip, curl, wget, nano
- nmap, iproute2
- gobuster
- hydra (desde script de la comunidad)
- flask

## [0.1.0] - 2026-11-14

### Anadido
- Inicio del proyecto
- Primeros escaneos (router, telefono)
- Primer script (hola.sh)
