# Jarvis Architect - Skill Context

## What This Is
A multi-step onboarding skill that builds a complete autonomous agent workspace from scratch. Through a guided conversation, it generates all the files an OpenClaw agent needs to operate independently: identity, memory, heartbeat loops, boot sequences, cron schedules, and organizational structure.

## Why It Matters
Setting up an autonomous agent workspace manually takes hours and requires deep knowledge of OpenClaw internals. Most users give up or create incomplete setups. Jarvis Architect makes it a 5-minute guided flow that produces production-quality output. High viral potential on ClawHub because every new OpenClaw user needs this.

## Target User
- New OpenClaw users setting up their first agent org
- Experienced users spinning up new agent teams
- Teams standardizing their agent workspace structure

## Skill Flow (7 Steps)

### Step 1: Identity Discovery
Ask the user about their agent's purpose, personality, and role. Generate IDENTITY.md and SOUL.md.

### Step 2: User Profile
Learn about the human operator. Generate USER.md with preferences, communication style, and boundaries.

### Step 3: Org Structure
Map out the agent hierarchy - who reports to whom, what peers exist, delegation rules. Generate AGENTS.md.

### Step 4: Memory System
Set up the memory architecture - daily logs, long-term patterns, project context. Generate MEMORY.md and memory/ directory structure.

### Step 5: Heartbeat & Boot
Configure the agent's autonomous loop - what it checks, how often, what triggers action. Generate HEARTBEAT.md and BOOT.md.

### Step 6: Tools & Domain
Define the agent's technical domain - stack, workflows, authority levels. Generate TOOLS.md.

### Step 7: Automation
Set up cron schedules, scripts, and recurring tasks. Generate crons/ and scripts/ directories.

## Output Structure
```
workspace-{agent-name}/
  SOUL.md          # Core values, personality, decision framework
  IDENTITY.md      # Name, role, capabilities, constraints
  USER.md          # Human operator profile and preferences
  AGENTS.md        # Org chart, delegation rules, handoff protocols
  MEMORY.md        # Memory system overview and patterns
  HEARTBEAT.md     # Autonomous loop configuration
  BOOT.md          # Startup sequence and checklist
  TOOLS.md         # Tech stack, workflows, authority levels
  memory/
    YYYY-MM-DD.md  # Daily log template
  crons/
    README.md      # Cron schedule documentation
  scripts/
    health-check.sh  # Workspace health verification
  state/
    observations.md  # Runtime observations and learnings
```

## Design Principles
- Each step is self-contained and produces a visible artifact
- User can skip steps and come back later
- Generated files are opinionated but editable
- Everything follows OpenClaw conventions
- No em dashes anywhere (house style)
