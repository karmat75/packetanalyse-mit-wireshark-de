# Musterlösung

Die konkreten Frame-Nummern und Zeitstempel hängen von deinem lokal erzeugten Capture ab.

Die folgenden Beobachtungen zeigen, was du erwarten solltest.

---

## Aufgabe 4: capinfos-Ausgabe

Erwartete Ausgabe (Werte variieren je nach Lab-Lauf):

```text
File name:           pcaps/generated/lab-basic-040-source.pcapng
File type:           Wireshark/tcpdump/... - pcapng
Number of packets:   120
Duration:            147.234 secs
Start time:          2026-05-19 09:10:05
End time:            2026-05-19 09:12:32
```

Auswertung:

- Dateiformat ist pcapng
- Die Dauer entspricht dem Zeitraum zwischen Start und Stop des Mitschnitts
- Die Paketanzahl ist überschaubar, da nur Lab-Traffic auf `172.28.50.0/24` erfasst wurde

Bei einer echten 8-GB-Datei auf einem produktiven Netz würden Millionen von Paketen über Stunden erscheinen – die Auswertungsstrategie ist dieselbe.

---

## Aufgabe 5: io,stat-Ausgabe

Erwartetes Muster:

```text
| Interval | Frames |
|   0 <> 10 |      8 |    <- Starttraffic (Docker-Kommunikation)
|  10 <> 20 |     25 |    <- Ereignis A (HTTP web-ok)
|  20 <> 30 |      2 |
|  30 <> 40 |     12 |    <- Ereignis B (DNS-Fehler)
|  40 <> 50 |      2 |
|  50 <> 60 |     18 |    <- Ereignis C (RST auf Port 81)
|  60 <> 70 |      2 |
|  70 <> 80 |     22 |    <- Ereignis D (web-slow)
```

Wichtig: Die genauen Werte variieren. Der Punkt ist, dass du Traffic-Spitzen
mit deinen notierten Ereigniszeiten korrelieren kannst.

---

## Aufgabe 6: Zeitfenster mit editcap

Beispiel-Kommando (mit angepassten Zeiten):

```bash
editcap \
  -A "2026-05-19 09:10:35" \
  -B "2026-05-19 09:11:35" \
  pcaps/generated/lab-basic-040-source.pcapng \
  pcaps/generated/lab-basic-040-fenster-1.pcapng
```

Erwartetes Ergebnis von `capinfos`:

```text
Number of packets:   12
Duration:            60.000 secs
```

Das Fenster enthält nur die Pakete aus dem gewünschten Minutenbereich.

---

## Aufgabe 7: Gleichmäßige Aufteilung

```bash
editcap -i 30 \
  pcaps/generated/lab-basic-040-source.pcapng \
  pcaps/generated/lab-040-splits/lab-basic-040-split-.pcapng
```

Je nach Länge des Captures entstehen 4–6 Dateien:

```text
lab-basic-040-split-00000_20260519091005.pcapng
lab-basic-040-split-00001_20260519091035.pcapng
lab-basic-040-split-00002_20260519091105.pcapng
lab-basic-040-split-00003_20260519091135.pcapng
lab-basic-040-split-00004_20260519091205.pcapng
```

Der Timestamp im Dateinamen entspricht dem ersten Paket im jeweiligen 30-Sekunden-Fenster.

---

## Aufgabe 8: DNS-Fehler filtern

```bash
tshark -r pcaps/generated/lab-basic-040-source.pcapng \
  -Y "dns.flags.rcode != 0" \
  -w pcaps/generated/lab-basic-040-dns-fehler.pcapng
```

Erwartete Ausgabe nach dem Filtern:

```text
frame.number  frame.time_relative  ip.src          dns.qry.name              dns.flags.rcode
      35            32.412345      172.28.50.53    nichtexistent.lab.local   3
```

`dns.flags.rcode == 3` bedeutet NXDOMAIN – der DNS-Server konnte den Namen nicht auflösen.

---

## Aufgabe 9: TCP-Auffälligkeiten filtern

```bash
tshark -r pcaps/generated/lab-basic-040-source.pcapng \
  -Y "tcp.analysis.flags && !tcp.analysis.window_update" \
  -w pcaps/generated/lab-basic-040-tcp-probleme.pcapng
```

In Wireshark zeigt diese Datei die Pakete, die TShark als TCP-Auffälligkeiten erkannt hat:

- `TCP Port numbers reused` bei einem Verbindungsversuch auf Port 81
- `RST` oder `RST, ACK` bei der Ablehnung des geschlossenen Ports

---

## Zusammenfassung des Workflows

```text
1. capinfos    → Zeitraum und Paketanzahl verstehen
2. io,stat     → Traffic-Spitzen identifizieren
3. editcap -A/-B → Zeitfenster ausschneiden
4. editcap -i  → Gleichmäßig aufteilen
5. tshark -Y -w → Protokoll- oder Fehlerfilter anwenden
6. Wireshark   → Kleine, fokussierte Datei analysieren
```

Dieser Workflow funktioniert genauso bei einer echten 8-GB-Datei wie bei diesem Lab-Capture.
Der Unterschied ist nur die Dauer von Schritt 3 und 4.
