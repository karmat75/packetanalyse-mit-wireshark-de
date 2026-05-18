# Python-Umgebung einrichten

In diesem Schritt richtest du eine isolierte Python-Umgebung für den Kurs ein.
Das verhindert, dass Kurs-Pakete deine Systeminstallationen beeinflussen.

## Was ist eine virtuelle Umgebung (venv)?

Eine virtuelle Umgebung ist ein eigenständiger Python-Arbeitsbereich.
Du kannst darin Python-Pakete installieren, ohne dein System zu verändern.

**Vorteil**: Du kannst mehrere Projekte mit unterschiedlichen Paket-Versionen parallel haben.

## Schritt 1: In das Repository-Verzeichnis wechseln

Wenn du noch nicht darin bist:

```bash
cd ~/workspace/packetanalyse-mit-wireshark-de
```

Prüfe, dass du im richtigen Verzeichnis bist:

```bash
pwd
```

Der Pfad sollte auf `packetanalyse-mit-wireshark-de` enden.

## Schritt 2: Virtuelle Umgebung erstellen

```bash
python3 -m venv .venv
```

Das erstellt einen Ordner `.venv` im aktuellen Verzeichnis.
Darin sind alle Python-Pakete für diesen Kurs isoliert.

## Schritt 3: Virtuelle Umgebung aktivieren

Unter Linux und macOS:

```bash
source .venv/bin/activate
```

Nach erfolgreicher Aktivierung siehst du `(.venv)` am Anfang deiner Terminal-Zeile.

## Schritt 4: pip aktualisieren

```bash
python -m pip install --upgrade pip
```

Das stellt sicher, dass dein Python-Paket-Manager (pip) aktuell ist.

## Schritt 5: Kurs-Abhängigkeiten installieren

```bash
python -m pip install -r requirements.txt
```

Das installiert alle Pakete, die für die Kursdokumentation nötig sind (z. B. MkDocs).

Falls `requirements.txt` noch nicht existiert oder Fehler auftreten, installiere die Basis-Pakete:

```bash
python -m pip install mkdocs mkdocs-material
```

## Schritt 6: Installation prüfen

```bash
python --version
python -m pip --version
mkdocs --version
```

Alle Befehle sollten Versionsnummern zeigen ohne Fehler.

Wenn die Terminal-Ausgabe dabei zu lang wird, kannst du sie mit `clear` oder `Ctrl + L` leeren.

## Häufiger Fehler: `ensurepip is not available`

Falls beim Erstellen der virtuellen Umgebung diese Meldung erscheint:

```text
The virtual environment was not created successfully because ensurepip is not available.
```

fehlt das Paket `python3-venv`.

**Lösung:**

Virtuelle Umgebung löschen und neu erstellen:

```bash
# Erst aus der venv raus, falls noch aktiv
deactivate 2>/dev/null

# Paket installieren
sudo apt install -y python3-venv python3-pip

# Alte Umgebung löschen
rm -rf .venv

# Neu erstellen
python3 -m venv .venv
source .venv/bin/activate
```

## Virtuelle Umgebung deaktivieren

Wenn du später wieder aus der virtuellen Umgebung aussteigen möchtest:

```bash
deactivate
```

Der `(.venv)` Präfix sollte verschwinden.

## Aktivierung beim nächsten Start

Jedes Mal, wenn du ein neues Terminal öffnest und mit dem Kurs arbeiten möchtest, musst du die virtuelle Umgebung erneut aktivieren:

```bash
cd ~/workspace/packetanalyse-mit-wireshark-de
source .venv/bin/activate
```

Dann siehst du wieder `(.venv)` in der Terminal-Zeile.

## Zielzustand

Dieser Schritt ist abgeschlossen, wenn:

1. Der Ordner `.venv` existiert
2. Die venv aktiviert ist (du siehst `(.venv)` im Terminal)
3. Alle Befehle laufen ohne Fehler: `python --version`, `pip --version`, `mkdocs --version`

Du kannst jetzt die Kursdokumentation lokal bauen und bearbeiten.
