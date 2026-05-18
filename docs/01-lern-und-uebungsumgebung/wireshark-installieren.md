# Wireshark installieren

Wireshark ist das zentrale Werkzeug dieses Kurses.

Zusätzlich installieren wir TShark und tcpdump, weil beide Werkzeuge für Labs, Automatisierung und spätere Prüfskripte wichtig sind.

## Installation

```bash
sudo apt update
sudo apt install -y wireshark tshark tcpdump
```

Während der Installation kann eine Frage erscheinen:

```text
Should non-superusers be able to capture packets?
```

Für ein persönliches Lernsystem sollte hier `Yes` beziehungsweise `Ja` gewählt werden.

Damit wird vorbereitet, dass normale Benutzer über die Gruppe `wireshark` Pakete mitschneiden dürfen.

## Falls die Abfrage nicht erschienen ist

Die Konfiguration kann nachträglich erneut aufgerufen werden:

```bash
sudo dpkg-reconfigure wireshark-common
```

Dort `Yes` beziehungsweise `Ja` wählen.

Danach den eigenen Benutzer zur Gruppe `wireshark` hinzufügen:

```bash
sudo usermod -aG wireshark "$USER"
```

Anschließend vollständig abmelden und wieder anmelden.

## Berechtigungen prüfen

Nach dem erneuten Login:

```bash
groups
```

Die Gruppe `wireshark` sollte enthalten sein.

Zusätzlich prüfen:

```bash
getcap /usr/bin/dumpcap
```

Typische Ausgabe:

```text
/usr/bin/dumpcap cap_net_admin,cap_net_raw=eip
```

## Versionen prüfen

```bash
wireshark --version
tshark --version
tcpdump --version
```

## Interfaces anzeigen

```bash
tshark -D
```

oder:

```bash
dumpcap -D
```

Wenn Interfaces angezeigt werden, ist die Grundkonfiguration einsatzbereit.

## Erster kurzer Capture-Test

Wir starten einen kurzen Mitschnitt mit TShark und erzeugen währenddessen etwas Netzwerkverkehr.
Dafür brauchen wir zwei Terminal-Fenster gleichzeitig.

**Was passiert:**

1. Im ersten Terminal startet TShark und zeichnet 30 Sekunden lang Pakete auf. Die Dauer wird mit `-a duration:30` angegeben — den Wert `30` kannst du beliebig anpassen, z. B. `60` für eine Minute.
2. Im zweiten Terminal rufen wir eine Webseite ab, um etwas Traffic zu erzeugen.
3. Nachdem TShark fertig ist, prüfen wir die aufgezeichnete Datei im ersten Terminal.

---

**Terminal 1** — Capture starten:

```bash
tshark -a duration:30 -w /tmp/packetlab-test.pcapng
```

TShark läuft jetzt 30 Sekunden und hört danach automatisch auf.

---

**Terminal 2** — Während TShark läuft, Traffic erzeugen:

```bash
curl -I https://www.wireshark.org/
```

---

**Terminal 1** — Nachdem TShark fertig ist, Ergebnis prüfen:

```bash
capinfos /tmp/packetlab-test.pcapng
```

Eine erfolgreiche Ausgabe zeigt unter anderem die Anzahl der aufgezeichneten Pakete und die Dauer des Mitschnitts.

## Wireshark starten

Wireshark lässt sich direkt aus dem Terminal, über den Befehl `wireshark`, starten oder über das Anwendungsmenü aufrufen.

Das Fenster öffnet sich manchmal recht klein. Einfach maximieren — danach ist die Oberfläche gut erkennbar.


### Was dich beim ersten Start erwartet

Nach dem Start zeigt Wireshark den **Willkommensbildschirm** (Welcome Screen).

Dort siehst du eine Liste der verfügbaren Netzwerkschnittstellen (Interfaces), jeweils mit einem kleinen Live-Graphen, der anzeigt ob gerade Datenverkehr auf dem Interface vorhanden ist.

Du musst jetzt noch nichts auswählen oder tun.

Der Willkommensbildschirm ist gleichzeitig der Einstiegspunkt für einen Capture — aber für diesen Schritt reicht es zu wissen, dass Wireshark startet und die Interfaces sichtbar sind.

### Wenn du neugierig bist: ersten Capture starten

Sobald du möchtest, kannst du direkt einen ersten Mitschnitt machen:

- Doppelklicke auf ein Interface mit sichtbarem Traffic (z. B. `eth0` oder `ens...`)
- Wireshark beginnt sofort mit dem Aufzeichnen
- Mit dem roten Stopp-Button (`◼`) in der Werkzeugleiste kannst du den Capture beenden

Ausführlich wird das im Kapitel [Wireshark erster Kontakt](../03-wireshark-erster-kontakt/index.md) behandelt.

!!! note "Keine Interfaces sichtbar?"
    Falls die Interface-Liste leer ist oder grau erscheint, fehlen meist noch die Berechtigungen.
    Prüfe den Abschnitt „Berechtigungen prüfen" weiter oben auf dieser Seite.

## Zielzustand

Wireshark ist bereit, wenn:

- Wireshark als grafische Anwendung startet
- `tshark -D` Interfaces anzeigt
- ein kurzer Capture mit TShark möglich ist
- der Benutzer Mitglied der Gruppe `wireshark` ist
