# Übungs- und Selbsttestmodell

Dieser Kurs soll nicht nur erklären, sondern Analysefähigkeit trainieren.

Dafür braucht das Projekt ein klares Modell für Übungen, Labs, Quizfragen, Selbsttests und PCAP-Challenges. Dieses Modell ist unabhängig erstellt. Es enthält keine offiziellen Prüfungsfragen, keine Exam Dumps und keine kopierten Trainingsunterlagen.

!!! info "Unabhängiges Kursmodell"
    Die Übungen und Selbsttests dieses Projekts orientieren sich an praktischen Analysekompetenzen.  
    Offizielle Prüfungsinformationen und verbindliche Prüfungsziele müssen immer bei den offiziellen Stellen geprüft werden. Dieses Dokument ersetzt diese Informationen nicht.

## Grundidee

Jedes Thema soll idealerweise vier Stufen bekommen:

```text
Erklären -> Üben -> Prüfen -> Anwenden
```

Beispiel TCP:

| Stufe | Inhalt |
|---|---|
| Erklären | TCP Handshake, Flags, Streams |
| Üben | Lab mit einfachem Webaufruf |
| Prüfen | eigene Quizfragen zu SYN, SYN/ACK, ACK |
| Anwenden | PCAP-Challenge mit Verbindungsproblem |

## Übungstypen

### 1. Leseaufgaben

Ziel:

- Begriffe verstehen
- Zusammenhänge erkennen
- Merksätze aufnehmen
- typische Fehlannahmen vermeiden

### 2. Bedienaufgaben

Ziel:

- Wireshark-Funktionen nutzen
- Oberfläche kennenlernen
- Menüpunkte finden
- Ergebnisse nachvollziehbar dokumentieren

Beispiel:

```text
Öffne Conversations und identifiziere den TCP Stream mit den meisten Bytes.
```

### 3. Filteraufgaben

Ziel:

- Display Filter anwenden
- passende Pakete isolieren
- Filter dokumentieren
- Grenzen des Filters benennen

Beispiel:

```text
Finde alle DNS-Antworten mit einem Response Code ungleich 0.
```

### 4. TShark-Aufgaben

Ziel:

- Analyse reproduzierbar machen
- Filter im Terminal anwenden
- Felder gezielt ausgeben
- Ergebnisse skriptfähig vorbereiten

### 5. Analyseberichte

Ziel:

- Beobachtung und Bewertung trennen
- Frame-Nummern nennen
- Einschränkungen benennen
- nächsten Schritt formulieren
- keine Ursache behaupten, die der Capture nicht belegt

### 6. PCAP-Challenges

Ziel:

- unbekannten Capture analysieren
- mehrere Hinweise kombinieren
- Hypothesen sauber begründen
- Gegenbeispiele und Unsicherheiten benennen

## Lab-Struktur

Jedes Lab soll möglichst gleich aufgebaut sein.

```text
labs/<track>/<lab-id>/
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

## Lab-Metadaten

Jedes Lab bekommt eine maschinenlesbare `metadata.yml`.

Beispiel:

```yaml
id: lab-basic-030-dns-nxdomain
title: "DNS NXDOMAIN analysieren"
track: basic
level: foundation
estimated_time: 30m
course_competencies:
  - dns-analysis
  - display-filtering
  - packet-details-navigation
external_reference_areas:
  - certification-objectives-external-reference-only
tools:
  - wireshark
  - tshark
  - dig
requires:
  - lab-foundation-001-first-capture
outputs:
  - analysis-report
  - quiz
```

Hinweise zu den Feldern:

| Feld | Zweck |
|---|---|
| `course_competencies` | eigene Kompetenz-Tags dieses Kurses |
| `external_reference_areas` | grobe externe Referenzbereiche, ohne offiziellen Wortlaut zu übernehmen |
| `tools` | benötigte Werkzeuge |
| `requires` | fachliche oder technische Voraussetzungen |
| `outputs` | erwartete Arbeitsergebnisse der Lernenden |

## Quizmodell

Quizfragen sollen in YAML oder JSON abgelegt werden.

Geplante Struktur:

```text
quizzes/
├── questions/
│   ├── foundation.yml
│   ├── basic.yml
│   ├── advanced.yml
│   └── analysis-practice.yml
├── exams/
│   ├── module-foundation.yml
│   ├── module-basic.yml
│   ├── module-advanced.yml
│   └── readiness-self-test-01.yml
└── coverage/
    ├── course-competencies.yml
    └── external-reference-map.yml
```

Die Datei `external-reference-map.yml` darf nur grob abbilden, welche eigenen Kurskompetenzen auf welche externen Referenzbereiche einzahlen. Sie soll keine offizielle Objective-Liste nachbauen, übersetzen oder ersetzen.

## Fragetypen

Geplante Fragetypen:

| Typ | Zweck |
|---|---|
| single-choice | eine richtige Antwort |
| multiple-choice | mehrere richtige Antworten |
| true-false | schnelle Begriffsprüfung |
| matching | Begriffe zuordnen |
| ordering | Reihenfolge herstellen |
| filter-task | passenden Filter auswählen |
| pcap-question | Frage zu einem Capture beantworten |
| short-answer | kurze freie Antwort |
| report-task | Analysebericht schreiben |

## Beispiel: Single Choice

```yaml
id: q-basic-tcp-001
type: single-choice
competency: tcp-handshake
question: "Welche Paketfolge beschreibt einen erfolgreichen TCP 3-Way Handshake?"
answers:
  - text: "SYN, SYN/ACK, ACK"
    correct: true
  - text: "SYN, ACK, FIN"
    correct: false
  - text: "RST, SYN, ACK"
    correct: false
  - text: "ACK, SYN, SYN/ACK"
    correct: false
explanation: "Ein TCP-Verbindungsaufbau beginnt mit SYN, SYN/ACK und ACK."
references:
  - docs/10-basis-kurs/06-tcp-grundlagen.md
```

## Selbsttests und Modulprüfungen

Zwischenprüfungen sollen pro Kursblock entstehen:

| Selbsttest | Inhalt |
|---|---|
| Foundation Check | Umgebung, Oberfläche, TShark |
| Basis-Modulprüfung | Ethernet, ARP, IP, ICMP, UDP, DNS, DHCP, TCP-Grundlagen |
| Advanced-Modulprüfung | TCP Deep Dive, Performance, HTTP/TLS, Methodik, Security |
| Prüfungsnaher Selbsttest 01 | gemischte Fragen aus eigenen Kurskompetenzen |
| Prüfungsnaher Selbsttest 02 | gemischte Fragen plus PCAP-Szenarien |

!!! warning "Keine offiziellen Prüfungsfragen"
    Prüfungsnahe Selbsttests in diesem Repository sind eigene Lernkontrollen.  
    Sie dürfen keine echten Prüfungsfragen, keine vertraulichen Inhalte und keine nachgebauten Exam Dumps enthalten.

## Bewertung

Für Kurszwecke reicht eine einfache Bewertung.

| Ergebnis | Bewertung |
|---:|---|
| 90–100 % | sehr sicher |
| 80–89 % | gut vorbereitet |
| 70–79 % | solide, Lücken prüfen |
| 60–69 % | Grundlagen wiederholen |
| unter 60 % | Thema erneut durcharbeiten |

Für PCAP-Challenges ist eine reine Prozentzahl oft zu schwach.

Dort sollte bewertet werden:

- richtige Beobachtungen
- passende Filter
- Frame-Nummern genannt
- Bewertung nachvollziehbar
- Einschränkungen benannt
- keine überzogenen Aussagen

## Lokale Fortschrittsspeicherung

Der Kurs soll ohne zentralen Server funktionieren.

Geplante lokale Speicherung:

```text
~/.local/share/packet-analysis-course-de/progress.json
```

Spätere Alternative:

```text
~/.local/share/packet-analysis-course-de/progress.sqlite
```

Beispielstruktur:

```json
{
  "course_version": "0.1.0",
  "attempts": [
    {
      "id": "module-basic",
      "timestamp": "2026-05-15T10:30:00+02:00",
      "score": 82,
      "passed": true,
      "competencies": ["dns-analysis", "tcp-analysis", "display-filtering"]
    }
  ],
  "completed_labs": [
    "lab-foundation-001-first-capture",
    "lab-basic-030-dns-nxdomain"
  ]
}
```

## Geplantes CLI-Tool

Später kann ein kleines Tool `packetlab` entstehen.

Beispielbefehle:

```bash
packetlab progress
packetlab quiz run basic
packetlab lab check lab-basic-030-dns-nxdomain
packetlab self-test start readiness-self-test-01
packetlab progress export ./mein-fortschritt.json
packetlab progress import ./mein-fortschritt.json
```

Wichtig:

> Fortschritt bleibt lokal beim Lernenden. Kein zentraler Server ist nötig.

## Qualität von Quizfragen

Gute Fragen prüfen Verständnis und Analysefähigkeit.

Schlecht:

```text
Was ist DNS?
```

Besser:

```text
Ein Client fragt `app.example.local` ab und erhält NXDOMAIN.
Welche Aussage ist durch den Capture belegbar?
```

Gute Fragen sollten:

- realistische Situationen verwenden
- nicht künstlich tricksen
- eine klare Begründung enthalten
- auf Kurskapitel verweisen
- keine echten Prüfungsfragen kopieren
- keine vertraulichen Trainingsmaterialien nachbauen
- nicht nur Definitionen abfragen
- eigene Kurskompetenzen trainieren
- bei externen Referenzen nur grob verweisen

## Redaktionelle Prüfpunkte

Vor der Aufnahme neuer Labs, Quizfragen oder Selbsttests sollte geprüft werden:

| Prüffrage | Ziel |
|---|---|
| Ist die Aufgabe selbst formuliert? | kein kopierter Fremdtext |
| Wurde ein eigener Capture oder ein klar lizenzierter Capture verwendet? | saubere PCAP-Rechte |
| Ist die Quelle externer Inhalte dokumentiert? | Nachvollziehbarkeit |
| Wird keine offizielle Objective-Liste nachgebaut? | geringeres Lizenzrisiko |
| Klingt der Test nicht wie offizielles Prüfungsmaterial? | klare Markenabgrenzung |
| Enthält die Lösung nachvollziehbare Begründungen? | didaktischer Wert |

## Nächster praktischer Schritt

Nach diesem Konzept sollten als nächstes entstehen:

```text
labs/foundation/lab-foundation-001-first-capture/
labs/basic/lab-basic-010-display-filter/
labs/basic/lab-basic-020-dns-nxdomain/
quizzes/questions/foundation.yml
quizzes/questions/basic.yml
quizzes/coverage/course-competencies.yml
```

Damit beginnt der Kurs, von einer starken Dokumentation zu einem echten Trainingssystem zu werden.
