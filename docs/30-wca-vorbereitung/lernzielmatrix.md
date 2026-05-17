# Kursabdeckungs-Matrix

Diese Matrix zeigt, welche **eigenen Kurskompetenzen** in diesem Repository bereits erklärt, geübt oder prüfungsnah trainiert werden.

Sie dient der internen Kursplanung und der gezielten Vorbereitung auf die WCA-101-Prüfung, ersetzt aber **nicht** die offiziellen Prüfungsziele.

!!! warning "Unabhängige Kursmatrix"
    Diese Seite ist keine Übersetzung, Kopie oder Ersatzfassung der offiziellen WCA-101 Exam Objectives.  
    Für den verbindlichen Wortlaut, die Gewichtungen und die jeweils aktuelle Fassung der Prüfungsziele bitte ausschließlich die offiziellen Informationen der Wireshark Foundation verwenden.

Offizielle Referenz:

- <https://www.wireshark.org/certifications/>
- <https://www.wireshark.org/pdf/wca-objectives.pdf>

## Zweck der Matrix

Die Matrix beantwortet vier praktische Fragen:

1. Welche Fähigkeiten sollen Lernende nach diesem Kurs beherrschen?
2. Wo werden diese Fähigkeiten im Kurs erklärt?
3. Wo werden sie praktisch geübt?
4. Welche Themen sind bereits prüfungsnah trainiert und welche müssen noch ausgebaut werden?

## Was diese Matrix bewusst nicht tut

Diese Matrix enthält bewusst keine vollständige Wiedergabe der offiziellen WCA-101 Objectives.

Sie enthält daher nicht:

- keine vollständige deutsche Übersetzung der offiziellen Prüfungsziele
- keine offiziellen Prozentgewichtungen als eigene Kursstruktur
- keine echten Prüfungsfragen
- keine Exam Dumps
- keine kopierten Schulungsunterlagen

Stattdessen verwendet sie eigene Kompetenzbeschreibungen, eigene Labs, eigene Challenges und eigene Kontrollfragen.

## Statuswerte

| Status | Bedeutung |
|---|---|
| Offen | Thema fehlt weitgehend oder ist nur indirekt vorhanden |
| Erklärt | Thema wird im Kurs beschrieben, aber noch nicht praktisch genug trainiert |
| Teilweise trainiert | Es gibt Übungen, Labs oder Quizfragen, aber noch keine vollständige prüfungsnahe Abdeckung |
| Trainiert | Das Thema hat Erklärung, Lab oder Challenge und Wiederholungsfragen |
| Prüfungsnah | Das Thema wird erklärt, praktisch geübt, wiederholt und in Analyseaufgaben angewendet |

## Abdeckung nach eigenen Kompetenzclustern

Die Spalte **WCA-Referenzbereich** ist nur eine grobe Orientierung für den Abgleich mit den offiziellen Prüfungszielen. Sie gibt bewusst keine offiziellen Unterpunkte wieder.

| Eigener Kompetenzcluster | Lernende sollen danach können | WCA-Referenzbereich | Kursstellen | Praktischer Nachweis | Status |
|---|---|---:|---|---|---|
| Wireshark sicher starten und erste Captures öffnen | vorhandene Mitschnitte laden, Ansichten lesen, erste Pakete untersuchen | 1, 4 | [Erster Kontakt](../03-wireshark-erster-kontakt/index.md), [erstes Capture öffnen](../03-wireshark-erster-kontakt/erstes-capture-oeffnen.md) | [Foundation First Capture](../40-labs-und-uebungen/foundation-first-capture.md), Foundation Quiz | Trainiert |
| Wireshark-Oberfläche sinnvoll nutzen | Paketliste, Paketdetails, Bytes-Ansicht und grundlegende Bedienlogik einordnen | 1, 4 | [Oberfläche verstehen](../03-wireshark-erster-kontakt/oberflaeche-verstehen.md) | Foundation Lab, Foundation Quiz | Trainiert |
| Profile und Spalten zweckmäßig einsetzen | Analyseprofile anlegen, Spalten ergänzen und für Fehlersuche nutzen | 1, 4 | [Profile und Spalten](../03-wireshark-erster-kontakt/profile-und-spalten.md) | [Core Features Lab](../40-labs-und-uebungen/foundation-wireshark-core-features.md) | Trainiert |
| TShark als Ergänzung zur GUI nutzen | Captures und Filter auch ohne grafische Oberfläche nachvollziehbar auswerten | 1, 2, 3 | [TShark erster Kontakt](../03-wireshark-erster-kontakt/tshark-erster-kontakt.md), [TShark ohne GUI](../90-referenz/tshark-auf-systemen-ohne-gui.md) | Lab-Aufgaben, Challenge-Checks | Teilweise trainiert |
| Capture-Ort und Capture-Methode bewerten | entscheiden, ob Endpunkt-, Server-, Mirror-, TAP- oder Mehrpunkt-Capture sinnvoll ist | 2, 6 | [Capture-Grundlagen](../10-basis-kurs/01-capture-grundlagen.md), [Fehleranalyse-Methodik](../20-advanced-kurs/04-fehleranalyse-methodik.md) | Analysefragen in Labs und Challenges | Teilweise trainiert |
| Captures reproduzierbar erzeugen | Mitschnitte starten, begrenzen, speichern und für spätere Analyse nutzbar machen | 2 | [Capture-Grundlagen](../10-basis-kurs/01-capture-grundlagen.md), [Lernumgebung](../01-lern-und-uebungsumgebung/index.md) | Foundation Lab, Docker-Labs | Teilweise trainiert |
| Capture-Qualität einschätzen | erkennen, ob ein Mitschnitt vollständig, passend platziert und für die Fragestellung geeignet ist | 2, 6 | [Fehleranalyse-Methodik](../20-advanced-kurs/04-fehleranalyse-methodik.md), [Interface Errors und Discards](../20-advanced-kurs/06-interface-errors-discards.md) | [Interface Counter Triage](../40-labs-und-uebungen/advanced-interface-counter-triage.md) | Teilweise trainiert |
| Capture- und Display-Filter unterscheiden | wissen, wann vor dem Mitschnitt reduziert wird und wann nachträglich analysiert wird | 3 | [Capture-Grundlagen](../10-basis-kurs/01-capture-grundlagen.md), [Display Filter](../10-basis-kurs/02-display-filter.md) | [Basic Display Filter](../40-labs-und-uebungen/basic-display-filter.md), Basic Quiz | Trainiert |
| Display-Filter methodisch erstellen | Felder finden, Operatoren einsetzen und Filter nachvollziehbar prüfen | 3 | [Display Filter](../10-basis-kurs/02-display-filter.md), [Display Filter Cheatsheet](../90-referenz/display-filter-cheatsheet.md) | Basic Display Filter Lab, Quizfragen | Trainiert |
| Filterergebnisse kritisch bewerten | erkennen, wann ein Filter zu eng, zu breit oder fachlich irreführend ist | 3, 6 | [Display Filter](../10-basis-kurs/02-display-filter.md), [HTTP/TLS](../20-advanced-kurs/03-http-tls.md) | Labs und Challenges | Teilweise trainiert |
| Ethernet-, ARP- und VLAN-Beobachtungen einordnen | lokale Kommunikation, Adressauflösung und Layer-2-Hinweise in Captures erkennen | 5, 6 | [Ethernet, ARP und VLAN](../10-basis-kurs/03-ethernet-arp-vlan.md) | Basic Quiz | Erklärt |
| IPv4-, IPv6- und ICMP-Verkehr analysieren | Adressen, Protokollfelder und einfache Diagnosepakete interpretieren | 5, 6 | [IPv4, IPv6 und ICMP](../10-basis-kurs/04-ipv4-ipv6-icmp.md) | Basic Quiz | Erklärt |
| UDP, DNS und DHCP untersuchen | Namensauflösung, Adressvergabe und UDP-basierte Abläufe nachvollziehen | 5, 6 | [UDP, DNS und DHCP](../10-basis-kurs/05-udp-dns-dhcp.md) | [DNS/HTTP Docker Lab](../40-labs-und-uebungen/basic-dns-http-docker.md), Challenge 001 | Trainiert |
| TCP-Verbindungen grundlegend analysieren | Verbindungsaufbau, Sequenzen, ACKs und einfache Fehlerbilder erkennen | 5, 6 | [TCP-Grundlagen](../10-basis-kurs/06-tcp-grundlagen.md), [TCP Deep Dive](../20-advanced-kurs/01-tcp-deep-dive.md) | [TCP Handshake/Reset Lab](../40-labs-und-uebungen/basic-tcp-handshake-reset.md), Challenge 002 | Trainiert |
| TCP-Performanceprobleme untersuchen | Retransmissions, RTT, Window-Hinweise und Durchsatzprobleme einordnen | 5, 6 | [TCP Deep Dive](../20-advanced-kurs/01-tcp-deep-dive.md), [Performanceanalyse](../20-advanced-kurs/02-performance-analyse.md) | [TCP Retransmission Lab](../40-labs-und-uebungen/advanced-tcp-retransmission.md), Challenge 003, Challenge 006 | Trainiert |
| HTTP- und TLS-Beobachtungen bewerten | einfache Webabläufe, TLS-Indikatoren und typische Analysegrenzen verstehen | 5, 6 | [HTTP/TLS](../20-advanced-kurs/03-http-tls.md) | [HTTP/TLS Lab](../40-labs-und-uebungen/advanced-http-tls.md), Challenge 004 | Trainiert |
| Analyseergebnisse strukturiert dokumentieren | Beobachtung, Bewertung und Empfehlung sauber voneinander trennen | 6 | [Fehleranalyse-Methodik](../20-advanced-kurs/04-fehleranalyse-methodik.md), [Analysebericht-Vorlage](../90-referenz/analysebericht-vorlage.md) | Musterlösungen und Challenge-Berichte | Teilweise trainiert |
| Security-nahe Basismuster erkennen | auffällige Kommunikation beschreiben, ohne aus Wireshark allein falsche Schlüsse zu ziehen | 5, 6 | [Security Basics](../20-advanced-kurs/05-security-basics.md) | [Security Basics Lab](../40-labs-und-uebungen/advanced-security-basics.md), Challenge 005 | Trainiert |
| Monitoring-Daten mit Paketmitschnitten abgleichen | Interface-Counter, Discards, Errors und Retransmissions gemeinsam bewerten | 6 | [Interface Errors und Discards](../20-advanced-kurs/06-interface-errors-discards.md), [Interface Counter Cheatsheet](../90-referenz/interface-counter-cheatsheet.md) | [Interface Counter Triage](../40-labs-und-uebungen/advanced-interface-counter-triage.md), Challenge 007 | Trainiert |

## Abdeckung nach Kursbestandteilen

| Kursbestandteil | Zweck | Aktueller Beitrag zur WCA-nahen Vorbereitung |
|---|---|---|
| Orientierung | Erwartung, Kursgrenzen und rechtliche Abgrenzung klären | wichtig für faire, nicht-offizielle Prüfungsvorbereitung |
| Lern- und Übungsumgebung | reproduzierbare lokale Arbeitsumgebung schaffen | Grundlage für eigene Captures und Labs |
| Wireshark erster Kontakt | Bedienung, Oberfläche und erste Analysefähigkeit aufbauen | Basis für Toolkompetenz |
| Basis-Kurs | zentrale Protokoll- und Filtergrundlagen vermitteln | Fundament für fast alle Analyseaufgaben |
| Advanced-Kurs | Troubleshooting, Performance und Security-nahe Analyse vertiefen | prüfungsnahe Transferleistung |
| Labs und Übungen | Wissen praktisch anwenden | macht aus erklärten Themen trainierte Themen |
| Quizzes | Wiederholung und Selbstkontrolle ermöglichen | stärkt Begriffe, Methodik und typische Denkfehler |
| PCAP-Challenges | unbekannte Situationen analysieren | wichtigster Baustein für echte Analysefähigkeit |
| Referenzbereich | Cheatsheets, Berichtsvorlagen und externe Ressourcen bündeln | unterstützt Wiederholung und Transfer |

## Priorisierte Ausbaupunkte

| Priorität | Ausbaupunkt | Warum wichtig? | Mögliche Umsetzung |
|---:|---|---|---|
| 1 | Mehr Aufgaben zu Wireshark-Kernfunktionen | Bedienfunktionen müssen praktisch sitzen, nicht nur erklärt sein | weiteres Foundation-Lab oder Erweiterung des Core-Features-Labs |
| 2 | Mehr Aufgaben zur Capture-Planung | Viele Analysefehler entstehen durch falsche Mitschnittpunkte | eigenes Lab zu Capture-Strategie und Capture-Qualität |
| 3 | Filter-Fallen ausbauen | falsche Filter führen zu falschen Schlussfolgerungen | Zusatzaufgaben zu Negation, Feldtypen, Mehrfachwerten und generierten Feldern |
| 4 | Protokoll-Labs stärker mit PCAP-Challenges verzahnen | reine Erklärung reicht für Analysefähigkeit nicht aus | zu jedem Basisprotokoll mindestens eine kleine Challenge |
| 5 | Review-Fragen je Kapitel ergänzen | Wiederholung braucht kurze, prüfbare Einheiten | Modulquiz pro Kursabschnitt |
| 6 | Analysebericht konsequent verwenden | Lernende sollen Ergebnisse begründen können | jede größere Challenge mit Kurzbericht abschließen |
| 7 | Quellen- und Lizenzprüfung in Review aufnehmen | schützt das Projekt vor unklaren Fremdinhalten | Review-Checkliste für neue Seiten, Bilder, PCAPs und Quizfragen |

## Review-Kriterien für neue Inhalte

Neue Kursinhalte sollten vor dem Merge gegen diese Fragen geprüft werden:

| Prüffrage | Ziel |
|---|---|
| Ist der Text eigenständig formuliert? | keine ungeprüfte Übernahme externer Texte |
| Wird eine externe Quelle nur verlinkt statt kopiert? | Urheberrechtsrisiko reduzieren |
| Sind Screenshots selbst erstellt oder sauber lizenziert? | Bildrechte klären |
| Sind PCAPs selbst erzeugt, synthetisch oder klar lizenziert? | Datenschutz- und Lizenzrisiken vermeiden |
| Enthält der Inhalt keine echten Prüfungsfragen oder Dumps? | faire Prüfungsvorbereitung sicherstellen |
| Ist klar erkennbar, dass das Projekt unabhängig ist? | Marken- und Verwechslungsrisiko reduzieren |
| Wird praktische Analysefähigkeit trainiert? | Ziel des Kurses sichern |

## Empfohlener Lernpfad

Für Lernende ergibt sich aus der Matrix dieser pragmatische Ablauf:

1. Orientierung lesen
2. Lernumgebung aufbauen
3. Wireshark-Erstkontakt durcharbeiten
4. Basis-Kurs absolvieren
5. Foundation- und Basic-Labs bearbeiten
6. Advanced-Kurs durcharbeiten
7. Advanced-Labs bearbeiten
8. Quizzes und Modulprüfungen nutzen
9. PCAP-Challenges ohne Lösungshinweise bearbeiten
10. Schwächen anhand dieser Matrix gezielt nacharbeiten
11. Vor einer Prüfungsanmeldung die offiziellen WCA-Informationen erneut prüfen

## Pflegehinweise

Diese Matrix sollte aktualisiert werden, wenn:

- neue Kapitel entstehen
- neue Labs oder Challenges hinzukommen
- Quizfragen ergänzt werden
- Kursbereiche umbenannt werden
- sich die offizielle WCA-Struktur ändert
- externe Ressourcen entfernt oder ersetzt werden

Dabei gilt: Die Matrix darf auf offizielle Informationen verweisen, soll deren Inhalt aber nicht als eigene deutschsprachige Ersatzfassung übernehmen.
