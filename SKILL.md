# Jarvis Architect - Skill Definition

## Purpose
Guide users through building a complete autonomous agent workspace via a multi-step onboarding conversation. Every OpenClaw agent needs identity, memory, structure, and automation files. This skill generates all of them through a conversational flow or batch script.

## Trigger Phrases
- "set up a new agent" / "create an agent workspace"
- "jarvis architect" / "architect my workspace"
- "onboard a new agent" / "scaffold agent infrastructure"
- "build me an agent"

## Modes

### Conversational Mode (Default)
Walk through 7 steps interactively, generating files at each step. Best for first-time users who want guidance and customization.

### Quick Mode
Ask 3 questions (name, role, user name), apply smart defaults for everything else. Best for experienced users who want speed.

### Script Mode
Use `scripts/generate.sh` with a config file for fully automated generation. Best for CI/CD or batch agent creation.

## Onboarding Flow (7 Steps)

### Step 1: Identity Discovery
**Goal:** Establish who this agent is at its core.

**Ask the user:**
1. What is this agent's name?
2. What is its primary role? (e.g., frontend developer, copywriter, data analyst)
3. Describe its personality in a sentence. (e.g., meticulous and reliable, creative and bold)
4. What are its core values? List 3-4. (e.g., quality over speed, user-first, pragmatic)
5. Any hard constraints it must never break? (e.g., never deploy without approval)

**Generate:** SOUL.md, IDENTITY.md

**How to generate:** Use the templates in `templates/SOUL.md` and `templates/IDENTITY.md`. Replace all `{{VAR}}` placeholders with the user's answers. For list fields (values, traits, constraints), format each as a bullet point. For the decision framework, map the user's values to priority slots 1-4.

### Step 2: User Profile
**Goal:** Understand the human operator this agent serves.

**Ask the user:**
1. What should the agent call you?
2. What's your role? (e.g., CTO, founder, team lead)
3. Your timezone and typical available hours?
4. Communication style preference? (brief vs detailed, casual vs formal)
5. How often do you want updates? (every completion, daily summary, only on issues)
6. Any pet peeves or hard rules? (e.g., no em dashes, always use TypeScript)

**Generate:** USER.md

### Step 3: Org Structure
**Goal:** Map out the agent's relationships and authority.

**Ask the user:**
1. Who manages this agent? (another agent name/ID, or "human")
2. Does it have peers? List them with names and roles.
3. Can it delegate work? To whom and what?
4. What can it do fully autonomously? (e.g., write code, create branches)
5. What needs approval? (e.g., deploy, merge PRs, add dependencies)
6. What should it absolutely never do?

**Generate:** AGENTS.md

### Step 4: Memory System
**Goal:** Set up persistent memory architecture.

**Ask the user:**
1. What should the agent remember long-term? (patterns, preferences, project context)
2. Any project context to pre-load? (repo names, key decisions, conventions)
3. How should daily logs be structured? (default template is usually fine)

**Generate:** MEMORY.md, memory/ directory with today's date template

### Step 5: Heartbeat and Boot
**Goal:** Configure the autonomous operating loop.

**Ask the user:**
1. How often should it check in? (every 15min, 30min, hourly)
2. Active hours? (e.g., 9am-10pm, 24/7)
3. What should it check each heartbeat? (messages, PRs, builds, metrics)
4. Should it proactively find work or wait for assignments?
5. What's the boot sequence priority? (read memory first? check tasks? scan messages?)

**Generate:** HEARTBEAT.md, BOOT.md

### Step 6: Tools and Domain
**Goal:** Define the technical domain and workflows.

**Ask the user:**
1. What tech stack? (languages, frameworks, databases, tools)
2. What repos does it touch? (name, stack, branch conventions)
3. Primary workflow? (e.g., feature development: branch, code, test, PR)
4. Any additional workflows? (bug fix, code review, deployment prep)
5. Design system or conventions to follow?

**Generate:** TOOLS.md

### Step 7: Automation
**Goal:** Set up recurring tasks and scripts.

**Ask the user:**
1. Any recurring tasks? (daily standup summary, weekly review, health checks)
2. What schedule for each? (cron syntax or natural language)
3. Any custom scripts needed? (build verification, lint, deploy prep)

**Generate:** crons/README.md, scripts/health-check.sh (pre-built)

## After All Steps

1. Run health check: `bash scripts/health-check.sh <workspace-path>`
2. Show summary of all generated files with byte counts
3. Offer to initialize a git repo and make first commit
4. Suggest next steps:
   - "Run your first heartbeat to verify the setup"
   - "Add this agent to your OpenClaw gateway config"
   - "Create your first cron job"

## Template Variable Reference

All templates use `{{VARIABLE_NAME}}` syntax. Core variables:

| Variable | Used In | Description |
|----------|---------|-------------|
| AGENT_NAME | All files | Display name of the agent |
| AGENT_ROLE | SOUL, IDENTITY, TOOLS | Primary role description |
| AGENT_SLUG | IDENTITY, metadata | URL-safe lowercase name |
| PERSONALITY_SUMMARY | SOUL | One-sentence personality |
| PRIMARY_CHANNEL | IDENTITY | Main communication channel |
| MODEL | IDENTITY | AI model identifier |
| USER_NAME | USER, MEMORY | Human operator's name |
| USER_ROLE | USER | Human's role |
| TIMEZONE | USER | Human's timezone |
| MANAGER_NAME | AGENTS | Direct manager |
| MANAGER_ID | AGENTS | Manager's agent/human ID |
| HEARTBEAT_FREQUENCY | HEARTBEAT | Check-in interval |
| ACTIVE_HOURS | HEARTBEAT | Operating hours |
| PRIORITY_1-4 | SOUL | Decision framework priorities |
| TONE | SOUL | Communication tone |
| SUCCESS_DEFINITION | SOUL | What success looks like |

For list-type fields (VALUES, TRAITS, CONSTRAINTS, etc.), populate them as markdown bullet lists in the template.

## Quality Rules
- No em dashes anywhere in generated output
- No placeholder text like "TBD" or "TODO" - fill everything or omit
- Every file must have meaningful content, not just headers
- Consistent voice throughout (match the agent's personality)
- All templates must be valid markdown
