# Hinweise

## Hinweis 1: capinfos-Ausgabe lesen

`capinfos` gibt viele Felder aus. Die wichtigsten für dieses Lab sind:

```text
Number of packets
Duration
Start time
End time
```

Die Startzeit brauchst du, um korrekte `-A`-Argumente für `editcap` zu bilden.

## Hinweis 2: Zeitformat für editcap

Das Format für `-A` und `-B` ist:

```text
YYYY-MM-DD HH:MM:SS
```

Beispiel:

```bash
editcap -A "2026-05-19 09:10:00" -B "2026-05-19 09:12:00" \
  quelldatei.pcapng ergebnis.pcapng
```

Wenn du die Startzeit aus `capinfos` nimmst und dazu deine notierten Ereigniszeiten rechnest,
kannst du das Zeitfenster exakt bestimmen.

## Hinweis 3: io,stat-Ausgabe verstehen

Die Ausgabe von `tshark -z io,stat,10` sieht so aus:

```text
| Interval | Frames |   Bytes |
|   0 <> 10 |     12 |    1234 |
|  10 <> 20 |     45 |    5678 |
|  20 <> 30 |      3 |     234 |
```

„Interval" ist die vergangene Zeit seit dem ersten Paket in der Datei, in Sekunden.

Mehr Frames in einem Fenster = mehr Traffic in diesem Zeitabschnitt.

## Hinweis 4: editcap -i – Dateinamen der Teile

Beim gleichmäßigen Aufteilen mit `-i` erzeugt `editcap` Dateien mit dem Schema:

```text
<prefix>NNNNN_YYYYMMDDHHMMSS.pcapng
```

Der Timestamp im Dateinamen ist der Zeitpunkt des ersten Pakets in diesem Teil.

Das hilft dir, den richtigen Teil für einen bestimmten Zeitpunkt zu finden.

## Hinweis 5: tshark -Y -w – Datei-Ausgabe prüfen

Nach dem Filtern kannst du schnell prüfen, wie viele Pakete in die Ergebnisdatei
geschrieben wurden:

```bash
capinfos pcaps/generated/lab-basic-040-dns-fehler.pcapng | grep "Number of packets"
```

Oder:

```bash
tshark -r pcaps/generated/lab-basic-040-dns-fehler.pcapng 2>/dev/null | wc -l
```

## Hinweis 6: Keine DNS-Fehler in der gefilterten Datei?

Wenn `capinfos` nach dem Filter 0 Pakete anzeigt, kann das bedeuten:

- Der DNS-Server in der Lab-Umgebung hat für die Abfrage keine NXDOMAIN zurückgegeben
- Das Capture enthält die DNS-Antwort nicht (falsche Netzwerkschnittstelle)

Prüfe zunächst, ob überhaupt DNS-Pakete im Capture sind:

```bash
tshark -r pcaps/generated/lab-basic-040-source.pcapng \
  -Y "dns" \
  -T fields \
  -e frame.number \
  -e dns.qry.name \
  -e dns.flags.rcode
```

## Hinweis 7: TCP-Analysewarnungen fehlen?

TCP-Analysewarnungen werden von TShark nur erzeugt, wenn TShark den vollständigen Stream sieht
und erkennt, dass etwas fehlt.

Bei sehr kurzem Traffic oder wenn der Mitschnitt nach einem RST-Paket begonnen hat,
können manche Warnungen fehlen.

Für dieses Lab reicht es, wenn das Prüfskript die Quelldatei und die gefilterten Dateien
erfolgreich validiert.
