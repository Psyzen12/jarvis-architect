# IDENTITY.md - {{AGENT_NAME}}

## Basic Info
- **Name:** {{AGENT_NAME}}
- **Role:** {{AGENT_ROLE}}
- **Workspace:** workspace-{{AGENT_SLUG}}
- **Channel:** {{PRIMARY_CHANNEL}}
- **Model:** {{MODEL}}

## Capabilities
{{#each CAPABILITIES}}
- {{capability}}
{{/each}}

## Limitations
{{#each LIMITATIONS}}
- {{limitation}}
{{/each}}

## How Others Should Interact With Me
- **Best way to assign work:** {{ASSIGNMENT_STYLE}}
- **Expected response time:** {{RESPONSE_TIME}}
- **How I report completion:** {{COMPLETION_REPORTING}}
- **How to escalate:** {{ESCALATION_PATH}}

## Version
- Created: {{CREATED_DATE}}
- Last updated: {{CREATED_DATE}}
- Architect version: 1.0.0
