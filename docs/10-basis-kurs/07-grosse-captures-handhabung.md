# Große Captures handhaben

Irgendwann passiert es jedem, der mit Netzwerkanalyse zu tun hat.

Ein Kollege kommt mit einer Datei und sagt:

> „Ich hab dir mal den Traffic über den Tag mitgeschnitten. Wir hatten um 09:15, 11:40 und 14:22 Probleme.
> Ich weiß nicht genau was, aber es war mal DNS, mal war die Anwendung langsam, und einmal hat sich was aufgehängt.
> Die Datei ist 8 GB. Viel Erfolg."

Und dann ist er weg.

Die erste Reaktion ist manchmal Schrecken. Die zweite Reaktion sollte sein:

> **Challenge accepted.**

Eine große Capture-Datei ist kein Disaster. Sie ist ein Startpunkt.

Du hast Werkzeuge. Du hast eine Strategie. Du weißt, wo du anfängst.

---

## Die zwei Arten von Captures

Zwei Situationen führen zu großen Capture-Dateien, und sie brauchen leicht unterschiedliche Herangehensweisen.

| Situation | Was du tust |
|---|---|
| Du hast den Mitschnitt selbst gemacht | Bereits beim Mitschneiden klug vorgehen |
| Du hast die Datei von jemand anderem bekommen | Systematisch einengen, dann analysieren |

In beiden Fällen gilt: **Nicht einfach in Wireshark öffnen und hoffen.**

---

## Schritt 0: Erst verstehen, was du hast

Bevor du irgendetwas öffnest, verwendest du `capinfos`.

`capinfos` liest die Metadaten einer Capture-Datei aus, ohne die Pakete zu laden.

```bash
capinfos grosses-capture.pcapng
```

Die Ausgabe zeigt dir:

```text
File name:           grosses-capture.pcapng
File type:           Wireshark/... - pcapng
File size:           8 GB
Number of packets:   62 453 781
Duration:            29580.000 secs
Start time:          2026-05-19 08:00:04
End time:            2026-05-19 16:13:24
```

Das sind die Informationen, auf die es ankommt:

- **Zeitraum**: Wann fängt der Mitschnitt an, wann hört er auf?
- **Paketanzahl**: Wie groß ist das Problem wirklich?
- **Dauer**: Über welchen Zeitraum erstreckt sich der Traffic?

Jetzt weißt du, womit du es zu tun hast. Wireshark hast du noch nicht angefasst.

---

## Schritt 1: Zeitfenster ausschneiden mit `editcap`

Du kennst die Problemzeiten. Dein Kollege sagte „09:15", „11:40" und „14:22".

Schneide dir je ein paar Minuten um diese Zeitpunkte aus:

```bash
# Erste Panne: 09:15 – Fenster 09:10 bis 09:20
editcap -A "2026-05-19 09:10:00" -B "2026-05-19 09:20:00" \
  grosses-capture.pcapng panne-1-dns.pcapng

# Zweite Panne: 11:40 – Fenster 11:35 bis 11:45
editcap -A "2026-05-19 11:35:00" -B "2026-05-19 11:45:00" \
  grosses-capture.pcapng panne-2-langsam.pcapng

# Dritte Panne: 14:22 – Fenster 14:17 bis 14:27
editcap -A "2026-05-19 14:17:00" -B "2026-05-19 14:27:00" \
  grosses-capture.pcapng panne-3-haengt.pcapng
```

Aus 8 GB werden drei Dateien von vielleicht je 50–200 MB.

Diese Dateien kann Wireshark problemlos öffnen.

!!! info "editcap – Zeitangaben"
    Das Format für `-A` (After) und `-B` (Before) ist `YYYY-MM-DD HH:MM:SS`.
    `-A` ist der Startzeitpunkt, `-B` ist der Endzeitpunkt.

---

## Schritt 2: Nach Protokoll oder Fehlertyp filtern mit TShark

Wenn du eine Vermutung hast, welches Protokoll das Problem verursacht, kannst du eine noch gezieltere Datei erstellen.

`tshark` liest die Quelldatei paketweise und schreibt nur die Pakete in die Zieldatei, die dem Display Filter entsprechen:

```bash
# Nur DNS-Fehler (non-zero RCODE) aus einer großen Datei
tshark -r grosses-capture.pcapng \
  -Y "dns.flags.rcode != 0" \
  -w dns-fehler.pcapng

# Nur TCP-Auffälligkeiten
tshark -r grosses-capture.pcapng \
  -Y "tcp.analysis.flags && !tcp.analysis.window_update" \
  -w tcp-probleme.pcapng

# Nur Traffic eines bestimmten Hosts
tshark -r grosses-capture.pcapng \
  -Y "ip.addr == 192.168.1.50" \
  -w nur-host-50.pcapng
```

TShark streamt die Datei. Es lädt nicht alles auf einmal in den Speicher.

Das funktioniert auch mit großen Dateien auf schwacher Hardware.

---

## Schritt 3: Gleichmäßig aufteilen mit `editcap`

Manchmal weißt du nicht genau, wann das Problem war. Oder der Mitschnitt ist so lang, dass selbst die Zeitfenster zu groß sind.

Dann teilst du die Datei in gleichmäßige Abschnitte.

**Nach Zeitintervall** (je 5 Minuten = 300 Sekunden):

```bash
editcap -i 300 grosses-capture.pcapng teile/capture-.pcapng
```

Ergebnis: `capture-00000_20260519080004.pcapng`, `capture-00001_20260519080504.pcapng`, usw.

**Nach Paketanzahl** (je 500.000 Pakete):

```bash
editcap -c 500000 grosses-capture.pcapng teile/capture-.pcapng
```

Beide Varianten erzeugen kleinere Dateien, die du einzeln untersuchen kannst.

---

## Schritt 4: Statistiken direkt aus der großen Datei

Manchmal willst du erst wissen, in welchem Zeitfenster überhaupt etwas Auffälliges passiert, bevor du zerschneidest.

TShark kann Statistiken streamen, ohne die Pakete zu laden:

```bash
# Paketrate pro Minute (60 Sekunden)
tshark -r grosses-capture.pcapng -q -z io,stat,60

# TCP-Verbindungen im Überblick
tshark -r grosses-capture.pcapng -q -z conv,tcp

# Endpoints im Überblick
tshark -r grosses-capture.pcapng -q -z endpoints,ip
```

Die `io,stat`-Ausgabe zeigt dir, wann im Mitschnitt ungewöhnlich viel oder wenig Traffic war.

Das kann den Problemzeitpunkt einengen, bevor du überhaupt einen Zeitschnitt machst.

---

## Gar nicht erst so groß werden lassen

Wenn du selbst mitschneidest, hast du die Kontrolle.

**Ring-Buffer**: Wireshark und TShark können Dateien automatisch rotieren.

```bash
# Maximal 10 Dateien à 100 MB, dann die älteste überschreiben
tshark -i eth0 \
  -b filesize:102400 \
  -b files:10 \
  -w capture.pcapng
```

Damit entsteht nie eine unkontrollierbar große Datei.

**Capture Filter**: Nur relevanten Traffic mitschneiden.

```bash
# Nur Traffic zu einem bestimmten Host
tshark -i eth0 -f "host 192.168.1.50" -w zielhost.pcapng

# Nur DNS und HTTP(S)
tshark -i eth0 -f "port 53 or port 80 or port 443" -w web-dns.pcapng
```

!!! warning "Capture Filter sind endgültig"
    Was nicht aufgezeichnet wurde, kann nicht mehr analysiert werden.
    Für den Einstieg und bei unklarer Fehlerursache lieber breiter mitschneiden
    und danach mit Display Filtern eingrenzen.

**Zeitbegrenzung**: Nur einen definierten Zeitraum mitschneiden.

```bash
# Maximal 10 Minuten
tshark -i eth0 -a duration:600 -w 10min.pcapng
```

---

## Der systematische Ansatz auf einen Blick

```text
1. capinfos     → Was ist in der Datei? Zeitraum, Paketanzahl.
2. io,stat      → Wann war viel Traffic? Anomalien sichtbar?
3. editcap -A/-B  → Zeitfenster um die Problemzeiten ausschneiden.
4. tshark -Y -w   → Nach Protokoll oder Fehlertyp filtern.
5. Wireshark    → Kleine, fokussierte Datei öffnen und analysieren.
```

Kein Schritt davon ist schwierig.

Zusammen ergeben sie eine reproduzierbare Methode, mit der du auch fremde Captures in den Griff bekommst.

---

## Werkzeuge im Überblick

| Werkzeug | Wofür |
|---|---|
| `capinfos` | Metadaten einer Capture-Datei lesen |
| `editcap -A/-B` | Zeitfenster ausschneiden |
| `editcap -i` | Gleichmäßig nach Zeit aufteilen |
| `editcap -c` | Gleichmäßig nach Paketanzahl aufteilen |
| `tshark -r -Y -w` | Nach Display-Filter filtern und neue Datei schreiben |
| `tshark -q -z io,stat` | Paketrate über die Zeit |
| `tshark -q -z conv,tcp` | TCP-Verbindungen im Überblick |
| Ring-Buffer `-b` | Beim Mitschneiden Dateigröße begrenzen |
| Capture Filter `-f` | Beim Mitschneiden nur relevanten Traffic erfassen |

---

## Weiterführende Ressourcen

- [editcap – Wireshark User's Guide](https://www.wireshark.org/docs/wsug_html_chunked/AppToolseditcap.html)
- [capinfos – Wireshark User's Guide](https://www.wireshark.org/docs/wsug_html_chunked/AppToolscapinfos.html)
- [TShark Manual Page](https://www.wireshark.org/docs/man-pages/tshark.html)
