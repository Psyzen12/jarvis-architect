#!/bin/bash
# Jarvis Architect - Workspace Generator
# Processes templates and creates a complete agent workspace
# Usage: bash scripts/generate.sh <output-dir> <config-file>
#
# The config file is a simple KEY=VALUE file with template variables.
# Example:
#   AGENT_NAME=Atlas
#   AGENT_ROLE=backend developer
#   AGENT_SLUG=atlas
#   ...

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATE_DIR="$SKILL_DIR/templates"

OUTPUT_DIR="${1:?Usage: generate.sh <output-dir> <config-file>}"
CONFIG_FILE="${2:?Usage: generate.sh <output-dir> <config-file>}"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: Config file not found: $CONFIG_FILE"
  exit 1
fi

echo "=== Jarvis Architect - Generating Workspace ==="
echo "Output: $OUTPUT_DIR"
echo "Config: $CONFIG_FILE"
echo ""

# Create directory structure
mkdir -p "$OUTPUT_DIR"/{memory,crons,scripts,state}

# Load config as environment variables
set -a
source "$CONFIG_FILE"
set +a

# Set defaults
DATE="${DATE:-$(date +%Y-%m-%d)}"
CREATED_DATE="${CREATED_DATE:-$DATE}"

# Simple template processor - replaces {{VAR}} with $VAR value
process_template() {
  local template="$1"
  local output="$2"

  if [ ! -f "$template" ]; then
    echo "  SKIP: Template not found: $template"
    return
  fi

  local content
  content=$(cat "$template")

  # Replace simple {{VAR}} placeholders
  while IFS= read -r line; do
    key="${line%%=*}"
    value="${line#*=}"
    content="${content//\{\{$key\}\}/$value}"
  done < "$CONFIG_FILE"

  # Replace {{DATE}} with current date
  content="${content//\{\{DATE\}\}/$DATE}"
  content="${content//\{\{CREATED_DATE\}\}/$CREATED_DATE}"

  # Strip remaining handlebars block helpers ({{#each}}, {{/each}}, {{#if}}, {{/if}})
  # These need the full onboarding flow to populate; leave clean placeholder comments
  content=$(echo "$content" | sed -E '/\{\{#(each|if)/d; /\{\{\/(each|if)/d; /\{\{@index\}\}/d')

  echo "$content" > "$output"
  echo "  OK: $(basename "$output")"
}

echo "--- Generating Core Files ---"
process_template "$TEMPLATE_DIR/SOUL.md" "$OUTPUT_DIR/SOUL.md"
process_template "$TEMPLATE_DIR/IDENTITY.md" "$OUTPUT_DIR/IDENTITY.md"
process_template "$TEMPLATE_DIR/USER.md" "$OUTPUT_DIR/USER.md"
process_template "$TEMPLATE_DIR/AGENTS.md" "$OUTPUT_DIR/AGENTS.md"
process_template "$TEMPLATE_DIR/MEMORY.md" "$OUTPUT_DIR/MEMORY.md"
process_template "$TEMPLATE_DIR/HEARTBEAT.md" "$OUTPUT_DIR/HEARTBEAT.md"
process_template "$TEMPLATE_DIR/BOOT.md" "$OUTPUT_DIR/BOOT.md"
process_template "$TEMPLATE_DIR/TOOLS.md" "$OUTPUT_DIR/TOOLS.md"

echo ""
echo "--- Generating Support Files ---"
process_template "$TEMPLATE_DIR/crons-README.md" "$OUTPUT_DIR/crons/README.md"
process_template "$TEMPLATE_DIR/memory-daily.md" "$OUTPUT_DIR/memory/$DATE.md"

# Copy health check script
cp "$SKILL_DIR/scripts/health-check.sh" "$OUTPUT_DIR/scripts/health-check.sh"
chmod +x "$OUTPUT_DIR/scripts/health-check.sh"
echo "  OK: scripts/health-check.sh"

# Create observations file
cat > "$OUTPUT_DIR/state/observations.md" << 'EOF'
# Observations

## Runtime Learnings
_This file is updated as the agent operates. Each observation helps improve future sessions._

## Patterns Noticed
- (none yet)

## Improvement Ideas
- (none yet)
EOF
echo "  OK: state/observations.md"

echo ""
echo "=== Generation Complete ==="
echo ""

# Run health check
echo "Running health check..."
bash "$OUTPUT_DIR/scripts/health-check.sh" "$OUTPUT_DIR"
