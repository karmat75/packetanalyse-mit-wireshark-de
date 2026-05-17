# Beitragen und Review

Dieses Projekt soll offen, nachvollziehbar und sicher weiterentwickelt werden.

Dafür braucht es klare Regeln für Beiträge, Pull Requests, Reviews und Inhalte.

## Ziel

Diese Seite beantwortet:

- Wie sollen Beiträge vorbereitet werden?
- Was muss vor einem Pull Request geprüft werden?
- Welche Inhalte dürfen nicht ins Repository?
- Wie gehen wir mit PCAPs und Screenshots um?
- Wie werden Labs, Challenges und Quizzes ergänzt?
- Was sollte ein Review prüfen?

## Schnellstart für Beiträge

```bash
git checkout -b feature/mein-beitrag
```

Änderungen durchführen.

Dann prüfen:

```bash
source .venv/bin/activate
bash tools/quality/run_quality_checks.sh
```

Commit:

```bash
git add <dateien>
git commit -m "Add meaningful description"
git push
```

Dann Pull Request öffnen.

## Grundsätze

Beiträge sollen:

- fachlich korrekt sein
- auf Deutsch geschrieben sein
- didaktisch verständlich sein
- mit möglichst wenig Annahmen arbeiten
- Quellen sauber behandeln
- fremde Inhalte nicht übernehmen
- Marken und Produktnamen nur beschreibend verwenden
- keine sensiblen Daten enthalten
- lokal geprüft werden
- nicht unnötig groß sein

## Rechte- und Quellenprinzip

Der Standard für dieses Repository ist:

> Eigene Erklärungen, eigene Labs, eigene Quizfragen und eigene Screenshots. Externe Quellen werden verlinkt, nicht kopiert.

Erlaubt ist:

- externe Dokumentation als Quelle zu verlinken
- kurze eigene Zusammenfassungen zu schreiben
- eigene Labs auf Basis eigener Szenarien zu erstellen
- eigene Screenshots aus eigenen Lab-Umgebungen zu verwenden
- öffentliche PCAPs nur bei klarer Lizenz und sauberer Quellenangabe zu referenzieren

Nicht erlaubt ist:

- fremde Texte ganz oder teilweise als eigenen Kurstext zu übernehmen
- offizielle Prüfungsziele vollständig zu übersetzen oder nachzubilden
- offizielle oder fremde Prüfungsfragen zu übernehmen oder nachzustellen
- fremde Screenshots, Folien, Buchabbildungen oder Video-Frames ohne klare Erlaubnis zu verwenden
- Logos oder Marken so einzusetzen, dass ein offizieller Charakter entsteht
- fremde PCAPs ohne Lizenzklärung ins Repository zu legen

Siehe dazu auch:

- [Externe Ressourcen](externe-ressourcen.md)
- [Screenshot-Styleguide](screenshot-styleguide.md)

## Schreibstil

Gut:

```text
Im Capture sind Retransmissions im TCP Stream sichtbar.
```

Nicht gut:

```text
Das Netzwerk ist kaputt.
```

Gut:

```text
Das Muster ist Beacon-ähnlich, beweist ohne Hostkontext aber keine Malware.
```

Nicht gut:

```text
Das ist Malware.
```

## Branch-Namen

Empfohlen:

```text
feature/<name>
fix/<name>
docs/<name>
lab/<name>
challenge/<name>
quiz/<name>
```

Beispiele:

```text
lab/dhcp-basics
challenge/tls-alert-triage
quiz/tcp-flags
fix/mkdocs-navigation
```

## Commit Messages

Gute Commit Messages beschreiben die Änderung.

Gut:

```text
Add HTTP TLS PCAP challenge
```

```text
Fix TShark command in DNS lab
```

```text
Add quiz questions for TCP flags
```

Nicht gut:

```text
update
```

```text
fix
```

```text
more stuff
```

## Pull Request Checkliste

Vor einem Pull Request:

- [ ] Änderung ist thematisch abgeschlossen
- [ ] `mkdocs build --strict` läuft
- [ ] `bash tools/quality/run_quality_checks.sh` läuft
- [ ] Quiz-/Exam-Validierung läuft, falls betroffen
- [ ] keine echten PCAPs enthalten
- [ ] keine Zugangsdaten enthalten
- [ ] keine echten Tokens enthalten
- [ ] keine sensiblen Hostnamen, Benutzernamen, IPs oder URLs enthalten
- [ ] Screenshots geprüft
- [ ] jedes Bild hat einen Bildnachweis oder ist eindeutig als eigener Lab-Screenshot dokumentiert
- [ ] externe Quellen sind verlinkt, aber nicht als Text übernommen
- [ ] offizielle WCA-101-Ziele werden nicht übersetzt, vollständig nachgebildet oder lokal gespiegelt
- [ ] Quizfragen und Selbsttests enthalten keine offiziellen Prüfungsfragen und keine Exam-Dump-Inhalte
- [ ] Wireshark, WCA und andere Marken werden nur beschreibend verwendet
- [ ] Navigation aktualisiert, falls neue Seiten ergänzt wurden
- [ ] `PACKAGE_CONTENTS.md` nur verwenden, wenn ein Paket eingespielt wurde

## PCAP-Regeln

Nicht erlaubt:

- produktive Captures
- Captures mit echten Zugangsdaten
- Captures mit Session-Cookies
- Captures mit API-Keys
- Captures mit personenbezogenen Daten
- Captures aus Kundensystemen
- Captures aus nicht freigegebenen Schulungen, Büchern, Videos oder Kursen
- fremde Captures ohne klare Lizenz

Erlaubt:

- synthetische Captures
- bewusst erzeugte Lab-Captures
- öffentliche Captures mit klarer Lizenz und Quellenangabe
- lokale Captures unter `pcaps/generated/`, wenn sie nicht committed werden

Für jedes committed PCAP muss klar sein:

- woher es stammt
- wer es erstellt hat oder unter welcher Lizenz es steht
- ob es synthetische, öffentliche oder eigene Lab-Daten enthält
- ob sensible Daten geprüft wurden
- welches Lab oder welche Challenge es verwendet

!!! warning "PCAPs sind oft sensibler als sie aussehen"
    Auch scheinbar harmlose Captures können interne Namen, IPs, Tokens, Cookies, Benutzer oder Anwendungsdaten enthalten.

## Screenshot- und Bildregeln

Screenshots dürfen keine sensiblen Daten enthalten.

Der bevorzugte Standard ist:

- eigene Screenshots
- eigene Lab-Umgebung
- synthetische Daten
- neutraler Bildausschnitt
- Bildnachweis direkt an der verwendeten Stelle

Vor dem Commit prüfen:

- Hostnamen
- Benutzernamen
- IP-Adressen
- URLs
- Tokens
- Cookies
- Session-IDs
- Pfade
- private Notizen
- personenbezogene Daten
- Logos, Marken und Produktgrafiken
- Inhalte aus fremden Webseiten, Videos, Kursen, Büchern oder Folien

Wenn nötig:

- neu mit synthetischen Daten erstellen
- sauber maskieren
- lieber Diagramm statt Screenshot verwenden
- externe Abbildung nur verlinken, nicht übernehmen

Jedes Bild braucht einen kurzen Bildnachweis. Für eigene Lab-Screenshots genügt zum Beispiel:

```markdown
<!--
Bildnachweis: eigener Screenshot aus dem Lab dieses Repositories; synthetische Daten; sensible Daten geprüft.
-->
```

Für externe Quellen müssen Quelle, Lizenz/Nutzungsgrundlage, Abrufdatum und Änderungen dokumentiert werden. Details stehen im [Screenshot-Styleguide](screenshot-styleguide.md).

## Labs ergänzen

Neue Labs sollten unter `labs/` liegen und mindestens enthalten:

```text
README.md
scenario.md
tasks.md
hints.md
solution.md
metadata.yml
```

Optional:

```text
check_tshark.sh
```

Ein Lab soll Lernende führen.

Das heißt:

- klare Ausgangslage
- konkrete Aufgaben
- Hinweise bei Bedarf
- Musterlösung
- saubere Bewertung
- keine echten Daten

## PCAP-Challenges ergänzen

Neue Challenges sollten unter `challenges/` liegen und mindestens enthalten:

```text
README.md
scenario.md
tasks.md
hints.md
solution.md
metadata.yml
check_tshark.sh
```

Eine Challenge soll weniger führen als ein Lab.

Sie soll prüfen, ob Lernende selbst:

- relevante Pakete finden
- Filter auswählen
- Frames belegen
- sauber bewerten
- nicht überinterpretieren

## Quizzes ergänzen

Quizfragen sollen:

- eindeutig sein
- eine klare richtige Antwort haben
- eine Erklärung enthalten
- zu einer eigenen Kurskompetenz passen
- keine unnötigen Fangfragen sein
- keine offiziellen Prüfungsfragen enthalten
- keine Exam Dumps nachstellen
- keine fremden Trainingsfragen paraphrasieren

Gute Quizfragen prüfen Verständnis und Analysefähigkeit, nicht Erinnerung an externe Prüfungsfragen.

Nach Änderungen:

```bash
python3 tools/packetlab/packetlab.py quiz validate
```

## Review-Kriterien

Ein Review prüft:

| Bereich | Prüffrage |
|---|---|
| Build | läuft `mkdocs build --strict`? |
| Struktur | liegen Dateien am richtigen Ort? |
| Navigation | ist `mkdocs.yml` aktualisiert? |
| Sprache | ist der Text verständlich und deutsch? |
| Fachlichkeit | sind Aussagen korrekt und vorsichtig? |
| Didaktik | hilft der Abschnitt wirklich beim Lernen? |
| Sicherheit | sind keine sensiblen Daten enthalten? |
| Quellen | sind externe Quellen verlinkt und nicht kopiert? |
| Rechte | sind Bilder, PCAPs und Fremdmaterial sauber geklärt? |
| Marken | wirkt der Beitrag nicht wie offizielles Wireshark-/WCA-Material? |
| WCA-Nähe | werden offizielle Ziele nur grob referenziert und nicht nachgebildet? |
| Reproduzierbarkeit | lassen sich Labs/Challenges nachvollziehen? |
| Tools | laufen Check-Skripte ohne riskante Nebeneffekte? |

## Red Flags im Review

Ein Review sollte besonders aufmerksam werden, wenn ein Beitrag:

- sehr nah am Wortlaut offizieller Dokumentation formuliert ist
- eine vollständige Liste offizieller Prüfungsziele nachbildet
- Screenshots aus Webseiten, Videos, Büchern oder Folien enthält
- fremde PCAPs ohne Lizenzangabe hinzufügt
- Quizfragen als „WCA Practice“, „Exam Questions“ oder ähnlich bezeichnet
- Logos oder Marken prominent als Projektkennzeichen verwendet
- echte interne Namen, IPs, Benutzer oder Systeme zeigt
- Security-Szenarien mit realen Angriffsdaten oder Kundendaten vermischt

In solchen Fällen soll der Beitrag nicht einfach abgelehnt werden. Besser ist:

1. Risiko konkret benennen.
2. Quelle oder Herkunft erfragen.
3. Eigene Formulierung, eigenes Lab oder neutrale Alternative vorschlagen.
4. Erst nach Klärung mergen.

## Was nicht in ein Review gehört

Nicht jedes Review muss den Kurs neu erfinden.

Nicht hilfreich:

```text
Ich hätte alles anders strukturiert.
```

Hilfreich:

```text
In Aufgabe 6 fehlt der Hinweis, wie der TCP Stream Index gefunden wird.
```

Nicht hilfreich:

```text
Das ist schlecht.
```

Hilfreich:

```text
Die Aussage „Firewall blockt“ ist zu stark. Besser wäre: „Aus Sicht des Capture-Punkts ist keine Antwort sichtbar.“
```

## Umgang mit externen Quellen

Bevorzugt:

- offizielle Wireshark-Dokumentation
- Wireshark Wiki
- hochwertige Fachartikel
- seriöse Videos mit fachlichem Bezug
- RFCs, wenn sie Lernenden wirklich helfen
- offizielle Herstellerdokumentation, wenn ein Tool erklärt wird

Externe Quellen sollen helfen, Aussagen zu prüfen oder Lernenden weiterführende Informationen zu geben. Sie sind aber kein Textbaukasten für Kursinhalte.

Erwünscht:

- Link auf die Quelle
- kurze eigene Einordnung
- Hinweis, warum die Quelle hilfreich ist
- Abrufdatum bei besonders veränderlichen Inhalten

Nicht erwünscht:

- kopierte Inhalte
- unklare Lizenzen
- lange Zitate
- lokale Spiegelung fremder Dokumente
- übersetzte Ersatzfassungen offizieller Dokumente
- tote Links ohne Mehrwert
- SEO-Spam

## Umgang mit offiziellen Prüfungsinformationen

Offizielle Prüfungsinformationen, insbesondere zu WCA-101, dürfen verlinkt und als externe Referenz genannt werden.

Nicht in dieses Repository gehören:

- vollständige Übersetzungen offizieller Prüfungsziele
- eigene Kopien offizieller Objective-Dokumente
- nachgebaute offizielle Objective-Tabellen
- echte oder nachgestellte offizielle Prüfungsfragen
- Inhalte aus kostenpflichtigem oder geschütztem Training

Erlaubt ist eine eigene Kursabdeckung, zum Beispiel:

```text
Diese Übung trainiert TCP-Analyse, Filterarbeit und saubere Befundformulierung.
Für den verbindlichen Prüfungsumfang bitte die offiziellen WCA-101-Informationen prüfen.
```

Nicht gut:

```text
Hier ist die deutsche Version der offiziellen WCA-101 Objectives.
```

## Umgang mit Fehlern

Fehler sind normal.

Wichtig ist:

- nachvollziehbar beschreiben
- kleine Korrektur erstellen
- lokale Checks laufen lassen
- PR öffnen
- Review ernst nehmen

## Merksatz

> Beiträge sollen den Kurs besser, sicherer und verständlicher machen.  
> Nicht größer um jeden Preis.
