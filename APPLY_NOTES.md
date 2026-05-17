# Anwendungshinweise

Dieses ZIP enthält die geänderten Dateien auf Basis des aktuellen Repository-Abzugs.

Wenn du das ZIP manuell über dein Repository legst, lösche anschließend bitte den alten leeren Ordner:

```text
quizzes/objectives/
```

Der Patch `restpruefung-aktueller-stand.patch` erledigt diese Umbenennung automatisch:

```bash
patch -p1 < restpruefung-aktueller-stand.patch
```
