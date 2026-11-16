=== Rol-Hack iniciado ===
Fecha: Sat Nov 14 12:36:44 CST 2026
Estructura base creada. README listo.
Instaladas: git, python, pip, curl, wget, nano
Primer script ejecutable: scripts/hola.sh - funciona correctamente
Escaneo router 192.168.1.1: puertos 21(FTP), 23(Telnet), 80(HTTP) abiertos. Telnet es riesgo CRITICO.
Escaneo telefono 192.168.1.100: 0 puertos abiertos (1000 escaneados). Superficie de ataque minima. OK.
Recon 192.168.1.0/24: 2 hosts vivos - /data/data/com.termux/files/home/rol-hack/scans/recon_20261114_135807.txt
Recon 192.168.1.0/24: 2 hosts vivos - /data/data/com.termux/files/home/rol-hack/scans/recon_20261114_142030.txt
Router identificado como TP-Link (panel WebServer/1.0 UPnP). Puertos 21/23 son demonios embebidos. Accion: desactivar Telnet/FTP, cambiar password, actualizar firmware.
CRITICO: FTP router acepta admin/admin. Cambiando password en panel.
PENDIENTE: cambiar password router admin/admin + desactivar FTP. Motivo: otros usuarios trabajando. Hacer en ventana de mantenimiento.
Gobuster: /admin encontrado (301) en servidor local 8000. Web hacking basico OK.
Curl /admin/ confirmo 200 OK. Header Server revela Python 3.14.10 (info filtrada).
Gobuster wordlist grande: 6 rutas encontradas (login,admin,config,uploads,backup,secret). Critico: /config/db.conf expone db_pass=secret123.
Webscan http://127.0.0.1:8000: 6 rutas encontradas - /data/data/com.termux/files/home/rol-hack/scans/webscan_20261114_205531.txt
Webscan http://127.0.0.1:8000: 6 rutas encontradas - /data/data/com.termux/files/home/rol-hack/scans/webscan_20261115_130459.txt
nmap -sV -sC localhost:8000: SimpleHTTPServer 0.6 Python 3.14.10. Header Server expone version (info filtrada). Sin title en HTML.
nmap http-enum localhost:8000: 7 rutas encontradas (admin, admin/index.html, backup, login, config, secret, uploads). Complementa gobuster.
curl metodos: GET(200), HEAD(200), OPTIONS(501), POST(501), PUT(501). Python http.server solo GET/HEAD. Header Server expuesto en todos.
Flask server: GET / 200, GET /login form, POST /login admin/admin 200 OK, POST /login wrong 401, GET /admin sin auth 401+WWW-Authenticate, GET /admin con auth 200, GET /api/data JSON. Ciclo completo auth web.
HALLAZGO CRITICO: Hydra contra Flask /login encontro admin/admin en 3s. Sin proteccion anti-fuerza-bruta. 10 passwords probadas, 1 valida.
Rol-Hack subido a GitHub: https://github.com/beep702/rol-hack (commit 77fc583 + merge)
Rol-Hack subido a GitHub: https://github.com/beep702/rol-hack (commit e7f151e)
Verificado: .gitignore funciona correctamente en GitHub. Carpetas sensibles (scans/, loot/) NO subidas. Repo publico completo.
Recon 192.168.1.0/24: 3 hosts vivos - /data/data/com.termux/files/home/rol-hack/scans/recon_20261115_224331.txt
CRON: recon_cron.sh programado (0 8 * * *). Primer test manual OK. Detectado nuevo host 192.168.1.104 (3 hosts vivos).
