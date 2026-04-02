#!/data/data/com.termux/files/usr/bin/bash

EVENT=$1
ACTOR=${2:-user}
BOUNDARY=${3:-unknown}
ACTION=${4:-none}
OUTCOME=${5:-unknown}
ESCALATION=${6:-none}
SEVERITY=${7:-low}

# Persist escalation state
ESC_FILE="governance/escalation_state.json"

if [ "$ESCALATION" != "none" ]; then
  echo "{\"event\":\"$EVENT\",\"status\":\"active\",\"severity\":\"$SEVERITY\",\"timestamp\":\"$(date -u +"%Y-%m-%dT%H:%M:%SZ")\"}" >> "$ESC_FILE"
fi

echo "{\"event\":\"$EVENT\",\"actor\":\"$ACTOR\",\"decision_boundary\":\"$BOUNDARY\",\"action\":\"$ACTION\",\"outcome\":\"$OUTCOME\",\"escalation\":\"$ESCALATION\",\"severity\":\"$SEVERITY\",\"timestamp\":\"$(date -u +"%Y-%m-%dT%H:%M:%SZ")\"}" >> governance/telemetry.jsonl
