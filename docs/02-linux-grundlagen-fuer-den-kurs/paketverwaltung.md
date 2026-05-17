# Paketverwaltung

Ubuntu und andere Debian-basierte Distributionen verwenden `apt` für viele Systempakete.

Damit installierst du Werkzeuge wie `curl`, `git`, `tcpdump`, `tshark`, `tree` oder `python3-venv`.

## Paketlisten aktualisieren

```bash
sudo apt update
```

Dieser Befehl installiert noch nichts. Er aktualisiert nur die Informationen darüber, welche Pakete verfügbar sind.

## Pakete installieren

```bash
sudo apt install -y curl git tree
```

Das `-y` bestätigt Rückfragen automatisch.

Für Lernsysteme ist das meist praktisch. Auf Produktivsystemen solltest du bewusster entscheiden.

## Pakete suchen

```bash
apt search wireshark
```

## Informationen zu einem Paket anzeigen

```bash
apt show wireshark
```

## Installierte Version prüfen

```bash
wireshark --version
```

oder:

```bash
tshark --version
```

Nicht jedes Programm unterstützt `--version`, aber viele tun es.

## Paket ist nicht gefunden

Wenn ein Befehl nicht gefunden wird, sieht das oft so aus:

```text
Command 'pip' not found, but can be installed with:
sudo apt install python3-pip
```

Das ist kein ungewöhnlicher Fehler. Das System sagt dir häufig direkt, welches Paket fehlt.

## Python-Pakete im Projekt

Für Python-Projektabhängigkeiten verwenden wir im Kurs nicht das globale System, sondern eine virtuelle Umgebung.

Beispiel:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

Warum?

- keine Vermischung mit Systempaketen
- reproduzierbare Projektumgebung
- leichteres Aufräumen
- weniger Rechteprobleme

## Virtuelle Umgebung verlassen

```bash
deactivate
```

## Wichtige Unterscheidung

| Bereich | Werkzeug | Beispiel |
|---|---|---|
| Betriebssystempakete | `apt` | `sudo apt install wireshark` |
| Python-Projektpakete | `pip` in `.venv` | `python -m pip install mkdocs` |
| Container | Docker | `docker compose up` |

## Empfehlung für diesen Kurs

Installiere Systemwerkzeuge mit `apt`.

Installiere projektspezifische Python-Pakete in der `.venv`.

Installiere nichts mit `sudo pip`.
