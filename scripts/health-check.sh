#!/bin/bash
# Workspace Health Check - Verifies all required files exist and are non-empty
# Usage: bash scripts/health-check.sh /path/to/workspace

WORKSPACE="${1:-.}"
ERRORS=0
WARNINGS=0

echo "=== Workspace Health Check ==="
echo "Checking: $WORKSPACE"
echo ""

# Required files
REQUIRED_FILES=(
  "SOUL.md"
  "IDENTITY.md"
  "USER.md"
  "AGENTS.md"
  "MEMORY.md"
  "HEARTBEAT.md"
  "BOOT.md"
  "TOOLS.md"
)

echo "--- Core Files ---"
for file in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$WORKSPACE/$file" ]; then
    echo "  MISSING: $file"
    ((ERRORS++))
  elif [ ! -s "$WORKSPACE/$file" ]; then
    echo "  EMPTY:   $file"
    ((WARNINGS++))
  else
    size=$(wc -c < "$WORKSPACE/$file" | tr -d ' ')
    echo "  OK:      $file ($size bytes)"
  fi
done

echo ""
echo "--- Directories ---"

REQUIRED_DIRS=("memory" "crons" "scripts" "state")
for dir in "${REQUIRED_DIRS[@]}"; do
  if [ ! -d "$WORKSPACE/$dir" ]; then
    echo "  MISSING: $dir/"
    ((ERRORS++))
  else
    count=$(find "$WORKSPACE/$dir" -type f | wc -l | tr -d ' ')
    echo "  OK:      $dir/ ($count files)"
  fi
done

echo ""
echo "--- State Files ---"
if [ -f "$WORKSPACE/state/observations.md" ]; then
  echo "  OK:      state/observations.md"
else
  echo "  MISSING: state/observations.md"
  ((WARNINGS++))
fi

echo ""
echo "--- Em Dash Check ---"
emdash_count=$(grep -r $'\xe2\x80\x94' "$WORKSPACE"/*.md 2>/dev/null | wc -l | tr -d ' ')
if [ "$emdash_count" -gt 0 ]; then
  echo "  WARNING: Found $emdash_count lines with em dashes"
  ((WARNINGS++))
else
  echo "  OK:      No em dashes found"
fi

echo ""
echo "=== Results ==="
echo "Errors:   $ERRORS"
echo "Warnings: $WARNINGS"

if [ "$ERRORS" -gt 0 ]; then
  echo "STATUS:   FAILED"
  exit 1
elif [ "$WARNINGS" -gt 0 ]; then
  echo "STATUS:   PASSED (with warnings)"
  exit 0
else
  echo "STATUS:   PERFECT"
  exit 0
fi
