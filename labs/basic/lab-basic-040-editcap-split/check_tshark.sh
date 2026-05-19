#!/usr/bin/env bash
set -euo pipefail

PCAP_SOURCE="${1:-pcaps/generated/lab-basic-040-source.pcapng}"
PCAP_DNS="${2:-pcaps/generated/lab-basic-040-dns-fehler.pcapng}"
PCAP_TCP="${3:-pcaps/generated/lab-basic-040-tcp-probleme.pcapng}"

echo "Lab Basic 040: Große Captures handhaben – Prüfskript"
echo

# Werkzeuge prüfen
for tool in tshark capinfos editcap; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "ERROR: $tool nicht gefunden. Bitte Wireshark/TShark installieren." >&2
    exit 2
  fi
done

failures=0

check_file_exists() {
  local label="$1"
  local path="$2"

  if [ -f "$path" ]; then
    local size
    size="$(du -h "$path" | cut -f1)"
    printf "OK   %-52s %s\n" "$label" "$size"
  else
    printf "FAIL %-52s Datei nicht gefunden: %s\n" "$label" "$path"
    failures=$((failures + 1))
    return 1
  fi
}

check_packet_count() {
  local label="$1"
  local path="$2"
  local min_count="$3"
  local count

  if [ ! -f "$path" ]; then
    printf "SKIP %-52s Datei nicht vorhanden\n" "$label"
    return 0
  fi

  count="$(tshark -r "$path" 2>/dev/null | wc -l | tr -d ' ')"

  if [ "$count" -ge "$min_count" ]; then
    printf "OK   %-52s %s Pakete\n" "$label" "$count"
  else
    printf "FAIL %-52s %s Pakete (erwartet >= %s)\n" "$label" "$count" "$min_count"
    failures=$((failures + 1))
    return 1
  fi
}

check_filter_result() {
  local label="$1"
  local path="$2"
  local filter="$3"
  local min_count="$4"
  local count

  if [ ! -f "$path" ]; then
    printf "SKIP %-52s Datei nicht vorhanden\n" "$label"
    return 0
  fi

  count="$(tshark -r "$path" -Y "$filter" 2>/dev/null | wc -l | tr -d ' ')"

  if [ "$count" -ge "$min_count" ]; then
    printf "OK   %-52s %s Pakete\n" "$label" "$count"
  else
    printf "FAIL %-52s %s Pakete (erwartet >= %s)\n" "$label" "$count" "$min_count"
    failures=$((failures + 1))
    return 1
  fi
}

# 1. Quelldatei prüfen
echo "--- Quelldatei ---"
check_file_exists "Quell-Capture vorhanden" "$PCAP_SOURCE"
check_packet_count "Quell-Capture hat Pakete" "$PCAP_SOURCE" 10
echo

# 2. capinfos-Ausgabe anzeigen
if [ -f "$PCAP_SOURCE" ]; then
  echo "--- capinfos-Ausgabe ---"
  capinfos "$PCAP_SOURCE" 2>/dev/null | grep -E "Number of packets|Duration|Start time|End time" || true
  echo
fi

# 3. Split-Dateien prüfen
echo "--- Zeit-Splits ---"
SPLIT_DIR="pcaps/generated/lab-040-splits"
if [ -d "$SPLIT_DIR" ]; then
  split_count="$(find "$SPLIT_DIR" -name "*.pcapng" | wc -l | tr -d ' ')"
  if [ "$split_count" -ge 2 ]; then
    printf "OK   %-52s %s Dateien\n" "Split-Dateien vorhanden" "$split_count"
  else
    printf "FAIL %-52s %s Dateien (erwartet >= 2)\n" "Split-Dateien vorhanden" "$split_count"
    failures=$((failures + 1))
  fi
else
  printf "FAIL %-52s Verzeichnis nicht gefunden: %s\n" "Split-Verzeichnis" "$SPLIT_DIR"
  failures=$((failures + 1))
fi
echo

# 4. DNS-gefilterte Datei prüfen
echo "--- DNS-Fehler-Capture ---"
check_file_exists "DNS-Fehler-Capture vorhanden" "$PCAP_DNS"
if [ -f "$PCAP_DNS" ]; then
  check_filter_result "Nur DNS-Fehler (rcode != 0)" "$PCAP_DNS" "dns.flags.rcode != 0" 1
  # Sicherstellen, dass keine normalen DNS-Antworten drin sind
  normal_dns="$(tshark -r "$PCAP_DNS" -Y "dns.flags.rcode == 0" 2>/dev/null | wc -l | tr -d ' ')"
  if [ "$normal_dns" -eq 0 ]; then
    printf "OK   %-52s keine normalen DNS-Antworten\n" "DNS-Filter korrekt"
  else
    printf "WARN %-52s %s normale DNS-Antworten enthalten\n" "DNS-Filter prüfen" "$normal_dns"
  fi
fi
echo

# 5. TCP-gefilterte Datei prüfen
echo "--- TCP-Probleme-Capture ---"
check_file_exists "TCP-Probleme-Capture vorhanden" "$PCAP_TCP"
if [ -f "$PCAP_TCP" ]; then
  check_packet_count "TCP-Probleme-Capture hat Pakete" "$PCAP_TCP" 1
fi
echo

# 6. Ergebnis
if [ "$failures" -eq 0 ]; then
  echo "Ergebnis: BESTANDEN – alle Pflichtprüfungen erfolgreich."
else
  echo "Ergebnis: $failures Prüfung(en) fehlgeschlagen."
  echo "Lies die Hinweise in hints.md und prüfe deine Kommandos."
  exit 1
fi
