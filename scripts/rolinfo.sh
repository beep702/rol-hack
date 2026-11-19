#!/bin/bash
# rolinfo.sh - Información del laboratorio
echo "=== Rol-Hack - Información ==="
echo ""
echo "Repo:      https://github.com/beep702/rol-hack"
echo "Usuario:   $(whoami)"
echo "Fecha:     $(date)"
echo "Scripts:   $(ls ~/rol-hack/scripts/*.sh 2>/dev/null | wc -l)"
echo "Wordlists: $(ls ~/rol-hack/wordlists/* 2>/dev/null | wc -l)"
echo "Scans:     $(ls ~/rol-hack/scans/* 2>/dev/null | wc -l)"
echo "Diario:    $(wc -l < ~/rol-hack/notes/diario.md 2>/dev/null || echo 0) líneas"
