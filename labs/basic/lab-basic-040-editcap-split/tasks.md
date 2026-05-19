# Aufgaben

## Aufgabe 1: Docker-Lab starten

Aus dem Repository-Root:

```bash
docker compose -f docker/compose/lab-basic-dns-http/compose.yml up -d
```

Status prüfen:

```bash
docker compose -f docker/compose/lab-basic-dns-http/compose.yml ps
```

## Aufgabe 2: Quell-Capture erzeugen

Ordner vorbereiten:

```bash
mkdir -p pcaps/generated
```

Starte einen Mitschnitt auf dem Lab-Netz:

```bash
tshark -i any \
  -f "net 172.28.50.0/24" \
  -w pcaps/generated/lab-basic-040-source.pcapng
```

Lass den Mitschnitt laufen. Notiere dir die Startzeit (Uhrzeit), zum Beispiel:

```text
Startzeit: 09:10:00
```

## Aufgabe 3: Traffic mit bekannten Ereignissen erzeugen

Öffne ein zweites Terminal.

Führe die folgenden Kommandos nacheinander aus. Notiere dir jeweils die ungefähre Uhrzeit:

**Ereignis A – normaler HTTP-Traffic:**

```bash
docker compose -f docker/compose/lab-basic-dns-http/compose.yml exec lab-client sh -lc '
curl -s -o /dev/null http://web-ok.lab.local
'
```

Notiere: `Ereignis A ca. HH:MM:SS`

**Kurze Pause (ca. 30 Sekunden)**

**Ereignis B – DNS-Anfrage für nicht existierende Domain:**

```bash
docker compose -f docker/compose/lab-basic-dns-http/compose.yml exec lab-client sh -lc '
dig @172.28.50.53 nichtexistent.lab.local || true
'
```

Notiere: `Ereignis B ca. HH:MM:SS`

**Kurze Pause (ca. 30 Sekunden)**

**Ereignis C – Verbindung auf geschlossenem Port:**

```bash
docker compose -f docker/compose/lab-basic-dns-http/compose.yml exec lab-client sh -lc '
curl -v --connect-timeout 3 http://172.28.50.10:81 || true
'
```

Notiere: `Ereignis C ca. HH:MM:SS`

**Kurze Pause (ca. 30 Sekunden)**

**Ereignis D – langsamer Webserver:**

```bash
docker compose -f docker/compose/lab-basic-dns-http/compose.yml exec lab-client sh -lc '
curl -s -o /dev/null http://web-slow.lab.local
'
```

Notiere: `Ereignis D ca. HH:MM:SS`

Stoppe danach den Mitschnitt mit `Ctrl + C`.

## Aufgabe 4: Datei verstehen – ohne zu öffnen

Bevor du irgendetwas analysierst, lies die Metadaten der Datei:

```bash
capinfos pcaps/generated/lab-basic-040-source.pcapng
```

Beantworte folgende Fragen anhand der Ausgabe:

- Wie viele Pakete enthält die Datei?
- Über welchen Zeitraum (Dauer in Sekunden) erstreckt sich der Mitschnitt?
- Welches Dateiformat wird verwendet?

## Aufgabe 5: Paketrate über die Zeit analysieren

Lass TShark die Paketrate in 10-Sekunden-Fenstern ausgeben:

```bash
tshark -r pcaps/generated/lab-basic-040-source.pcapng \
  -q -z io,stat,10
```

Kannst du in der Ausgabe erkennen, zu welchen Zeitpunkten Traffic-Spitzen aufgetreten sind?

## Aufgabe 6: Zeitfenster um ein Ereignis ausschneiden

Verwende deine notierten Ereigniszeiten.

Schneide ein Fenster von ±60 Sekunden um Ereignis B aus
(DNS-Anfrage für nicht existierende Domain).

Ersetze `HH:MM:SS` durch deine notierten Zeiten:

```bash
editcap \
  -A "YYYY-MM-DD HH:MM:SS" \
  -B "YYYY-MM-DD HH:MM:SS" \
  pcaps/generated/lab-basic-040-source.pcapng \
  pcaps/generated/lab-basic-040-fenster-1.pcapng
```

Prüfe das Ergebnis:

```bash
capinfos pcaps/generated/lab-basic-040-fenster-1.pcapng
```

## Aufgabe 7: Datei in Zeitabschnitte aufteilen

Teile die Quelldatei in 30-Sekunden-Abschnitte auf:

```bash
mkdir -p pcaps/generated/lab-040-splits

editcap -i 30 \
  pcaps/generated/lab-basic-040-source.pcapng \
  pcaps/generated/lab-040-splits/lab-basic-040-split-.pcapng
```

Schau, wie viele Dateien entstanden sind:

```bash
ls -lh pcaps/generated/lab-040-splits/
```

## Aufgabe 8: Nach Protokoll filtern – DNS-Fehler

Erstelle eine neue Datei, die nur DNS-Antworten mit Fehlercode enthält:

```bash
tshark -r pcaps/generated/lab-basic-040-source.pcapng \
  -Y "dns.flags.rcode != 0" \
  -w pcaps/generated/lab-basic-040-dns-fehler.pcapng
```

Prüfe, was drin ist:

```bash
tshark -r pcaps/generated/lab-basic-040-dns-fehler.pcapng \
  -T fields \
  -e frame.number \
  -e frame.time_relative \
  -e ip.src \
  -e dns.qry.name \
  -e dns.flags.rcode
```

## Aufgabe 9: Nach TCP-Auffälligkeiten filtern

Erstelle eine neue Datei mit TCP-Analysewarnungen (Retransmissions, Resets, etc.):

```bash
tshark -r pcaps/generated/lab-basic-040-source.pcapng \
  -Y "tcp.analysis.flags && !tcp.analysis.window_update" \
  -w pcaps/generated/lab-basic-040-tcp-probleme.pcapng
```

Öffne das Ergebnis in Wireshark:

```bash
wireshark pcaps/generated/lab-basic-040-tcp-probleme.pcapng &
```

Was siehst du dort?

## Aufgabe 10: Ergebnis verifizieren

Führe das Prüfskript aus:

```bash
bash labs/basic/lab-basic-040-editcap-split/check_tshark.sh
```

## Optional: Docker-Lab stoppen

```bash
docker compose -f docker/compose/lab-basic-dns-http/compose.yml down
```
