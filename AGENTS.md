# AGENTS.md

## Project

Official project title:

```text
Packetanalyse mit Wireshark
```

Repository name:

```text
packetanalyse-mit-wireshark-de
```

This repository contains an open-source German self-study course for network analysis with Wireshark. It supports fair preparation for the Wireshark Certified Analyst WCA-101 certification without reproducing official exam content, official objectives, proprietary training material or exam dumps.

The course is independent and is not an official Wireshark Foundation project. Use the names Wireshark and WCA only descriptively. Do not imply sponsorship, endorsement, certification partnership or official training status.

## Language

All learner-facing content must be written in German.

Technical terms may include their English term in parentheses on first use.

Examples:

- Anzeige-Filter (Display Filter)
- Mitschnitt (Capture)
- Neuübertragung (Retransmission)
- Paketverlust (Packet Loss)
- Rundlaufzeit (Round Trip Time / RTT)
- Expert-Informationen (Expert Information)
- Gesprächsübersicht (Conversations)
- Endpunkte (Endpoints)

## Target audience

The course is written for learners who already have basic networking knowledge, especially:

- IP addresses and subnets
- VLANs
- cabling and switches
- basic network architecture
- simple troubleshooting in IT operations

The course must not assume deep protocol analysis knowledge.

## Course goals

The course should help learners build real packet analysis skills with Wireshark, TShark and reproducible lab environments.

The course may support WCA-101 preparation in a legitimate way, but it must remain an independent learning resource.

Do not include:

- real certification exam questions
- recreated or memorized exam questions
- exam dumps
- copied official objectives
- copied proprietary training material
- copied external articles, slides or video transcripts
- private packet captures
- credentials
- customer data
- personal data

## Rights, sources and trademark policy

Use this principle for every contribution:

```text
Own explanations, own labs, own scenarios, own quiz questions and own screenshots.
External resources are linked and briefly classified, not copied into the course.
```

Rules:

- Do not copy text from books, articles, blogs, documentation, slide decks, videos or commercial training material.
- Do not translate protected external material as a substitute for copying it.
- Do not mirror or fully reproduce official WCA-101 objectives.
- Do not add official logos unless there is explicit permission and the license allows it.
- Do not use Wireshark, WCA or similar marks as if this project were official.
- Use neutral wording such as "unabhängiger Selbstlernkurs", "WCA-nahe Orientierung" and "Kurskompetenzen".
- External references should point to the original source and should not replace the original source.
- Screenshots and images need a documented origin, even when they are created in this repository's own lab environment.
- External packet captures must have a clear license and must be safe to redistribute.

When in doubt, link to the external source instead of copying, embedding or rephrasing it extensively.

## Writing style

Write clearly, practically and step by step.

Prefer explanations that connect concepts to real troubleshooting situations.

Avoid unnecessary academic language.

Prefer this style:

> Ein DNS-Problem erkennst du nicht daran, dass "das Internet nicht geht", sondern daran, dass der Client eine Anfrage stellt und vom DNS-Server keine verwertbare Antwort erhält.

Avoid this style:

> DNS is a hierarchical distributed naming system that resolves domain names into resource records according to RFC-defined mechanisms.

Use examples, small scenarios and practical observations.

## Repository structure

Use the following structure:

```text
docs/       Course documentation and learning content
labs/       Practical exercises
pcaps/      Packet captures
docker/     Docker and lab environment resources
quizzes/    Questions, module self-tests and practice-oriented checks
tools/      Helper scripts and local CLI tools
```

## Documentation conventions

Course documentation belongs in `docs/`.

Each major course section should have its own directory.

Recommended structure:

```text
docs/
├── index.md
├── 00-orientierung/
├── 01-lern-und-uebungsumgebung/
├── 02-linux-grundlagen-fuer-den-kurs/
├── 03-wireshark-erster-kontakt/
├── 10-basis-kurs/
├── 20-advanced-kurs/
├── 30-wca-vorbereitung/
├── 40-labs-und-uebungen/
├── 50-quizzes/
├── 60-pcap-challenges/
└── 90-referenz/
```

## Lab conventions

Each lab should be structured consistently.

Recommended lab structure:

```text
labs/basic/lab-basic-030-dns-nxdomain/
├── README.md
├── scenario.md
├── tasks.md
├── hints.md
├── solution.md
├── metadata.yml
├── check_tshark.sh
└── files/
    └── capture.pcapng
```

Every lab should include:

- Ziel
- Voraussetzungen
- Szenario
- Aufgaben
- Hinweise
- Lösung
- Kurskompetenz-Bezug
- Weiterführende Ressourcen
- Quellen- und Rechtehinweise, wenn externe Quellen, Bilder oder PCAPs verwendet werden

## Lab metadata

Where useful, labs should include machine-readable metadata.

Example:

```yaml
id: lab-basic-030-dns-nxdomain
title: "DNS NXDOMAIN analysieren"
track: basic
level: foundation
estimated_time: 30m
course_competencies:
  - display-filters
  - dns
  - packet-details
  - troubleshooting-basics
tools:
  - wireshark
  - tshark
  - dig
requires:
  - lab-foundation-010-first-capture
outputs:
  - quiz
  - lab-check
  - analysis-report
```

Prefer `course_competencies` for local course alignment. Do not use metadata fields that imply a local copy of official WCA objectives, such as `wca_objectives`.

## WCA-related alignment

When adding lessons or labs, include a course competency mapping where applicable.

The course may reference WCA-101 at a high level, but it must not reproduce official objectives, protected exam content or proprietary training material.

Good:

- "Dieses Lab übt Display Filter, DNS und Paketdetails."
- "Diese Aufgabe trainiert TCP-Troubleshooting-Kompetenzen."
- "Für die verbindliche Prüfungsbeschreibung bitte die offiziellen WCA-101-Informationen prüfen."

Bad:

- "Diese Frage kommt so in der Prüfung vor."
- "Originalfrage aus WCA-101."
- "Die offiziellen WCA-Ziele in deutscher Übersetzung."
- "Vollständige Objective-Liste für die Prüfung."

## External resources

Prefer linking to external resources instead of copying them.

Useful external resources may include:

- official Wireshark documentation
- Wireshark User's Guide
- Wireshark Display Filter Reference
- TShark manual page
- SharkFest talks
- public packet analysis articles
- clearly licensed sample captures
- TCP/IP learning material

Do not copy external articles, slides, videos or packet captures into the repository unless the license clearly allows it.

When an external source is used for inspiration or factual verification, summarize it in your own words and link to the source. Do not convert it into a local replacement for the original.

## Screenshot and image policy

Preferred sources:

- own screenshots from this repository's lab environment
- synthetic data created for this course
- self-created diagrams

Rules:

- Every screenshot or image needs an origin note.
- External screenshots need a clear license or explicit permission.
- Avoid product logos unless their use is necessary and legally safe.
- Do not copy images from books, slide decks, commercial courses, videos or blogs without permission.
- If a screenshot contains hostnames, user names, IP addresses, tokens, cookies or customer data, do not commit it.
- If licensing or privacy is unclear, describe the observation in text instead of adding the image.

## Packet capture policy

Packet captures can contain sensitive data.

Rules:

- Do not commit private captures.
- Do not commit productive network captures.
- Do not commit credentials, tokens or cookies.
- Do not commit customer data.
- Do not commit personal data.
- Prefer self-generated captures.
- Prefer synthetic lab traffic.
- External captures must have a clear license.
- If licensing is unclear, link to the source instead of committing the file.
- Document the origin and safety review for every non-empty PCAP/PCAPNG file.

## Technical baseline

Target platform:

- Ubuntu Desktop LTS
- Pop!_OS as compatible Ubuntu-based variant

Primary tools:

- Wireshark
- TShark
- tcpdump
- VSCode
- Docker
- Docker Compose
- Python
- Bash
- Git
- MkDocs Material

Commands should be suitable for Ubuntu-based systems.

Avoid platform-specific assumptions unless documented.

## Code conventions

Prefer:

- Bash for simple helper scripts
- Python for checks, quiz tooling and progress handling
- Docker Compose for reproducible labs
- Markdown for course content
- YAML for metadata

Scripts should be readable and include helpful error messages.

Do not hide complex logic in unreadable one-liners.

## Progress and quiz tooling

The course should work without a central server.

Progress should be stored locally.

Preferred locations:

```text
~/.local/share/packetanalyse-mit-wireshark-de/progress.json
```

or later:

```text
~/.local/share/packetanalyse-mit-wireshark-de/progress.sqlite
```

Export and import should be supported.

Example commands:

```bash
packetlab progress
packetlab quiz run basic
packetlab lab check lab-basic-030-dns-nxdomain
packetlab exam run module-basic
packetlab progress export ./mein-fortschritt.json
packetlab progress import ./mein-fortschritt.json
```

## MkDocs conventions

The documentation should build with MkDocs Material.

Before committing MkDocs changes, check:

```bash
mkdocs build
```

The navigation should not reference non-existing files unless they are intentionally created in the same change.

## Review checklist

Before accepting changes, check:

- Is the content written in German?
- Is the explanation understandable for the target audience?
- Are commands suitable for Ubuntu-based systems?
- Does the Markdown render correctly?
- Are labs structured consistently?
- Are WCA-related references legitimate, high-level and not copied from protected exam material?
- Are official WCA objectives referenced externally instead of copied, translated or mirrored locally?
- Are external resources linked responsibly?
- Are screenshots, diagrams and images either self-created or clearly licensed and attributed?
- Are non-empty PCAP/PCAPNG files self-generated or clearly licensed and safe to redistribute?
- Are Wireshark, WCA and other marks used only descriptively?
- Are there no private captures, credentials or personal data?
- Does `mkdocs build` complete successfully?
- Do the quality scripts and quiz validations pass?

Recommended local checks:

```bash
python3 tools/quality/check_repo_structure.py
python3 tools/quality/check_markdown_fences.py
python3 tools/packetlab/packetlab.py quiz validate
python3 tools/packetlab/packetlab.py exam validate
mkdocs build
```

## Safety and legality

This project is for learning, troubleshooting and defensive network analysis.

Do not add offensive security instructions beyond defensive packet analysis.

Do not add content that encourages unauthorized packet capture or unauthorized access.

Always remind learners that packet capture is only allowed in networks where they have permission.
