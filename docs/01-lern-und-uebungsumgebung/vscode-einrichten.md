# VSCode einrichten

VSCode dient in diesem Kurs als zentrale Arbeitsumgebung.

Wir nutzen VSCode für:

- Markdown-Dateien
- Kursdokumentation
- Git-Änderungen
- Docker-Compose-Dateien
- Python-Skripte
- YAML-Metadaten
- DevContainer

## Installation

Für Ubuntu- und Debian-basierte Systeme stellt Microsoft ein `.deb`-Paket bereit.

Die einfache Variante:

1. VSCode von der offiziellen Seite herunterladen: [Visual Studio Code Download](https://code.visualstudio.com/){: target="_blank" rel="nofollow noopener noreferrer" } (extern)
2. `.deb`-Datei öffnen oder per Terminal installieren

Beispiel im Terminal, wenn die Datei im Download-Ordner liegt:

```bash
cd ~/Downloads
sudo apt install ./code_*_amd64.deb
```

Danach prüfen:

```bash
code --version
```

## Repository öffnen

Im Root-Verzeichnis des Kurses:

```bash
cd ~/workspace/packetanalyse-mit-wireshark-de
code .
```

Der Befehl `code .` öffnet den aktuellen Ordner in VSCode.

## Hinweis zum ersten Start

Beim ersten Öffnen von VSCode kann ein Dialog erscheinen, der eine Anmeldung für zusätzliche Funktionen wie KI-Unterstützung anbietet.

Diese Anmeldung ist optional.
Du kannst VSCode auch ohne Login normal verwenden und später jederzeit ein Konto hinzufügen.

Wenn du später KI-Funktionen nutzen möchtest, bist du nicht auf einen einzelnen Anbieter festgelegt.
Über Erweiterungen lassen sich je nach Bedarf unterschiedliche Dienste einbinden.

Für diesen Kurs ist wichtig:

- VSCode funktioniert auch ohne Anmeldung.
- Ein späterer Login ist jederzeit möglich.
- Welche Erweiterungen oder KI-Dienste du nutzt, bleibt deine Entscheidung.

## Empfohlene Erweiterungen

Die folgenden Erweiterungen sind für den Kurs sinnvoll:

| Erweiterung | Zweck |
|---|---|
| Markdown All in One | komfortableres Arbeiten mit Markdown |
| markdownlint | Hinweise zu Markdown-Formatierung |
| Docker | Docker-Dateien und Container besser verwalten |
| Dev Containers | Entwicklungsumgebungen im Container öffnen |
| Python | Python-Skripte und Tests |
| YAML | YAML-Dateien besser bearbeiten |
| GitHub Pull Requests | Pull Requests aus VSCode bearbeiten |
| VSCode Icons | Inuitive Darstellung von Ordnern und Dateien |

Installation per Kommandozeile:

```bash
code --install-extension yzhang.markdown-all-in-one
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-python.python
code --install-extension redhat.vscode-yaml
code --install-extension GitHub.vscode-pull-request-github
code --install-extension vscode-icons-team.vscode-icons
```

## Wichtige Tastenkombinationen

| Aktion | Tastenkombination |
|---|---|
| Terminal öffnen | `Strg` + `Shift` + `` ` `` |
| Markdown-Vorschau öffnen | `Strg` + `Shift` + `V` |
| Befehlspalette öffnen | `Strg` + `Shift` + `P` |
| Datei schnell öffnen | `Strg` + `P` |
| Suche im Projekt | `Strg` + `Shift` + `F` |
| Git-Ansicht öffnen | `Strg` + `Shift` + `G` |

## Empfohlene Arbeitsweise

1. Repository in VSCode öffnen
2. Terminal in VSCode nutzen
3. virtuelle Python-Umgebung aktivieren
4. `mkdocs serve` starten
5. Markdown-Dateien bearbeiten
6. Browser-Vorschau prüfen
7. `git diff` kontrollieren
8. committen und pushen

## Test

Im integrierten Terminal:

```bash
code --version
git status --short
source .venv/bin/activate
mkdocs build
```

## Zielzustand

VSCode ist korrekt eingerichtet, wenn:

- `code .` das Repository öffnet
- das integrierte Terminal funktioniert
- Markdown-Dateien lesbar dargestellt werden
- `mkdocs build` im VSCode-Terminal funktioniert
- Git-Änderungen in VSCode sichtbar sind
