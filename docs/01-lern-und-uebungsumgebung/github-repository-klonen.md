# GitHub Repository klonen

In diesem Schritt machst du die aktuelle Kurs-Version lokal auf deinem Rechner verfügbar.
Dazu klonst du das Repository von GitHub.

## Schritt 1: Arbeitsordner auswählen und erstellen

Wähle einen Ort auf deinem Rechner, an dem du den Kurs speichern möchtest.
Das kann z. B. unter deinem Home-Verzeichnis sein.

```bash
mkdir -p ~/workspace
cd ~/workspace
```

Das Verzeichnis `~/workspace` ist jetzt dein Arbeitsordner.
Falls du schon einen anderen Ordner für Projekte verwendest, nimm gerne diesen statt `workspace`.

## Schritt 2: Passenden Weg auswählen (mit oder ohne GitHub-Account)

Für dieses Kurs-Repository brauchst du zum Lesen und Klonen **keinen** GitHub-Account.
Das Repository ist öffentlich.

### Option A: Ohne GitHub-Account

Du kannst direkt per HTTPS klonen:

```bash
git clone https://github.com/karmat75/packetanalyse-mit-wireshark-de.git
```

Alternativ kannst du das Repository im Browser als ZIP herunterladen und entpacken.

### Option B: Mit GitHub-Account

Mit Account kannst du später einfacher Änderungen veröffentlichen (Pull Requests).

- Für reines Lernen reicht weiterhin ein normales Clone.
- Für eigene Beiträge erstellst du zuerst einen Fork und klonst dann deinen Fork.

Beispiel (Fork klonen):

```bash
git clone https://github.com/<dein-username>/packetanalyse-mit-wireshark-de.git
```

## Schritt 3: Repository klonen

Standardweg für den Kurs:

```bash
git clone https://github.com/karmat75/packetanalyse-mit-wireshark-de.git
```

Wenn du das Repository lokal bereits hast, brauchst du nicht zu klonen.
Wechsle stattdessen direkt in das Verzeichnis (Schritt 4).

## Schritt 4: In das Repository-Verzeichnis wechseln

```bash
cd packetanalyse-mit-wireshark-de
```

## Schritt 5: Git-Identität setzen (wichtig vor dem ersten Commit)

Wenn `user.name` und `user.email` fehlen, scheitert der erste Commit.

```bash
git config --global user.name "Dein Name"
git config --global user.email "deine.email@example.com"
```

Prüfen:

```bash
git config --global --get user.name
git config --global --get user.email
```

Hinweis: Für reines Klonen und Lesen ist das nicht zwingend, aber für spätere Commits sehr wichtig.

## Sicherheitsprüfung: Standort und Repository prüfen

Dieser Schritt stellt sicher, dass alles am richtigen Platz ist.

```bash
pwd
ls -la
git status
```

Erwartung:

- **`pwd`**: Der Pfad endet auf `packetanalyse-mit-wireshark-de`
- **`ls -la`**: Du siehst Dateien und Ordner wie `README.md`, `mkdocs.yml`, `docs`, `tools`, `quizzes`
- **`git status`**: Kein Fehler wie `not a git repository` — du solltest etwas wie `On branch main` sehen

Falls etwas nicht stimmt:
- Prüfe, ob du im Kurs-Verzeichnis bist (`pwd`)
- Prüfe, ob das Repository vollständig geklont wurde (prüfe `ls`)
- Prüfe Git-Konfiguration (`git config user.name` und `git config user.email`)

## Clone oder Fork?

- **Clone reicht**, wenn du den Kurs lokal lernen und nutzen möchtest.
- **Fork ist sinnvoll**, wenn du eigene Änderungen auf GitHub veröffentlichen willst.
- **Ohne GitHub-Account** kannst du trotzdem per HTTPS klonen oder als ZIP herunterladen und lokal arbeiten.

## Nächster Schritt

Wenn diese Prüfung erfolgreich ist, kannst du zur Einrichtung der Python-Umgebung übergehen.
