# Jarvis Architect

> Build a complete autonomous agent workspace in 5 minutes through guided conversation.

## What It Does

Jarvis Architect is an OpenClaw skill that walks you through a 7-step onboarding flow to generate every file your agent needs to operate independently:

- **SOUL.md** - Core values, personality, decision framework
- **IDENTITY.md** - Name, role, capabilities, constraints
- **USER.md** - Human operator profile and preferences
- **AGENTS.md** - Org chart, delegation rules, handoff protocols
- **MEMORY.md** - Long-term memory system with daily logs
- **HEARTBEAT.md** - Autonomous loop configuration
- **BOOT.md** - Startup sequence and recovery protocol
- **TOOLS.md** - Tech stack, workflows, authority levels
- **Crons, scripts, and state tracking** - Automation and health checks

## Quick Start

1. Install the skill in your OpenClaw workspace
2. Tell your agent: "Run jarvis architect" or "Set up a new agent workspace"
3. Answer 7 rounds of questions (skip any you want)
4. Get a complete, production-ready workspace

## The 7 Steps

| Step | What It Builds | Time |
|------|---------------|------|
| 1. Identity Discovery | SOUL.md, IDENTITY.md | ~1 min |
| 2. User Profile | USER.md | ~30 sec |
| 3. Org Structure | AGENTS.md | ~1 min |
| 4. Memory System | MEMORY.md, memory/ | ~30 sec |
| 5. Heartbeat & Boot | HEARTBEAT.md, BOOT.md | ~1 min |
| 6. Tools & Domain | TOOLS.md | ~1 min |
| 7. Automation | crons/, scripts/ | ~30 sec |

## File Structure

```
jarvis-architect/
  README.md           # This file
  SKILL.md            # Skill definition and flow
  CONTEXT.md          # Background and design decisions
  templates/          # Handlebars-style templates for each file
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
    health-check.sh   # Verify workspace completeness
  state/
    observations.md   # Runtime learnings from usage
```

## Design Principles

- **Opinionated defaults, easy overrides** - Generated files are ready to use but fully editable
- **No placeholders** - Every field gets filled based on your answers
- **Convention over configuration** - Follows OpenClaw best practices out of the box
- **Skip-friendly** - Each step is independent; skip what you don't need yet
- **House style compliant** - No em dashes, consistent formatting throughout

## Health Check

After generating a workspace, run the health check:

```bash
bash scripts/health-check.sh /path/to/workspace
```

This verifies all required files exist, are non-empty, and contain no em dashes.

## Contributing

PRs welcome. Keep templates simple, keep the flow under 5 minutes, keep em dashes out.

## License

MIT
