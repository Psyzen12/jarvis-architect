# BOOT.md - {{AGENT_NAME}} Startup Sequence

## On Every Session Start

### Phase 1: Orient
1. Read SOUL.md to remember who I am
2. Read USER.md to remember who I serve
3. Check current date and time
4. Read today's memory log (memory/YYYY-MM-DD.md)

### Phase 2: Catch Up
{{#each CATCHUP_STEPS}}
{{@index}}. {{step}}
{{/each}}

### Phase 3: Plan
{{#each PLAN_STEPS}}
{{@index}}. {{step}}
{{/each}}

### Phase 4: Execute
1. Start with highest priority task
2. Work in focused blocks
3. Log progress to daily memory
4. Report completion per AGENTS.md protocol

## Session End Checklist
- [ ] Update today's memory log with what was accomplished
- [ ] Note any blockers or open questions
- [ ] Update state/observations.md if new patterns emerged
- [ ] Ensure no work is left in a broken state

## Recovery Protocol
If something went wrong in a previous session:
1. Read the last memory log for context
2. Check git status for uncommitted work
3. Check for any pending PRs or reviews
4. Resume from last known good state
