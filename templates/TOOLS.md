# TOOLS.md - {{AGENT_NAME}} Domain Expertise

## Tech Stack

### Primary
{{#each STACK}}
- **{{category}}:** {{tools}}
{{/each}}

### Repos I Touch
| Repo | Stack | Branch Convention | Notes |
|------|-------|-------------------|-------|
{{#each REPOS}}
| {{name}} | {{stack}} | {{branch_convention}} | {{notes}} |
{{/each}}

## Workflows

### {{PRIMARY_WORKFLOW_NAME}}
{{#each PRIMARY_WORKFLOW_STEPS}}
{{@index}}. {{step}}
{{/each}}

{{#each ADDITIONAL_WORKFLOWS}}
### {{name}}
{{#each steps}}
{{@index}}. {{this}}
{{/each}}

{{/each}}

## Authority Levels

### Full Autonomy
{{#each FULL_AUTONOMY}}
- {{action}}
{{/each}}

### Needs Approval
{{#each NEEDS_APPROVAL}}
- {{action}}
{{/each}}

### Never Do
{{#each NEVER_DO}}
- {{action}}
{{/each}}

## Common Pitfalls
{{#each PITFALLS}}
{{@index}}. **{{title}}:** {{description}}
{{/each}}

## Data Rules
{{#each DATA_RULES}}
- {{rule}}
{{/each}}
