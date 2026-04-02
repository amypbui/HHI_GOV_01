#!/data/data/com.termux/files/usr/bin/bash

FILE="governance/telemetry.jsonl"
OUT="governance/AUDIT_REPORT.md"

TOTAL=$(wc -l < "$FILE")
SUCCESS=$(grep -c '"outcome":"success"' "$FILE")
FAIL=$(grep -c '"outcome":"fail"' "$FILE")

echo "# Governance Audit Report" > "$OUT"
echo "" >> "$OUT"
echo "## Summary" >> "$OUT"
echo "- Total Events: $TOTAL" >> "$OUT"
echo "- Success Events: $SUCCESS" >> "$OUT"
echo "- Failed Events: $FAIL" >> "$OUT"
echo "" >> "$OUT"

echo "## Event Log" >> "$OUT"
cat "$FILE" >> "$OUT"

echo "Audit report generated → $OUT"
