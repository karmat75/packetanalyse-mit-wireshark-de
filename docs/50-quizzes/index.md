# Quizzes

Dieser Bereich sammelt Wiederholungsfragen und Modulprüfungen.

Die Quizzes sind eigene Kursfragen. Sie enthalten keine offiziellen Prüfungsfragen, keine nachgestellten Prüfungsfragen und keine Exam Dumps.

Sie helfen, Wissen, Bedienung und Analysefähigkeit zu festigen.

## Ziel

Quizzes sollen helfen:

- Begriffe zu wiederholen
- typische Denkfehler zu erkennen
- Display Filter sicherer zu verwenden
- Protokolle besser einzuordnen
- Analysefragen unter prüfungsähnlicherem Druck zu beantworten
- Lücken vor Labs und PCAP-Challenges sichtbar zu machen

## Aktuelle Quizbereiche

| Quiz | Inhalt | Datei |
|---|---|---|
| [Foundation-Quiz](foundation-quiz.md) | Umgebung, Wireshark-Oberfläche, TShark, Linux-Grundlagen | `quizzes/questions/foundation.yml` |
| [Basic-Quiz](basic-quiz.md) | Display Filter, Ethernet, ARP, IP, ICMP, UDP, DNS, DHCP, TCP | `quizzes/questions/basic.yml` |
| [Advanced-Quiz](advanced-quiz.md) | TCP Deep Dive, Performance, HTTP/TLS, Methodik, Security | `quizzes/questions/advanced.yml` |
| [Interface-Counter-Quiz](interface-counter-quiz.md) | Errors, Discards, Monitoring-Korrelation und Wireshark-Grenzen | `quizzes/questions/interface-counters.yml` |
| [Gemischtes Analyse-Quiz](analysis-practice-quiz.md) | gemischte szenariobasierte Fragen | `quizzes/questions/analysis-practice.yml` |

## Modulprüfungen

Modulprüfungen ziehen Fragen aus vorhandenen Fragepools.

Siehe:

```text
docs/50-quizzes/modulpruefungen.md
```

Aktuell definiert:

| Exam | Zweck | Datei |
|---|---|---|
| Foundation Check | Grundlagenprüfung | `quizzes/exams/foundation-check.yml` |
| Basic Module | Basis-Kurs-Prüfung | `quizzes/exams/module-basic.yml` |
| Advanced Module | Advanced-Kurs-Prüfung | `quizzes/exams/module-advanced.yml` |
| Gemischter Analyse-Selbsttest 01 | gemischter Selbsttest | `quizzes/exams/analysis-practice-exam-01.yml` |
| Interface Counter Module | Interface-Counter-Praxisblock | `quizzes/exams/module-interface-counters.yml` |

## Aktueller Umfang

```text
Foundation:    12 Fragen
Basic:         18 Fragen
Advanced:      20 Fragen
Interface:     12 Fragen
Analyse-Praxis: 15 Fragen
Gesamt:        77 Fragen
```

## Lokales Quiz-Tool

Die YAML-Fragen können lokal im Terminal ausgeführt werden.

Beispiel:

```bash
python3 tools/packetlab/packetlab.py quiz list
python3 tools/packetlab/packetlab.py quiz run advanced --limit 10 --shuffle
python3 tools/packetlab/packetlab.py exam list
python3 tools/packetlab/packetlab.py exam run module-basic
```

## Keine Exam Dumps

!!! warning "Keine echten Prüfungsfragen"
    Dieser Kurs enthält keine offiziellen Prüfungsfragen, keine nachgestellten Prüfungsfragen und keine Exam Dumps.  
    Die Fragen sind eigene Lernfragen, die auf Verständnis und Analysefähigkeit zielen.

## Geplante Ausbaustufen

| Stufe | Ziel |
|---|---|
| 1 | YAML-Fragen sammeln |
| 2 | einfache lokale Auswertung per Python |
| 3 | Modulprüfungen definieren |
| 4 | Fortschritt lokal speichern |
| 5 | PCAP-basierte Fragen einbinden |
| 6 | gemischten Analyse-Selbsttest ausbauen |
