# Jarvis Architect

[![OpenClaw Skill](https://img.shields.io/badge/OpenClaw-Skill-blue)](https://clawhub.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-2.1.0-orange)]()

> Zero to fully autonomous agent in under 5 minutes. Conversation, CLI, or config file.

Every OpenClaw agent needs identity files, memory systems, heartbeat loops, and org structure. Setting this up manually takes hours and deep platform knowledge. Jarvis Architect generates everything through a 7-step guided flow or a single script invocation.

## What You Get

A complete, production-ready workspace:

```
workspace-{agent-name}/
  SOUL.md            Core values, personality, decision framework
  IDENTITY.md        Name, role, capabilities, constraints
  USER.md            Human operator profile and preferences
  AGENTS.md          Org chart, delegation rules, handoff protocols
  MEMORY.md          Long-term memory system with daily logs
  HEARTBEAT.md       Autonomous loop configuration
  BOOT.md            Startup sequence and recovery protocol
  TOOLS.md           Tech stack, workflows, authority levels
  BOOTSTRAP.md       First-run checklist
  metadata.yaml      Machine-readable agent config
  memory/
    YYYY-MM-DD.md    Daily log (today's date)
  crons/
    README.md        Cron schedule documentation
  scripts/
    health-check.sh  Workspace completeness verification
  state/
    observations.md  Runtime learnings (grows over time)
```

## Quick Start

### Option 1: Conversational (via your agent)

Tell any OpenClaw agent with this skill installed:

```
"Run jarvis architect"
"Set up a new agent workspace"
"Build me a backend developer agent"
```

The agent walks you through 7 steps, generating files as you go.

### Option 2: Quick Mode (3 questions)

```bash
bash scripts/generate.sh --quick ./workspace-nova
```

Asks for name, role, and your name. Smart defaults handle the rest.

### Option 3: Config File (fully automated)

```bash
# Edit the sample config
cp examples/sample.conf my-agent.conf
vim my-agent.conf

# Validate
bash scripts/validate.sh my-agent.conf

# Generate
bash scripts/generate.sh ./workspace-my-agent my-agent.conf
```

### Option 4: Interactive CLI (full control)

```bash
bash scripts/generate.sh ./workspace-atlas
```

Prompts for every field with sensible defaults.

## The 7 Steps

| # | Step | Generates | Time |
|---|------|-----------|------|
| 1 | Identity Discovery | SOUL.md, IDENTITY.md | ~1 min |
| 2 | User Profile | USER.md | ~30 sec |
| 3 | Org Structure | AGENTS.md | ~1 min |
| 4 | Memory System | MEMORY.md, memory/ | ~30 sec |
| 5 | Heartbeat and Boot | HEARTBEAT.md, BOOT.md | ~1 min |
| 6 | Tools and Domain | TOOLS.md | ~1 min |
| 7 | Automation | crons/, scripts/ | ~30 sec |

Total: under 5 minutes for a complete workspace.

## Health Check

Verify your workspace is complete and well-formed:

```bash
bash scripts/health-check.sh /path/to/workspace
```

Checks for:
- All 8 core files present and non-empty
- Required directories exist
- No em dashes (house style)
- State tracking file exists

## Project Structure

```
jarvis-architect/
  SKILL.md              Skill definition with full onboarding flow
  CONTEXT.md            Design decisions and background
  README.md             This file
  LICENSE               MIT
  templates/            Handlebars-style templates for every file
    SOUL.md
    IDENTITY.md
    USER.md
    AGENTS.md
    HEARTBEAT.md
    BOOT.md
    TOOLS.md
    MEMORY.md
    memory-daily.md
    crons-README.md
  scripts/
    generate.sh         Workspace generator (interactive + config modes)
    validate.sh         Config file validator
    health-check.sh     Workspace completeness checker
  examples/
    sample.conf         Example config with all fields
    minimal.conf        Minimum viable config (3 fields)
  state/
    observations.md     Runtime learnings from usage
```

## Design Principles

- **Opinionated defaults, easy overrides.** Generated files work immediately but are fully editable.
- **No placeholders.** Every field gets filled based on answers, or sensible defaults apply.
- **Convention over configuration.** Follows OpenClaw best practices out of the box.
- **Skip-friendly.** Each step is independent. Skip what you do not need yet.
- **Multiple modes.** Conversation, quick, interactive CLI, or config file. Pick your speed.
- **Reproducible.** Interactive mode saves a config file so you can regenerate anytime.

## For Skill Authors

The templates use `{{VARIABLE_NAME}}` syntax for simple replacement and `{{#each LIST}}` / `{{#if VAR}}` for block structures. The shell-based generator handles simple replacements; block structures are designed for the conversational agent flow where the agent populates them programmatically.

See SKILL.md for the complete variable reference and step-by-step agent instructions.

## Contributing

PRs welcome. Keep templates clean, keep the flow under 5 minutes, keep em dashes out.

## License

MIT
