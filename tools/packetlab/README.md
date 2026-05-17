# packetlab

`packetlab` ist ein kleines lokales Hilfswerkzeug für den Kurs.

Aktuell unterstützt es:

- Quizzes auflisten
- Quizfragen validieren
- Quizzes interaktiv ausführen
- Modulprüfungen auflisten
- Modulprüfungen validieren
- Modulprüfungen interaktiv ausführen
- Fortschritt lokal speichern
- Fortschritt anzeigen
- Fortschritt exportieren

## Beispiele

```bash
python3 tools/packetlab/packetlab.py quiz list
python3 tools/packetlab/packetlab.py quiz validate
python3 tools/packetlab/packetlab.py quiz run foundation
python3 tools/packetlab/packetlab.py quiz run basic --limit 10 --shuffle

python3 tools/packetlab/packetlab.py exam list
python3 tools/packetlab/packetlab.py exam validate
python3 tools/packetlab/packetlab.py exam run module-basic

python3 tools/packetlab/packetlab.py progress
```

Wrapper:

```bash
tools/packetlab/packetlab quiz list
tools/packetlab/packetlab exam run analysis-practice-exam-01
```

## Fortschritt

Der Fortschritt wird lokal gespeichert:

```text
~/.local/share/packetanalyse-mit-wireshark-de/progress.json
```
