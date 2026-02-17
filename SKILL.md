# Jarvis Architect

## Purpose
Guide users through building a complete autonomous agent workspace via a multi-step onboarding conversation. Every OpenClaw agent needs identity, memory, structure, and automation files. This skill generates all of them.

## When to Use
- User says "set up a new agent" or "create an agent workspace"
- User wants to onboard a new agent into their org
- User says "jarvis architect" or "architect my workspace"
- User needs to scaffold agent infrastructure from scratch

## Onboarding Flow

### Step 1: Identity Discovery
**Ask:**
- What is this agent's name?
- What is its primary role? (e.g., frontend developer, copywriter, data analyst)
- What personality traits should it have? (e.g., meticulous, creative, concise)
- What are its core values? (e.g., quality over speed, user-first, pragmatic)
- Any hard constraints? (e.g., never deploy without approval, always write tests)

**Generate:** SOUL.md, IDENTITY.md

### Step 2: User Profile
**Ask:**
- What should the agent call you?
- What's your communication style? (brief/detailed, casual/formal)
- What hours are you typically available?
- Any pet peeves or hard rules? (e.g., no em dashes, always use TypeScript)
- How do you prefer to receive updates? (channel, frequency)

**Generate:** USER.md

### Step 3: Org Structure
**Ask:**
- Who manages this agent? (another agent or human)
- Does it have peers? List them with roles.
- Can it delegate work? To whom?
- What can it do autonomously vs. what needs approval?
- What should it never do?

**Generate:** AGENTS.md

### Step 4: Memory System
**Ask:**
- What should the agent remember long-term? (patterns, decisions, preferences)
- How should daily logs be structured?
- Any project-specific context to pre-load?

**Generate:** MEMORY.md, memory/ directory with template

### Step 5: Heartbeat & Boot
**Ask:**
- How often should the agent check in? (every 15min, hourly, daily)
- What should it check on each heartbeat? (PRs, messages, builds, metrics)
- What's the boot sequence when it starts a session? (read memory, check tasks, etc.)
- Should it proactively find work or wait for assignments?

**Generate:** HEARTBEAT.md, BOOT.md

### Step 6: Tools & Domain
**Ask:**
- What tech stack does this agent work with?
- What repos does it touch?
- What are its common workflows? (feature dev, bug fix, review, etc.)
- What design system or conventions should it follow?

**Generate:** TOOLS.md

### Step 7: Automation
**Ask:**
- What recurring tasks should be automated? (daily standup, weekly review, health checks)
- What scripts would be useful? (build verification, lint, deploy prep)
- Any integrations needed? (GitHub, Slack, etc.)

**Generate:** crons/README.md, scripts/health-check.sh

## After Completion
- Run the health-check script to verify all files exist
- Show a summary of what was generated
- Offer to commit to a git repo
- Suggest next steps (first task, first heartbeat run)

## Quality Checklist
Every generated workspace must have:
- [ ] All 8 core .md files (SOUL, IDENTITY, USER, AGENTS, MEMORY, HEARTBEAT, BOOT, TOOLS)
- [ ] memory/ directory with date-based template
- [ ] crons/ directory with schedule docs
- [ ] scripts/ directory with health check
- [ ] state/observations.md for runtime learnings
- [ ] No placeholder text - everything is filled in based on user answers
- [ ] No em dashes anywhere
- [ ] Consistent formatting and voice throughout
