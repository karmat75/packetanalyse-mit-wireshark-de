# Packetanalyse mit Wireshark

Unabhängiger deutschsprachiger Open-Source-Selbstlernkurs zur Netzwerkanalyse mit Wireshark und zur fairen WCA-101-Vorbereitung.

> Dieses Projekt ist ein unabhängiger Selbstlernkurs. Es ist kein offizieller Kurs der Wireshark Foundation, keine offizielle WCA-Vorbereitung, kein Training-Partner-Angebot und nicht durch die Wireshark Foundation zertifiziert, geprüft oder unterstützt. Wireshark und WCA werden ausschließlich beschreibend verwendet. Das Repository enthält keine offiziellen Prüfungsfragen, keine Exam Dumps und keine lokal gespiegelten oder nachgebildeten Zertifizierungsunterlagen.

---

## Ziel des Projekts

Dieses Repository soll einen frei verfügbaren, deutschsprachigen Lernpfad für Netzwerkanalyse mit Wireshark bereitstellen.

Der Kurs richtet sich an Menschen, die bereits erste Kenntnisse im Bereich Netzwerke besitzen, zum Beispiel:

- IP-Adressen und Subnetze
- VLANs
- Verkabelung und Switches
- grundlegende Netzwerkarchitektur
- einfache Fehlersuche im Netzwerkbetrieb

Der Kurs setzt jedoch nicht voraus, dass bereits tiefes Wissen zu Netzwerkprotokollen, Paketaufbau oder TCP/IP-Analyse vorhanden ist.

Ziel ist es, Schritt für Schritt von der Lernumgebung bis zur fortgeschrittenen Paket- und Protokollanalyse zu kommen.

---

## Rechte-, Quellen- und Markenprinzip

Dieser Kurs soll langfristig frei nutzbar und rechtlich sauber bleiben. Deshalb gilt für alle Inhalte:

- eigene Erklärungen statt kopierter Fremdtexte
- eigene Labs, eigene Szenarien und eigene Quizfragen
- eigene Screenshots aus eigenen Laborumgebungen bevorzugen
- externe Quellen verlinken, kurz einordnen und nicht als Kurstext übernehmen
- offizielle WCA-101-Informationen nur als externe Referenz zum Abgleich verwenden
- keine offiziellen Prüfungsfragen, keine nachgestellten Prüfungsfragen und keine Exam Dumps
- Marken, Produktnamen und Logos nur beschreibend verwenden

Ausführliche Regeln stehen in:

- [`CONTRIBUTING.md`](CONTRIBUTING.md)
- [`docs/90-referenz/beitragen-und-review.md`](docs/90-referenz/beitragen-und-review.md)
- [`docs/90-referenz/externe-ressourcen.md`](docs/90-referenz/externe-ressourcen.md)
- [`docs/90-referenz/screenshot-styleguide.md`](docs/90-referenz/screenshot-styleguide.md)

---

## Was dieser Kurs vermitteln soll

Nach Abschluss des Kurses sollen Lernende in der Lage sein:

- Wireshark sicher zu bedienen
- Netzwerkverkehr sinnvoll mitzuschneiden
- Capture- und Display-Filter korrekt einzusetzen
- Ethernet, ARP, IPv4, IPv6, ICMP, UDP, DNS, DHCP, TCP, HTTP und TLS in Captures zu erkennen
- typische Fehlerbilder in Paketmitschnitten zu analysieren
- TCP-Probleme wie Retransmissions, Duplicate ACKs, Window-Probleme und Resets zu bewerten
- zwischen Netzwerk-, Server-, Client- und Applikationsproblemen zu unterscheiden
- Analyseergebnisse nachvollziehbar zu dokumentieren
- sich strukturiert und fair auf WCA-101 vorzubereiten

---

## Zielgruppe

Der Kurs ist besonders geeignet für:

- Netzwerkadministratorinnen und Netzwerkadministratoren
- Systemadministratorinnen und Systemadministratoren
- IT-Support und IT-Operations
- Monitoring- und Infrastruktur-Teams
- Auszubildende und Quereinsteiger mit Netzwerkgrundlagen
- Menschen, die sich strukturiert und fair auf WCA-101 vorbereiten möchten

Der Kurs ist nicht als offensives Security-Training gedacht. Security-nahe Themen werden ausschließlich aus Sicht der defensiven Analyse und Fehlersuche behandelt.

---

## Referenzplattform

Die primäre Lern- und Übungsumgebung basiert auf Linux.

Geplant und empfohlen:

- Ubuntu Desktop LTS
- Pop!_OS als kompatible Ubuntu-basierte Variante
- VSCode
- Docker
- Wireshark
- TShark
- tcpdump
- Python
- Git

Andere Betriebssysteme können funktionieren, werden aber nicht als primärer Lernpfad dokumentiert.

---

## Kursaufbau

Der Kurs ist in mehrere Bereiche unterteilt.

### 1. Lern- und Übungsumgebung

- Ubuntu oder Pop!_OS installieren
- grundlegende Werkzeuge installieren
- VSCode einrichten
- Docker installieren
- Wireshark installieren
- TShark und tcpdump testen
- erstes Lab ausführen
- erste Capture-Datei öffnen

### 2. Basis-Kurs

Der Basis-Kurs vermittelt die Grundlagen der Netzwerkanalyse mit Wireshark.

Themen:

- Wireshark-Oberfläche
- Capture-Dateien
- Capture Filter
- Display Filter
- Ethernet
- ARP
- VLAN-Grundlagen
- IPv4
- IPv6
- ICMP
- UDP
- DNS
- DHCP
- TCP-Grundlagen

### 3. Erweiterter Kurs

Der erweiterte Kurs vertieft die Analyse echter Fehlerbilder.

Themen:

- TCP Deep Dive
- Retransmissions
- Duplicate ACKs
- SACK
- Window Size
- Window Scaling
- Zero Window
- Resets
- Latenz
- Paketverlust
- Performanceanalyse
- HTTP
- TLS
- DNS-Fehleranalyse
- Applikationsprobleme
- Analyseberichte

### 4. WCA-nahe Orientierung

Dieser Abschnitt unterstützt eine eigenständige, faire Vorbereitung auf WCA-101. Er beschreibt, welche Kursbereiche typische Analysekompetenzen trainieren, ersetzt aber weder die offiziellen Prüfungsinformationen noch die offiziellen WCA-101 Objectives.

Inhalte:

- Kursabdeckungs-Matrix auf Basis eigener Kurskompetenzen
- Wiederholungsfragen mit eigenen Formulierungen
- praktische PCAP-Challenges
- Zwischenprüfungen zur Lernkontrolle
- unabhängige Selbsttests ohne offizielle Prüfungsfragen
- prüfungsnahe Lernstrategie
- typische Denkfehler
- Analyse unter Zeitdruck

---

## Repository-Struktur

Aktuelle Struktur des Repositories:

```text
.
├── README.md
├── LICENSE
├── LICENSES/
├── AGENTS.md
├── CONTRIBUTING.md
├── mkdocs.yml
├── PACKAGE_CONTENTS.md
├── challenges/
├── docs/
│   ├── index.md
│   ├── 00-orientierung/
│   ├── 01-lern-und-uebungsumgebung/
│   ├── 02-linux-grundlagen-fuer-den-kurs/
│   ├── 03-wireshark-erster-kontakt/
│   ├── 10-basis-kurs/
│   ├── 20-advanced-kurs/
│   ├── 30-wca-vorbereitung/
│   ├── 40-labs-und-uebungen/
│   ├── 50-quizzes/
│   ├── 60-pcap-challenges/
│   └── 90-referenz/
├── labs/
│   ├── foundation/
│   ├── basic/
│   ├── advanced/
│   └── analysis-practice/
├── quizzes/
│   ├── questions/
│   └── exams/
├── pcaps/
│   ├── generated/
│   └── challenge/
├── docker/
│   └── compose/
├── tools/
│   ├── quality/
│   └── packetlab/
├── templates/
├── overrides/
└── .github/
    ├── workflows/
    └── ISSUE_TEMPLATE/
```

---

## Geplante Lab-Struktur

Jede Übung soll möglichst gleich aufgebaut sein.

```text
labs/basic/lab-basic-030-dns-nxdomain/
├── README.md
├── scenario.md
├── tasks.md
├── hints.md
├── solution.md
├── metadata.yml
├── check.py
└── files/
    └── capture.pcapng
```

Jedes Lab soll enthalten:

- Ziel
- Voraussetzungen
- Szenario
- Aufgaben
- Hinweise
- Musterlösung
- Kurskompetenz-Bezug
- weiterführende Ressourcen
- optional automatisierte Prüfung

---

## Lokale Fortschrittsspeicherung

Der Kurs soll ohne zentralen Server funktionieren.

Geplant ist eine lokale Fortschrittsspeicherung auf dem System der lernenden Person.

Mögliche Funktionen:

```bash
packetlab progress
packetlab quiz run basic-030
packetlab lab check lab-basic-030-dns-nxdomain
packetlab exam run analysis-practice-exam-01
packetlab progress export ./mein-fortschritt.json
packetlab progress import ./mein-fortschritt.json
```

Die Ergebnisse sollen lokal gespeichert und exportierbar sein.

Geplante Speicherorte:

```text
~/.local/share/packetanalyse-mit-wireshark-de/progress.json
```

oder später:

```text
~/.local/share/packetanalyse-mit-wireshark-de/progress.sqlite
```

---

## Externe Ressourcen

Der Kurs soll auf gute externe Ressourcen verweisen, diese aber nicht übernehmen oder lokal nachbilden. Externe Quellen dienen als Vertiefung, Aktualitätsprüfung und weiterführende Referenz.

Geeignete Ressourcentypen:

- offizielle Wireshark-Dokumentation
- Wireshark User Guide
- Wireshark Display Filter Reference
- TShark Manual Page
- SharkFest-Videos
- frei verfügbare Artikel
- öffentlich nutzbare PCAP-Sammlungen mit klarer Lizenz
- ergänzende TCP/IP-Lernmaterialien

Jede Lektion soll möglichst passende Querverweise enthalten. Längere Übernahmen, Übersetzungen, Transkripte, lokale Spiegelungen oder nachgebaute Fassungen externer Inhalte gehören nicht in dieses Repository.

Für offizielle WCA-101-Informationen gilt besonders: Sie werden extern verlinkt und zum Abgleich genutzt, aber nicht vollständig übersetzt, strukturell nachgebildet oder als lokale Ersatzfassung veröffentlicht.

---

## Umgang mit PCAP-Dateien

Paketmitschnitte können sensible, personenbezogene oder sicherheitsrelevante Informationen enthalten.

Deshalb gelten für dieses Repository folgende Regeln:

- keine privaten oder produktiven Captures veröffentlichen
- keine echten Zugangsdaten veröffentlichen
- keine Kundendaten veröffentlichen
- keine personenbezogenen Daten veröffentlichen
- bevorzugt selbst erzeugte Captures aus kontrollierten Labs verwenden
- synthetische Testdaten klar kennzeichnen
- externe Captures nur bei klarer Lizenzlage, dokumentierter Quelle und fachlicher Notwendigkeit aufnehmen
- externe Captures ansonsten nur verlinken
- Security-nahe Captures vor einer Aufnahme besonders kritisch prüfen

---

## Status

Dieses Projekt ist aktiv gepflegt und wird laufend erweitert.

---

## Maintainer-Checkliste (Qualitaet absichern)

Fuer Maintainer und Admins dieses Repositories:

1. CI-Workflow `Quality Checks` ist aktiv und laeuft bei Pull Requests.
2. Unter `Settings -> Branches` ist eine Protection-Regel fuer `main` gesetzt.
3. `Require a pull request before merging` ist aktiv.
4. `Require status checks to pass before merging` ist aktiv.
5. Als Pflichtcheck ist `Quality Checks / quality` gesetzt.
6. (Optional) `Require branches to be up to date before merging` ist aktiv.

Fuer Contributor lokal empfohlen:

```bash
bash tools/quality/install_git_hooks.sh
```

Damit laufen die Repository-Checks automatisch vor jedem Commit.

Details siehe `CONTRIBUTING.md`, `tools/quality/README.md` und `docs/90-referenz/beitragen-und-review.md`.

Bei Pull Requests mit neuen Texten, Bildern, PCAPs, Quizfragen oder externen Quellen ist zusätzlich der Rechte-, Quellen- und Markencheck aus dem Review-Leitfaden zu prüfen.

---

## Schnellstart für Mitwirkende

Repository klonen:

```bash
git clone https://github.com/karmat75/packetanalyse-mit-wireshark-de.git
cd packetanalyse-mit-wireshark-de
```

Projekt in VSCode öffnen:

```bash
code .
```

Optional mit DevContainer öffnen, falls später eine passende Konfiguration ergänzt wird.

Lokale Dokumentation starten:

```bash
mkdocs serve
```

Build prüfen:

```bash
mkdocs build
```

---

## Mitwirken

Beiträge sind willkommen.

Mögliche Beiträge:

- Korrekturen an Texten
- neue Labs
- neue Quizfragen
- neue PCAPs mit sauberer Lizenz
- Verbesserungen an Docker-Labs
- bessere Erklärungen
- Diagramme
- Kurskompetenz-Zuordnung
- technische Prüfskripte
- Übersetzungen und sprachliche Verbesserungen

Bitte beachte:

- keine offiziellen Prüfungsfragen
- keine nachgestellten Prüfungsfragen
- keine Exam Dumps
- keine kopierten Fremdtexte
- keine ungeklärten Screenshots, Logos oder Bilder
- keine privaten Captures
- keine Zugangsdaten
- keine urheberrechtlich problematischen Inhalte

Neue Inhalte sollten vor dem Pull Request gegen `CONTRIBUTING.md` und den Review-Leitfaden geprüft werden.

---

## Schreibstil

Der Kurs soll auf Deutsch geschrieben sein.

Technische Fachbegriffe dürfen zusätzlich mit dem englischen Begriff ergänzt werden.

Beispiele:

- Anzeige-Filter (Display Filter)
- Mitschnitt (Capture)
- Neuübertragung (Retransmission)
- Zeitüberschreitung (Timeout)
- Paketverlust (Packet Loss)
- Rundlaufzeit (Round Trip Time / RTT)

Der Stil soll klar, praktisch und nachvollziehbar sein.

Ziel ist nicht, möglichst akademisch zu klingen, sondern echte Analysefähigkeit aufzubauen.

---

## Lizenz

Dieses Repository verwendet eine gemischte Lizenzierung:

- Inhalte (Dokumentation, Labs, Quiztexte, Aufgaben, Loesungen): **CC BY 4.0**
- Code und Skripte (Python, Bash, Tooling): **MIT**
- Selbst erzeugte PCAPs: **CC BY 4.0**, sofern keine sensiblen Inhalte enthalten sind

Massgeblich ist die Zuordnung in der Datei `LICENSE`.

Wichtige Hinweise:

- Fremdmaterial bleibt unter der jeweiligen Originallizenz.
- Inhalte mit unklarer Lizenz werden nicht übernommen, sondern nur verlinkt.
- Verlinkte externe Inhalte sind nicht Bestandteil der Repository-Lizenz.
- Marken, Produktnamen und Logos (z. B. Wireshark) sind nicht durch diese Lizenz freigegeben.
- Die Lizenz dieses Repositories erlaubt keine Nutzung offizieller Prüfungsunterlagen oder Marken außerhalb der jeweils geltenden Rechte.

---

## Haftungsausschluss

Dieses Projekt dient ausschließlich zu Lern- und Ausbildungszwecken.

Die Nutzung von Wireshark und anderen Analysewerkzeugen darf nur in Netzwerken erfolgen, in denen eine entsprechende Berechtigung vorliegt.

Paketmitschnitte können sensible oder personenbezogene Daten enthalten. Lernende und Mitwirkende sind selbst dafür verantwortlich, rechtliche, organisatorische und datenschutzrechtliche Vorgaben einzuhalten.

---

## Kein offizielles Wireshark- oder WCA-Projekt

Dieses Repository ist ein unabhängiges Open-Source-Projekt.

Es ist nicht offiziell mit der Wireshark Foundation verbunden, nicht von ihr geprüft, nicht von ihr zertifiziert und kein offizielles Training-Partner-Angebot.

Der Kurs ersetzt keine offiziellen Schulungs-, Zertifizierungs- oder Prüfungsunterlagen. Für verbindliche Informationen zur Zertifizierung und zu Prüfungszielen sind ausschließlich die offiziellen Quellen maßgeblich.

Wireshark, WCA und ggf. zugehörige Logos oder Bezeichnungen sind Marken bzw. Bezeichnungen der jeweiligen Rechteinhaber und werden in diesem Repository nur beschreibend verwendet.