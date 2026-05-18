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

## Schritt 2: Git-Authentifizierung vorbereiten

Damit Git sich mit GitHub authentifizieren kann, hast du zwei Möglichkeiten:

### Option A: SSH-Schlüssel (empfohlen für regelmäßige Arbeit)

SSH ist sicherer und erfordert kein Passwort-Eingeben bei jedem `git` Befehl.

Prüfe zuerst, ob du bereits einen SSH-Schlüssel hast:

```bash
ls ~/.ssh/id_ed25519
```

Falls der Schlüssel nicht existiert, erstelle einen:

```bash
ssh-keygen -t ed25519 -C "deine-email@example.com"
```

Drücke Enter bei allen Fragen (nutze die Standardwerte).

Kopiere deinen öffentlichen Schlüssel:

```bash
cat ~/.ssh/id_ed25519.pub
```

Gehe zu https://github.com/settings/keys und:
1. Klick auf „New SSH key"
2. Gib der Schlüssel einen Namen (z. B. „Kurs-Laptop")
3. Wähle „Authentication Key"
4. Füge den Schlüssel ein (den kompletten Inhalt von `cat ~/.ssh/id_ed25519.pub`)
5. Klick auf „Add SSH key"

### Option B: Personal Access Token (einfacher für schnelle Tests)

Falls du SSH nicht einrichten möchtest, verwende einen Personal Access Token:

1. Gehe zu https://github.com/settings/tokens/new
2. Wähle „Generate new token (classic)"
3. Gib einen Namen ein (z. B. „Kurs-Clone")
4. Wähle nur `public_repo` (für öffentliche Repositories ausreichend)
5. Klick auf „Generate token"
6. **Kopiere den Token sofort** (du kannst ihn später nicht mehr sehen)

Für das Klonen brauchst du ihn als: `git clone https://<dein-username>:<dein-token>@github.com/karmat75/packetanalyse-mit-wireshark-de.git`

## Schritt 3: Repository klonen

Mit SSH (falls du SSH eingerichtet hast):

```bash
git clone git@github.com:karmat75/packetanalyse-mit-wireshark-de.git
```

Mit Personal Access Token (wenn du diesen weg wählst, ersetze die Platzhalter):

```bash
git clone https://<dein-username>:<dein-token>@github.com/karmat75/packetanalyse-mit-wireshark-de.git
```

Wenn du das Repository lokal bereits hast, brauchst du nicht zu klonen.
Wechsle stattdessen direkt in das Verzeichnis (Schritt 4).

## Schritt 4: In das Repository-Verzeichnis wechseln

```bash
cd packetanalyse-mit-wireshark-de
```

## Sicherheitsprüfung: Standort und Repository prüfen

Dieser Schritt stellt sicher, dass alles am richtigen Platz ist.

```bash
pwd
ls
git status
```

Erwartung:

- **`pwd`**: Der Pfad endet auf `packetanalyse-mit-wireshark-de`
- **`ls`**: Du siehst Dateien und Ordner wie `README.md`, `mkdocs.yml`, `docs`, `tools`, `quizzes`
- **`git status`**: Kein Fehler wie `not a git repository` — du solltest etwas wie `On branch main` sehen

Falls etwas nicht stimmt:
- Prüfe, ob du im Kurs-Verzeichnis bist (`pwd`)
- Prüfe, ob das Repository vollständig geklont wurde (prüfe `ls`)
- Prüfe Git-Konfiguration (`git config user.name` und `git config user.email`)

## Nächster Schritt

Wenn diese Prüfung erfolgreich ist, kannst du zur Einrichtung der Python-Umgebung übergehen.
