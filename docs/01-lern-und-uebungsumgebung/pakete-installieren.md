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

## Repository lokal vorbereiten

Bevor du die Python-Umgebung einrichtest, brauchst du eine lokale Kopie des Kurses auf deinem Rechner.

### 1. Einen Arbeitsordner auswählen

Beispiel: Du legst unter deinem Home-Verzeichnis einen Ordner `workspace` an.

```bash
mkdir -p ~/workspace
cd ~/workspace
```

### 2. Repository klonen

```bash
git clone https://github.com/mkargel/packetanalyse-mit-wireshark-de.git
```

### 3. In das Repository wechseln

```bash
cd packetanalyse-mit-wireshark-de
```

Falls das Repository bereits lokal vorhanden ist, reicht Schritt 3.

## Schritt zur Absicherung: Standort prüfen und Linux-Basiskommandos nutzen

Dieser Schritt stellt sicher, dass du wirklich im richtigen Verzeichnis arbeitest.
Gleichzeitig übst du dabei drei wichtige Linux-Basiskommandos: `pwd`, `ls` und `git status`.

```bash
pwd
ls
git status
```

Erwartung:

- Bei `pwd` endet der Pfad auf `packetanalyse-mit-wireshark-de`.
- `ls` zeigt unter anderem `README.md`, `mkdocs.yml`, `docs` und `tools`.
- `git status` zeigt den Zustand des Repositories und keine Meldung wie `not a git repository`.

## Python-Umgebung für die Kursdokumentation

Im Repository wird eine lokale virtuelle Python-Umgebung verwendet.

Im Root-Verzeichnis des Repositories:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

Falls `requirements.txt` noch nicht existiert, kann für den Anfang installiert werden:

```bash
python -m pip install mkdocs mkdocs-material
```

## Test

```bash
python3 --version
python -m pip --version
git --version
curl --version
dig -v
ip -V
```

## Häufiger Fehler: `ensurepip is not available`

Wenn beim Erstellen der virtuellen Umgebung diese Meldung erscheint:

```text
The virtual environment was not created successfully because ensurepip is not available.
```

fehlt meistens das Paket `python3-venv`.

Lösung:

```bash
sudo apt install -y python3-venv python3-pip
rm -rf .venv
python3 -m venv .venv
source .venv/bin/activate
```

## Zielzustand

Dieser Schritt ist abgeschlossen, wenn folgende Befehle erfolgreich laufen:

```bash
python3 -m venv --help
git --version
dig example.org
ip address show
```
