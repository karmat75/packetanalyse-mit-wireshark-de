# Gemischtes Analyse-Quiz

Das gemischte Analyse-Quiz ist eine unabhängige Wiederholung über mehrere Kursbereiche.

Es enthält eigene, szenariobasierte Fragen zu Foundation, Basis-Kurs, erweitertem Kurs, Labs und Analyse-Methodik.

!!! info "Unabhängiges Lernmaterial"
    Dieses Quiz enthält keine offiziellen WCA-Prüfungsfragen, keine nachgestellten Prüfungsfragen und keine Exam Dumps.

    Es ist ein eigenes Lern- und Wiederholungsformat dieses Kurses. Die Fragen sollen Analysefähigkeit trainieren und können bei der Vorbereitung auf prüfungsnahe Situationen helfen.

## Datei

```text
quizzes/questions/analysis-practice.yml
```

## Aktueller Umfang

```text
15 Fragen
```

## Themen

- Wireshark-Funktionen
- Capture-Punkt
- Display Filter
- DNS
- ARP
- TCP
- TLS
- HTTP
- Performance
- Methodik
- Security-Einordnung

## Nutzung

```bash
python3 tools/wwca/wwca.py quiz run analysis-practice --shuffle
```

## Ziel

Dieses Quiz soll nicht auswendig gelernte Definitionen prüfen, sondern eine saubere Analyse-Denkweise trainieren:

- Szenario lesen
- Schicht einordnen
- Beobachtung bewerten
- Aussage nicht überziehen
- Capture-Punkt beachten
- nächste sinnvolle Prüfung ableiten
- eigene Schlussfolgerung begründen

## Abgrenzung

Dieses Quiz ist bewusst nicht als offizielle Prüfungssimulation formuliert.

Es soll helfen, typische Analyseentscheidungen zu üben. Für verbindliche Informationen zu Zertifizierung, Prüfungszielen, Prüfungsablauf und aktuellen Anforderungen müssen immer die offiziellen Informationen des jeweiligen Zertifizierungsanbieters geprüft werden.
