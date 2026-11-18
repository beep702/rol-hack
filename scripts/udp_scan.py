#!/usr/bin/env python3
"""udp_scan.py - Escaneo UDP sin root para Rol-Hack (parche PF15)"""
import sys
import types

# === PARCHE PF15: fake rtnetlink module ===
fake_rtnetlink = types.ModuleType("scapy.arch.linux.rtnetlink")
def _sr1_rtrequest(*args, **kwargs):
    raise PermissionError("Blocked kernel bind in Termux")
def read_routes():
    return []
def read_routes6():
    return []
def read_interfaces():
    return {}
def in6_getifaddr():
    return []
def _get_if_list():
    return {}
fake_rtnetlink._sr1_rtrequest = _sr1_rtrequest
fake_rtnetlink.read_routes = read_routes
fake_rtnetlink.read_routes6 = read_routes6
fake_rtnetlink.read_interfaces = read_interfaces
fake_rtnetlink.in6_getifaddr = in6_getifaddr
fake_rtnetlink._get_if_list = _get_if_list
sys.modules["scapy.arch.linux.rtnetlink"] = fake_rtnetlink

# === Ahora importar Scapy ===
from scapy.all import IP, UDP, DNS, DNSQR, sr1, conf

conf.verb = 0

def check_udp(target, port, payload=None, timeout=2, iface="wlan0"):
    pkt = IP(dst=target) / UDP(dport=port)
    if payload:
        pkt = pkt / payload
    try:
        ans = sr1(pkt, timeout=timeout, verbose=0, iface=iface)
        return ans is not None
    except Exception as e:
        return False

def main():
    if len(sys.argv) < 2:
        print(f"Uso: {sys.argv[0]} <IP>")
        sys.exit(1)
    target = sys.argv[1]

    tests = [
        (53,  DNS(rd=1, qd=DNSQR(qname="google.com")), "DNS"),
        (67,  None, "DHCP"),
        (123, None, "NTP"),
        (161, None, "SNMP"),
    ]

    print(f"[*] Escaneando UDP en {target} (interfaz wlan0)...")
    for port, payload, name in tests:
        result = check_udp(target, port, payload)
        status = "ABIERTO" if result else "cerrado/filtrado"
        print(f"  {port}/udp ({name}): {status}")

if __name__ == "__main__":
    main()
