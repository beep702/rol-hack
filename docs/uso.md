# Uso de Rol-Hack

Guia de uso de los scripts y servidores del laboratorio.

## Scripts disponibles

### recon.sh - Auto-recon de red

Escanea una red con nmap y guarda el resultado con fecha.

Uso:
./scripts/recon.sh 192.168.1.0/24

Resultado:
- Archivo en scans/recon_FECHA.txt
- Entrada en notes/diario.md

### webscan.sh - Auto-web recon

Escanea un servidor web con gobuster y guarda el resultado.

Uso:
cd tools/www && python -m http.server 8000   # Terminal 1
./scripts/webscan.sh                          # Terminal 2

Resultado:
- Archivo en scans/webscan_FECHA.txt
- Entrada en notes/diario.md

## Servidores de practica

### Servidor HTTP simple (Python)

cd tools/www && python -m http.server 8000

Rutas disponibles:
- / (home)
- /admin/ (panel admin)
- /backup/ (backups)
- /config/ (credenciales)
- /login/ (formulario)
- /secret/ (flag)
- /uploads/ (archivos)

### Servidor Flask (login + auth)

cd tools/www && python flask_server.py

Rutas:
- GET /           -> Home
- GET /login      -> Formulario
- POST /login     -> Login (admin/admin)
- GET /admin      -> Auth basica (admin/admin)
- GET /api/data   -> JSON

## Fuerza bruta con Hydra

### Contra FTP

hydra -l admin -P wordlists/top5.txt -t 1 -W 3 -f ftp://192.168.1.1

### Contra formulario web (Flask)

hydra -l admin -P wordlists/flask_pass.txt -s 5000 -t 1 -W 3 -f \
  127.0.0.1 http-post-form "/login:user=^USER^&pass=^PASS^:F=Login FAIL"

## Aviso legal

Solo usar contra sistemas propios o con permiso explicito.
