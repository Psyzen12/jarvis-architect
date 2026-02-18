#!/bin/bash
# Jarvis Architect - Config Validator
# Validates a config file has all required fields before generation.
# Usage: bash scripts/validate.sh <config-file>

set -euo pipefail

CONFIG_FILE="${1:?Usage: validate.sh <config-file>}"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: File not found: $CONFIG_FILE"
  exit 1
fi

REQUIRED=(
  AGENT_NAME
  AGENT_ROLE
  USER_NAME
)

RECOMMENDED=(
  AGENT_SLUG
  PERSONALITY_SUMMARY
  PRIMARY_CHANNEL
  MODEL
  USER_ROLE
  TIMEZONE
  MANAGER_NAME
  HEARTBEAT_FREQUENCY
  PRIORITY_1
  TONE
  SUCCESS_DEFINITION
)

ERRORS=0
WARNINGS=0

echo "=== Config Validation ==="
echo "File: $CONFIG_FILE"
echo ""

echo "--- Required Fields ---"
for field in "${REQUIRED[@]}"; do
  value=$(grep -E "^${field}=" "$CONFIG_FILE" 2>/dev/null | head -1 | cut -d= -f2-)
  if [ -z "$value" ]; then
    echo "  MISSING: $field"
    ((ERRORS++))
  else
    echo "  OK:      $field = $value"
  fi
done

echo ""
echo "--- Recommended Fields ---"
for field in "${RECOMMENDED[@]}"; do
  value=$(grep -E "^${field}=" "$CONFIG_FILE" 2>/dev/null | head -1 | cut -d= -f2-)
  if [ -z "$value" ]; then
    echo "  EMPTY:   $field (will use default)"
    ((WARNINGS++))
  else
    echo "  OK:      $field"
  fi
done

echo ""
echo "--- Style Check ---"
emdash_count=$(grep -c $'\xe2\x80\x94' "$CONFIG_FILE" 2>/dev/null || true)
if [ "$emdash_count" -gt 0 ]; then
  echo "  WARNING: Config contains em dashes ($emdash_count instances)"
  ((WARNINGS++))
else
  echo "  OK:      No em dashes"
fi

echo ""
echo "=== Results ==="
echo "Errors:   $ERRORS"
echo "Warnings: $WARNINGS"

if [ "$ERRORS" -gt 0 ]; then
  echo "STATUS: INVALID - fix required fields before generating"
  exit 1
else
  echo "STATUS: VALID"
  exit 0
fi
