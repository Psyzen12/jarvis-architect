# Workspace Anatomy

A reference for what each generated file does and why it matters.

## Core Identity Files

### SOUL.md
The agent's personality, values, and decision framework. This is what makes one agent different from another. Without it, every agent is a generic assistant.

**Why it matters:** When an agent faces a tradeoff (speed vs quality, ask vs guess), SOUL.md tells it which way to lean.

### IDENTITY.md
Concrete metadata: name, role, model, channel, capabilities, limitations. The agent's "badge" that tells others how to interact with it.

### USER.md
Profile of the human operator. Communication preferences, timezone, pet peeves. Prevents the agent from annoying the human with the wrong format, frequency, or tone.

## Organizational Files

### AGENTS.md
The org chart. Who manages this agent, who are its peers, what it can delegate, what it can never do. Prevents agents from overstepping authority.

### BOOT.md
Startup checklist. Every new session, the agent reads this to orient itself: who am I, what happened last time, what should I do now. Prevents the "cold start" problem.

## Operational Files

### HEARTBEAT.md
The autonomous loop definition. How often the agent checks in, what it checks, how it prioritizes. Only meaningful for platforms with autonomous scheduling (OpenClaw).

### TOOLS.md
Tech stack, workflows, and authority levels. The "how to do my job" manual. Includes what the agent can do alone vs what needs approval.

### MEMORY.md
Long-term memory architecture. Patterns, lessons, preferences learned over time. Links to daily logs in memory/.

## Support Structure

### memory/YYYY-MM-DD.md
Daily logs. What was done, what was decided, what was learned. The agent's work journal.

### crons/README.md
Documentation of scheduled tasks. Human-readable reference for what runs when.

### scripts/health-check.sh
Workspace validation. Checks that all files exist, are non-empty, and follow style rules.

### state/observations.md
Runtime learnings. Updated as the agent works. A scratchpad for insights that have not yet been promoted to MEMORY.md.

### metadata.yaml
Machine-readable agent config. Useful for tooling that needs to enumerate or manage agents programmatically.
