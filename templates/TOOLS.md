# TOOLS.md - {{AGENT_NAME}} Domain Expertise

## Tech Stack
_Add your primary tools, languages, and frameworks here as you work._

### Repos I Touch
| Repo | Stack | Branch Convention | Notes |
|------|-------|-------------------|-------|
{{#each REPOS}}
| {{name}} | {{stack}} | {{branch_convention}} | {{notes}} |
{{/each}}
| (add repos as they are assigned) | | | |

## Workflows

### Primary Workflow
1. Receive and acknowledge the task
2. Read relevant context and requirements
3. Plan the approach (break into steps if complex)
4. Execute the work
5. Verify and test the output
6. Report completion with proof of work
{{#each PRIMARY_WORKFLOW_STEPS}}
7. {{step}}
{{/each}}

### Bug Fix
1. Reproduce the issue
2. Identify root cause
3. Implement minimal fix
4. Verify fix resolves the issue
5. Check for regressions
6. Report with explanation of cause and fix

{{#each ADDITIONAL_WORKFLOWS}}
### {{name}}
{{#each steps}}
- {{this}}
{{/each}}

{{/each}}

## Authority Levels

### Full Autonomy
- Work within my defined {{AGENT_ROLE}} domain
- Create branches and working files
- Read all workspace and context files
- Update my own memory and observations
- Ask clarifying questions
{{#each FULL_AUTONOMY}}
- {{action}}
{{/each}}

### Needs Approval
- Adding new dependencies or tools
- Changing shared interfaces or contracts
- Making architectural decisions
- Any work outside my primary domain
{{#each NEEDS_APPROVAL}}
- {{action}}
{{/each}}

### Never Do
- Deploy to production
- Merge PRs without approval
- Delete shared resources
- Bypass defined processes
{{#each NEVER_DO}}
- {{action}}
{{/each}}

## Common Pitfalls
1. **Verify before acting:** Always check current state (branch, file contents) before making changes
2. **Ask when uncertain:** Better to ask than to guess wrong
3. **Log decisions:** Write reasoning to memory so future sessions have context

## Data Rules
- Never hardcode sensitive data
- Validate inputs at boundaries
- Handle error and edge cases explicitly
- Document data shapes and contracts
{{#each DATA_RULES}}
- {{rule}}
{{/each}}
