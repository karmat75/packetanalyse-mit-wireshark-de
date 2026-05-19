# TAP vs. SPAN/Mirror-Port

## Kurzfassung

Ein TAP (Test Access Point) ist ein passiver Abgriffpunkt im Netzwerk.

Er wird physisch zwischen zwei Geräten eingeschleift und kopiert den Verkehr für die Analyse.

Für Netzwerkanalyse ist ein TAP oft die sauberste Quelle, weil der Mitschnitt unabhängig von
Switch-Mirror-Konfigurationen und deren Lastgrenzen ist.

## Was ist ein TAP?

Ein TAP ist ein eigenständiges Hardware-Gerät oder eine TAP-Funktion in einer Netzwerkkomponente,
die den Datenstrom einer Verbindung repliziert.

Typischer Einsatz:

```text
Switch <-> TAP <-> Firewall
                 |
                 +-> Analyse-Port (Wireshark/TShark)
```

Der Produktivverkehr läuft normal weiter. Das Analysegerät erhält eine Kopie.

## Warum ist der Mitschnitt oft „sauberer"?

Im Vergleich zu SPAN/Mirror-Port hat ein TAP häufig diese Vorteile:

- stabile und reproduzierbare Sicht auf den Link
- geringeres Risiko, dass unter Last Pakete für den Mitschnitt verloren gehen
- klare Trennung von Sende- und Empfangsrichtung (je nach TAP-Modell)
- keine Abhängigkeit von komplexen Mirror-Settings auf dem Switch

Wichtig: Auch ein TAP ist nicht magisch. Falsche Verkabelung, Überlastung am Analysegerät
oder unpassende Zeitstempel-Konfigurationen können die Qualität trotzdem verschlechtern.

## TAP vs. SPAN/Mirror-Port

| Kriterium | TAP | SPAN/Mirror-Port |
|---|---|---|
| Setup-Aufwand | physischer Einbau | meist schnell auf dem Switch konfigurierbar |
| Capture-Qualität | oft sehr stabil | kann unter Last unvollständig werden |
| Kosten | zusätzliche Hardware | meist ohne Zusatzhardware |
| Flexibilität | eher punktuell auf einer Strecke | gut für schnelle, temporäre Analysen |
| Risiko von Konfigurationsfehlern | eher Verkabelungsthema | eher Konfigurations- und Lastthema |

## Wann nehme ich was?

Nimm SPAN/Mirror-Port, wenn:

- du schnell einen ersten Überblick brauchst
- kein TAP verfügbar ist
- die Last überschaubar ist
- es um eine kurze Triage geht

Nimm TAP, wenn:

- du eine verlässliche Langzeitbeobachtung brauchst
- Paketverlust im Mitschnitt kritisch wäre
- du Traffic auf einer bestimmten Leitung reproduzierbar beobachten willst

## Muss ich das als normaler Netzwerker wissen?

Ja, als Grundlagenwissen solltest du TAP einordnen können:

- was TAP grundsätzlich ist
- warum es oft eine hohe Capture-Qualität liefert
- wann TAP sinnvoller ist als SPAN/Mirror-Port

Für den Basis-Kurs reicht diese Einordnung.

Du musst dafür nicht sofort TAP-Hardware betreiben oder modellabhängige Details kennen.

## Mini-Checkliste vor der Aufnahme

- Ist klar, ob TAP oder SPAN/Mirror genutzt wird?
- Ist die erwartete Last für den Mitschnitt realistisch?
- Ist der Capture-Punkt passend zur Fragestellung gewählt?
- Sind Zeitstempel und Zeitzone für die Auswertung dokumentiert?
- Ist geklärt, ob die Aufzeichnung erlaubt ist?

## Weiterführende Ressourcen

- [Network-TAP – Wikipedia (deutsch)](https://de.wikipedia.org/wiki/Network-TAP) –
  guter technischer Überblick über Aufbau, Bauformen und den Unterschied zwischen
  aktivem und passivem TAP; empfehlenswert als Einstiegslektüre
- [Wireshark Wiki: CaptureSetup](https://wiki.wireshark.org/CaptureSetup)
- [Wireshark Wiki: Ethernet](https://wiki.wireshark.org/Ethernet)
