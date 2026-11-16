#!/bin/bash
# recon_cron.sh - Wrapper para ejecutar recon.sh en segundo plano
LOG="$HOME/rol-hack/scans/cron_recon.log"
echo "=== Recon automatico: $(date) ===" >> "$LOG"
"$HOME/rol-hack/scripts/recon.sh" >> "$LOG" 2>&1
echo "=== Fin recon: $(date) ===" >> "$LOG"
