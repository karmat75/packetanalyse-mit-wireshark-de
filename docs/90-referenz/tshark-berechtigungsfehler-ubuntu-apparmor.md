# TShark-Berechtigungsfehler unter Ubuntu (AppArmor)

Diese Seite beschreibt eine typische Stolperfalle auf Ubuntu-basierten Systemen:

```text
tshark: You don't have permission to read the file "..."
```

Wichtig: Diese Meldung kann auftreten, obwohl die Datei normale Leserechte hat.

## Symptom

Ein typischer Ablauf:

- `capinfos capture.pcapng` funktioniert
- `cat capture.pcapng >/dev/null` funktioniert
- `tshark -r capture.pcapng` liefert einen Berechtigungsfehler

## Ursache

Auf einigen Ubuntu-Installationen läuft `tshark` mit einem AppArmor-Profil.

Dadurch kann der direkte Dateizugriff durch `tshark` blockiert werden, auch wenn Besitzer, Gruppe und Modus der Datei korrekt sind.

## Schnelltest

Prüfe zuerst, ob die Datei grundsätzlich lesbar ist:

```bash
capinfos capture.pcapng
```

Wenn das funktioniert, teste `tshark` ohne das restriktive Profil:

```bash
aa-exec -p unconfined -- tshark -r capture.pcapng
```

Wenn dieser Befehl funktioniert, ist AppArmor sehr wahrscheinlich die Ursache.

## Sofort nutzbare Workarounds

Variante 1 (empfohlen für schnelle Analyse im Kurskontext):

```bash
aa-exec -p unconfined -- tshark -r capture.pcapng
```

Variante 2 (liest die Datei per Pipe):

```bash
cat capture.pcapng | tshark -r -
```

## Dauerhafte Lösung (systemweit)

Wenn du das Verhalten dauerhaft anpassen willst, gibt es zwei Wege.

Weg A: Profil in den Complain-Modus setzen (schnell, aber weniger streng)

```bash
sudo aa-complain tshark
```

Falls `aa-complain` nicht gefunden wird, fehlt meist das Paket `apparmor-utils`.

```bash
sudo apt update
sudo apt install -y apparmor-utils
sudo aa-complain tshark
```

Ohne `aa-complain` kannst du alternativ direkt den sauberen Weg B nutzen.

Weg B: Lokale AppArmor-Regeln ergänzen (sauberer)

1. Öffne die lokale Datei für das `tshark`-Profil:

```bash
sudoedit /etc/apparmor.d/local/tshark
```

2. Erlaube Leserechte für deine Kurs-PCAPs, z. B.:

```text
file r /home/*/workspace/packetanalyse-mit-wireshark-de/pcaps/{,**},
```

3. Profil neu laden:

```bash
sudo apparmor_parser -r /etc/apparmor.d/tshark
```

4. Testen:

```bash
tshark -r pcaps/generated/first-contact.pcapng
```

## Sicherheits-Hinweis

Führe Paketmitschnitte und Analysen nur in Netzen und Umgebungen aus, für die du eine ausdrückliche Berechtigung hast.
