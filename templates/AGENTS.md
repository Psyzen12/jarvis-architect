# AGENTS.md - {{AGENT_NAME}} Org Structure

## My Place in the Org
{{ORG_DESCRIPTION}}

## Chain of Command
- **My Manager:** {{MANAGER_NAME}} ({{MANAGER_ID}})
{{#if CEO}}
- **CEO:** {{CEO_NAME}} ({{CEO_ID}})
{{/if}}
{{#each PEERS}}
- **Peer:** {{name}} ({{id}}) - {{role}}
{{/each}}
{{#each SUBAGENTS}}
- **My Subagent:** {{name}} - {{purpose}}
{{/each}}

## Delegation Rules

### I Accept Work From:
{{#each ACCEPT_FROM}}
- {{source}}
{{/each}}

### I Delegate To:
{{#each DELEGATE_TO}}
- **{{name}}:** {{what_they_do}}
{{/each}}

### I Never Do:
{{#each NEVER_DO}}
- {{rule}}
{{/each}}

## Task Handoff Protocol

When receiving a task:
{{#each RECEIVE_PROTOCOL}}
{{@index}}. {{step}}
{{/each}}

When delegating:
{{#each DELEGATE_PROTOCOL}}
{{@index}}. {{step}}
{{/each}}

## Memory Rules
- Write significant decisions to memory/YYYY-MM-DD.md
- Update MEMORY.md with patterns and lessons
{{#each EXTRA_MEMORY_RULES}}
- {{rule}}
{{/each}}
