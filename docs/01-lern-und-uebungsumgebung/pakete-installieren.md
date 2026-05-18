# Benötigte Pakete installieren

In diesem Schritt installieren wir grundlegende Werkzeuge, die im Kurs immer wieder verwendet werden.

Diese Pakete sind nicht alle direkt Wireshark-spezifisch. Viele davon helfen aber beim Arbeiten mit Git, Markdown, Python, Netzwerkanalyse und Docker.

## System aktualisieren

```bash
sudo apt update
sudo apt upgrade -y
```

## Basispakete installieren

```bash
sudo apt install -y   ca-certificates   curl   wget   gnupg   lsb-release   software-properties-common   apt-transport-https   git   jq   tree   make   unzip   zip   python3   python3-venv   python3-pip   iproute2   net-tools   dnsutils   traceroute   whois
```

## Warum diese Pakete?

| Paket | Zweck im Kurs |
|---|---|
| `curl`, `wget` | HTTP-Anfragen, Downloads, einfache Tests |
| `git` | Kurs-Repository klonen und bearbeiten |
| `jq` | JSON-Ausgaben lesbar filtern |
| `tree` | Verzeichnisstrukturen anzeigen |
| `make` | später einfache Projektbefehle bündeln |
| `python3-venv` | virtuelle Python-Umgebungen erstellen |
| `python3-pip` | Python-Pakete installieren |
| `iproute2` | moderne Linux-Netzwerkbefehle, z. B. `ip` |
| `net-tools` | ältere, aber bekannte Werkzeuge wie `netstat` |
| `dnsutils` | DNS-Werkzeuge wie `dig` und `nslookup` |
| `traceroute` | Pfadermittlung im Netzwerk |
| `whois` | einfache Domain- und IP-Abfragen |

## Test

```bash
git --version
curl --version
dig -v
ip -V
python3 --version
python3-venv --help 2>/dev/null || python3 -m venv --help
```

## Zielzustand

Dieser Schritt ist abgeschlossen, wenn alle Befehle ohne Fehler laufen. Du brauchst:

- `git` zum Verwalten des Kurses
- `curl` oder `wget` für Downloads
- `python3` und `python3-venv` für die Kursdokumentation
- Netzwerktools wie `dig` und `ip`

Im nächsten Schritt wirst du das Kurs-Repository lokal verfügbar machen.
