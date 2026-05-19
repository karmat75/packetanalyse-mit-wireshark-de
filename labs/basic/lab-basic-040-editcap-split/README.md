# Lab Basic 040: Große Captures handhaben

## Ziel

In diesem Lab übst du den systematischen Umgang mit Capture-Dateien, die zu groß sind,
um sie direkt in Wireshark zu öffnen.

Du lernst:

- mit `capinfos` eine Capture-Datei zu analysieren, ohne sie zu öffnen
- mit `editcap` Zeitfenster aus einer Datei auszuschneiden
- mit `editcap` eine Datei gleichmäßig in Teile aufzuteilen
- mit `tshark -r -Y -w` gezielt nach Protokoll oder Fehlertyp zu filtern
- mit `tshark -z io,stat` die Paketrate über die Zeit zu untersuchen

## Voraussetzungen

Du brauchst:

- Docker
- Docker Compose
- TShark
- Wireshark
- `editcap` (ist Teil des Wireshark-Pakets)
- `capinfos` (ist Teil des Wireshark-Pakets)

Prüfen:

```bash
capinfos --version
editcap --version
tshark --version
```

## Ergebnisdateien

Dieses Lab erzeugt mehrere Dateien:

```text
pcaps/generated/lab-basic-040-source.pcapng         Quell-Capture
pcaps/generated/lab-basic-040-fenster-1.pcapng       Zeitfenster 1
pcaps/generated/lab-basic-040-fenster-2.pcapng       Zeitfenster 2
pcaps/generated/lab-basic-040-split-*.pcapng         Zeit-Splits
pcaps/generated/lab-basic-040-dns-fehler.pcapng      DNS-gefiltert
pcaps/generated/lab-basic-040-tcp-probleme.pcapng    TCP-gefiltert
```

Diese Dateien sollen nicht committed werden.

## Geschätzte Dauer

```text
45 Minuten
```

## Kurskompetenz-Bezug

Dieses Lab übt:

- Capture-Dateiverwaltung
- editcap (Zeitschnitte, gleichmäßige Aufteilung)
- capinfos
- TShark-Filterung und Datei-Export
- systematischer Analyse-Workflow bei fremden oder großen Captures
