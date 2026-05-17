# Contributing

Danke, dass du zu **Packetanalyse mit Wireshark – DE** beitragen möchtest.

Dieses Projekt ist ein deutschsprachiger Open-Source-Selbstlernkurs zur Netzwerkanalyse mit Wireshark und TShark. Es unterstützt eine faire, unabhängige WCA-101-Vorbereitung, ist aber kein offizielles Zertifizierungsmaterial.

## Grundsätze

Beiträge sollen:

- fachlich korrekt sein
- auf Deutsch geschrieben sein
- verständlich und didaktisch sauber sein
- eigene Erklärungen, eigene Labs, eigene Quizfragen und eigene Screenshots verwenden
- externe Quellen verlinken, aber nicht als Kurstext übernehmen
- Marken und Produktnamen nur beschreibend verwenden
- keine produktiven oder personenbezogenen Daten enthalten
- keine echten Zugangsdaten, Tokens oder privaten PCAPs enthalten
- mit lokalen Checks geprüft werden
- in kleinen, nachvollziehbaren Pull Requests erfolgen

Der ausführliche Review-Prozess steht hier:

```text
docs/90-referenz/beitragen-und-review.md
```

## Was willkommen ist

Willkommen sind insbesondere:

- Korrekturen an bestehenden Kapiteln
- zusätzliche eigene Erklärungen
- neue Labs mit synthetischen Daten
- neue PCAP-Challenges mit klarer Herkunft
- neue eigene Quizfragen
- bessere Hinweise und Musterlösungen
- neue Referenzen zu offiziellen oder hochwertigen Quellen
- bessere Screenshots aus eigenen Lab-Umgebungen
- Verbesserungen an Tools und CI

Nicht willkommen sind:

- kopierte oder nur leicht umformulierte Fremdtexte
- lokale Kopien offizieller Prüfungsziele, Handbücher, Blogartikel oder Schulungsunterlagen
- offizielle Prüfungsfragen, nachgestellte Prüfungsfragen oder Exam Dumps
- fremde Screenshots, Folien, Buchabbildungen oder Video-Frames ohne klare Erlaubnis
- fremde PCAPs ohne klare Lizenz und Quellenangabe
- Logos oder Markenverwendungen, die einen offiziellen Charakter nahelegen

## Sprache und Stil

Bitte schreibe:

- sachlich
- direkt
- ohne unnötiges Fachchinesisch
- mit deutschen Erklärungen für Lernende
- technische Begriffe nur dort eingedeutscht, wo es sinnvoll ist
- mit klarer Trennung zwischen Beobachtung, Bewertung und Vermutung

Beispiel:

```text
Im Capture sind TCP Retransmissions sichtbar.
```

Besser als:

```text
Das Netzwerk ist kaputt.
```

## Branches

Empfohlen:

```text
feature/<kurzer-name>
fix/<kurzer-name>
docs/<kurzer-name>
lab/<kurzer-name>
challenge/<kurzer-name>
quiz/<kurzer-name>
```

Beispiele:

```text
feature/tshark-cheatsheet
lab/dhcp-basics
challenge/tls-alert-triage
quiz/tcp-flags
fix/display-filter-typo
```

## Commit Messages

Gute Commit Messages:

```text
Add TCP retransmission PCAP challenge
```

```text
Fix markdown fence in TShark cheatsheet
```

```text
Add display filter quiz questions
```

Weniger hilfreich:

```text
update
```

```text
stuff
```

```text
fix
```

## Lokale Prüfung

Vor einem Pull Request bitte ausführen:

```bash
source .venv/bin/activate
bash tools/quality/run_quality_checks.sh
```

Bei Struktur-, Navigations- oder Meta-Doku-Änderungen zusätzlich kurz prüfen:

```text
docs/90-referenz/meta-doku-health-check.md
```

Automatisch bei jedem Commit (empfohlen):

```bash
bash tools/quality/install_git_hooks.sh
```

Damit wird ein versionierter `pre-commit`-Hook aus `.githooks/` aktiviert.

Wichtig: Lokale Git-Hooks sind nicht zentral erzwingbar. Verbindlich wird es über CI-Statuschecks in Pull Requests.

### Verbindliche Durchsetzung in GitHub

Empfohlene Einrichtung (Repository Settings):

1. Unter `Settings -> Branches` eine Branch-Protection-Regel für `main` anlegen.
2. `Require a pull request before merging` aktivieren.
3. `Require status checks to pass before merging` aktivieren.
4. Als Pflichtcheck den Workflow-Job `Quality Checks / quality` auswählen.
5. Optional aktivieren: `Require branches to be up to date before merging`.
6. Optional aktivieren: `Require conversation resolution before merging`.

Damit kann niemand direkt in `main` mergen, wenn `bash tools/quality/run_quality_checks.sh` in CI fehlschlägt.

Mindestens sollte funktionieren:

```bash
mkdocs build --strict
python3 tools/packetlab/packetlab.py quiz validate
python3 tools/packetlab/packetlab.py exam validate
```

## Rechte-, Quellen- und Markencheck

Vor einem Pull Request bitte prüfen:

- Sind alle Erklärtexte selbst geschrieben?
- Werden externe Quellen nur verlinkt oder kurz in eigenen Worten zusammengefasst?
- Sind längere Zitate, kopierte Tabellen oder übersetzte Fremdpassagen vermieden?
- Werden offizielle WCA-101-Ziele nicht übersetzt, vollständig nachgebildet oder lokal gespiegelt?
- Sind Wireshark, WCA und andere Marken nur beschreibend verwendet?
- Wirkt der Beitrag nicht wie offizielles Material der Wireshark Foundation oder eines Trainingsanbieters?
- Haben Screenshots, Bilder und PCAPs eine nachvollziehbare Herkunft?

Details:

```text
docs/90-referenz/externe-ressourcen.md
docs/90-referenz/screenshot-styleguide.md
docs/90-referenz/beitragen-und-review.md
```

## PCAP-Regeln

Nicht committen:

- produktive PCAPs
- PCAPs mit personenbezogenen Daten
- PCAPs mit echten IPs aus sensiblen Umgebungen
- PCAPs mit echten Zugangsdaten
- PCAPs mit echten Tokens, Session-Cookies oder API-Keys
- PCAPs aus Kundensystemen
- PCAPs aus fremden Schulungen, Büchern, Videos oder Kursen
- unklare fremde PCAPs ohne Lizenz und Quellenangabe

Erlaubt:

- synthetische PCAPs
- selbst erzeugte Docker-Lab-PCAPs, sofern sie bewusst freigegeben werden
- öffentliche PCAPs mit klarer Lizenz und Quellenangabe
- lokale generated PCAPs nur zur eigenen Bearbeitung, nicht als Standard-Commit

Standardpfad für lokale Captures:

```text
pcaps/generated/
```

Für jedes committed PCAP muss klar sein:

- woher es stammt
- welche Lizenz oder Freigabe gilt
- welches Lab oder welche Challenge es verwendet
- ob sensible Daten geprüft wurden

## Screenshots und Bilder

Bevorzugter Standard:

- eigene Screenshots
- eigene Lab-Umgebung
- synthetische Daten
- neutraler Bildausschnitt
- Bildnachweis direkt an der verwendeten Stelle

Vor dem Commit prüfen:

- keine echten Hostnamen
- keine echten Benutzer
- keine internen IPs, wenn nicht ausdrücklich erlaubt
- keine URLs aus produktiven oder privaten Umgebungen
- keine Tokens
- keine Passwörter
- keine Cookies oder Session-IDs
- keine privaten Notizen
- keine personenbezogenen Daten
- keine fremden Logos oder Produktgrafiken ohne klare Grundlage

Details siehe:

```text
docs/90-referenz/screenshot-styleguide.md
```

## Labs

Neue Labs sollten enthalten:

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

Wenn ein Lab Docker benötigt, sollte es unterhalb von `docker/compose/` eine eigene Umgebung oder eine dokumentierte Wiederverwendung geben.

Neue Labs sollen eigene Szenarien verwenden und keine fremden Lab-Texte, Schulungsunterlagen oder Aufgabenstellungen nachbauen.

## Challenges

Neue PCAP-Challenges sollten enthalten:

```text
README.md
scenario.md
tasks.md
hints.md
solution.md
metadata.yml
check_tshark.sh
```

Eine Challenge soll weniger führen als ein Lab und mehr Eigenleistung verlangen.

Auch Challenges müssen mit eigenen Szenarien, klarer PCAP-Herkunft und ohne sensible Daten erstellt werden.

## Quizzes und Selbsttests

Quizfragen sollen:

- eindeutig sein
- eine klare richtige Antwort haben
- falsche Antworten plausibel, aber nicht unfair machen
- mit einer kurzen Erklärung versehen sein
- keine reinen Fangfragen sein
- keine offiziellen Prüfungsfragen enthalten
- keine nachgestellten Prüfungsfragen oder Exam-Dump-Inhalte enthalten
- nicht die offiziellen WCA-101-Ziele als Fragenkatalog nachbilden

Nach Änderungen:

```bash
python3 tools/packetlab/packetlab.py quiz validate
python3 tools/packetlab/packetlab.py exam validate
```

## Pull Requests

Ein Pull Request sollte enthalten:

- kurze Beschreibung
- betroffene Bereiche
- durchgeführte Checks
- Hinweise zu Screenshots, Bildern, PCAPs oder Docker-Labs
- Hinweise zu neuen oder geänderten externen Quellen
- offene Punkte

Bitte die Pull-Request-Vorlage verwenden, falls vorhanden.

## Review-Kriterien

Ein Review prüft mindestens:

- baut MkDocs sauber?
- sind Links und Navigation plausibel?
- sind Formulierungen fachlich sauber?
- wird zwischen Beobachtung und Bewertung getrennt?
- sind keine sensiblen Daten enthalten?
- sind Labs/Challenges reproduzierbar?
- sind Check-Skripte ungefährlich und nachvollziehbar?
- sind externe Quellen sauber verlinkt?
- wurden fremde Inhalte nicht übernommen?
- sind Bildnachweise vorhanden?
- ist die Nutzung von Wireshark, WCA und anderen Marken beschreibend?
- enthält der Beitrag keine offiziellen Prüfungsfragen, Exam Dumps oder nachgestellte Prüfungsfragen?

## Lizenz und Quellen

Beiträge müssen mit der Repository-Lizenzierung kompatibel sein:

- Inhalte, Dokumentation, Labs und Quizfragen: CC BY 4.0
- Code und Skripte: MIT
- PCAPs: nur selbst erzeugt, synthetisch oder mit klarer, dokumentierter Lizenz
- Bilder und Screenshots: nur eigene Lab-Screenshots oder externe Bilder mit klarer Nutzungsgrundlage

Mit einem Beitrag bestätigst du, dass du die nötigen Rechte zur Einreichung besitzt.

Bei übernommenem Fremdmaterial müssen Quelle, Lizenz oder Nutzungsgrundlage dokumentiert werden. Bei unklarer Lizenzlage bitte nur verlinken und nichts übernehmen.

Bei neuen Quellen:

- offizielle Quellen bevorzugen
- Lizenz beachten
- keine geschützten Inhalte kopieren
- keine geschützten Inhalte vollständig übersetzen
- keine offiziellen Prüfungszielkataloge lokal nachbauen
- nur kurze Zitate verwenden, wenn nötig
- lieber verlinken und in eigenen Worten zusammenfassen

## Merksatz

> Dieses Projekt soll Lernenden helfen, echte Analysefähigkeit aufzubauen.  
> Jeder Beitrag sollte dieses Ziel unterstützen.
