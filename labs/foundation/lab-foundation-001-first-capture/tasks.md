# Aufgaben

## Aufgabe 1: Arbeitsordner vorbereiten

Wechsle in das Repository-Root:

```bash
cd ~/workspace/packetanalyse-mit-wireshark-de
```

Erzeuge den Ordner für lokal generierte Captures:

```bash
mkdir -p pcaps/generated
```

## Aufgabe 2: aktives Interface bestimmen

Prüfe dein Standard-Interface:

```bash
ip route
```

Suche die Zeile mit `default`.

Beispiel:

```text
default via 192.168.1.1 dev wlp2s0
```

In diesem Beispiel wäre `wlp2s0` das interessante Interface.

## Aufgabe 3: Capture starten

```bash
# Terminal 1 – Capture starten
tshark -i <interface> -w pcaps/generated/lab-foundation-001-first-capture.pcapng
```

Alternativ kannst du Wireshark verwenden und den Mitschnitt auf dem passenden Interface starten.

## Aufgabe 4: Traffic erzeugen

Traffic erzeugen:

```bash
# Terminal 2 – Traffic erzeugen
dig example.org
ping -c 4 example.org
curl -I https://example.org
```

## Aufgabe 5: Capture stoppen und speichern

Wenn du Wireshark verwendest:

```text
File > Save As
```

Speichere als:

```text
pcaps/generated/lab-foundation-001-first-capture.pcapng
```

Wenn du TShark verwendet hast, wurde die Datei bereits geschrieben.

## Aufgabe 6: Capture öffnen

```bash
wireshark pcaps/generated/lab-foundation-001-first-capture.pcapng
```

## Aufgabe 7: Display Filter testen

Teste diese Filter:

```text
dns
```

```text
icmp
```

```text
tcp
```

```text
tls
```

```text
ip.addr == <deine-client-ip>
```

## Aufgabe 8: TShark-Prüfung

Prüfe den Capture mit TShark:

```bash
tshark -r pcaps/generated/lab-foundation-001-first-capture.pcapng
```

Zähle DNS-Pakete:

```bash
tshark -r pcaps/generated/lab-foundation-001-first-capture.pcapng -Y "dns" | wc -l
```

Gib DNS-Anfragen aus:

```bash
tshark -r pcaps/generated/lab-foundation-001-first-capture.pcapng \
  -Y "dns.flags.response == 0" \
  -T fields \
  -e frame.number \
  -e ip.src \
  -e dns.qry.name
```

## Aufgabe 9: Beobachtungen notieren

Notiere:

- verwendetes Interface
- Anzahl der Pakete im Capture
- sichtbare Protokolle
- DNS Query Names
- Ziel-IP von `example.org`
- ob ICMP Echo Request und Echo Reply sichtbar sind
- ob TCP/TLS sichtbar ist
- verwendete Display Filter
