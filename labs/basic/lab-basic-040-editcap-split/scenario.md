# Szenario

Es ist Dienstag, 09:00 Uhr.

Dein Kollege aus dem Netzwerkteam schickt dir eine E-Mail:

> „Hey, ich hab dir mal den Traffic auf unserem Uplink-Interface mitgeschnitten.
> Wir hatten gestern zwischen 09:00 und 11:00 drei Mal Probleme:
> – ca. 09:15: irgendwas mit DNS, Clients haben gemeldet, dass Seiten nicht laden
> – ca. 09:45: Verbindungsabbrüche, wir wissen nicht warum
> – ca. 10:20: Anwendung war langsam, bis es sich nach ein paar Minuten von selbst gebessert hat
> Die Datei ist etwas größer geworden. Ich leg sie dir auf den Share.
> Gutes Gelingen 👍"
>
> Datei: `netz-uplink-2026-05-19.pcapng` – Größe: 8,4 GB

Du kannst die Datei auf deinem Laptop nicht direkt in Wireshark öffnen.

Aber du hast TShark, `editcap` und `capinfos`.

Und eine Strategie.

---

## Lab-Netz

Für dieses Lab verwendest du die gleiche Docker-Umgebung wie in Lab Basic 020 und 030.

```text
172.28.50.0/24
```

## Systeme

| System | IP | Rolle |
|---|---:|---|
| `lab-client` | `172.28.50.100` | Client |
| `lab-dns` | `172.28.50.53` | DNS |
| `web-ok.lab.local` | `172.28.50.10` | Webserver auf TCP 80 |
| `web-slow.lab.local` | `172.28.50.20` | Webserver mit künstlicher Verzögerung |

## Was dieses Lab simuliert

Du erzeugst in diesem Lab einen Mitschnitt über einen kurzen Zeitraum.

Die absolute Dateigröße ist kleiner als im Szenario, aber die Werkzeuge und der Workflow
sind identisch zu dem, was du bei einer echten 8-GB-Datei machen würdest.

Die Kompetenzen, die du hier übst, gelten unabhängig von der Dateigröße.

## Erwartete Kernbeobachtungen

| Schritt | Erwartung |
|---|---|
| `capinfos` | zeigt Zeitraum, Paketanzahl und Dauer an |
| `editcap -A/-B` | erzeugt kleinere Dateien mit dem gewünschten Zeitfenster |
| `editcap -i` | teilt die Datei in gleichmäßige Zeitabschnitte auf |
| `tshark -Y dns.flags.rcode != 0 -w` | erzeugt eine Datei nur mit DNS-Fehlern |
| `tshark -Y tcp.analysis.flags -w` | erzeugt eine Datei nur mit TCP-Auffälligkeiten |
