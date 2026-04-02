#!/data/data/com.termux/files/usr/bin/bash

OUTDIR="dist/audit_bundle_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTDIR"

cp governance/telemetry.jsonl "$OUTDIR/"
cp governance/AUDIT_REPORT.md "$OUTDIR/" 2>/dev/null
cp LICENSE_AUTHORITY.md "$OUTDIR/" 2>/dev/null
cp GOVERNANCE_BOUNDARY.md "$OUTDIR/" 2>/dev/null

sha256sum "$OUTDIR"/* > "$OUTDIR/CHECKSUMS.sha256"

echo "Audit bundle created → $OUTDIR"
