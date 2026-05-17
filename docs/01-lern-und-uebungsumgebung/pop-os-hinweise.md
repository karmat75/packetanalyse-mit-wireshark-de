# Hinweise für andere Distributionen

Die Referenzplattform für diesen Kurs ist Ubuntu Desktop LTS. Die Befehle und Anleitungen sollten auf allen Debian-basierten Distributionen – wie zum Beispiel Pop!_OS, Linux Mint oder Debian selbst – grundsätzlich funktionieren. Allerdings kann es hier und da kleinere Anpassungen erfordern.

## Was bedeutet "Debian-basiert"

Debian-basierte Distributionen teilen die grundlegende Paketverwaltung über `apt`. Das bedeutet:

- `apt update`, `apt install` und verwandte Befehle funktionieren gleich
- Paketname und -verfügbarkeit können sich leicht unterscheiden
- Docker, Wireshark, Git, Python und VSCode lassen sich auf diesen Systemen ähnlich installieren

## Mögliche Unterschiede

Wo Anpassungen nötig werden können:

- **Docker**: Docker richtet seine Paketquellen nach Ubuntu-Codenamen aus. Auf abgeleiteten Distributionen kann ein zusätzlicher Schritt nötig sein, um den richtigen Codename zu ermitteln:

  ```bash
  grep -E 'VERSION_CODENAME|UBUNTU_CODENAME' /etc/os-release
  ```

  Manche Distributionen setzen `UBUNTU_CODENAME`, andere nur `VERSION_CODENAME`.

- **Desktop-Umgebung**: Menüs, Tastenkombinationen und vorinstallierte Anwendungen können abweichen. Für den Kurs ist das in der Regel nicht kritisch.

- **Terminal**: Der Name der Terminal-Anwendung variiert je nach Distribution und Desktop.

## Wayland, X11 und Wireshark

Wireshark funktioniert unabhängig davon, ob die Desktop-Sitzung Wayland oder X11 nutzt.

Für den Kurs ist nur wichtig:

- Wireshark soll lokal als GUI-Anwendung starten
- TShark und tcpdump sollen im Terminal funktionieren
- Docker-Container sollen nicht selbst die Wireshark-GUI starten müssen

## Zielzustand

Das System ist für den Kurs geeignet, wenn folgende Befehle erfolgreich laufen:

```bash
sudo apt update
git --version
python3 --version
```

Danach können die normalen Installationsschritte für Pakete, VSCode, Docker und Wireshark durchgeführt werden.
