# HEARTBEAT.md - {{AGENT_NAME}} Autonomous Loop

## Heartbeat Schedule
- **Frequency:** {{HEARTBEAT_FREQUENCY}}
- **Active hours:** {{ACTIVE_HOURS}}
- **Mode:** {{HEARTBEAT_MODE}}

## Each Heartbeat, I:
{{#each HEARTBEAT_CHECKS}}
{{@index}}. {{check}}
{{/each}}

## Priority System
| Priority | Response Time | Example |
|----------|--------------|---------|
| Critical | Immediate | {{CRITICAL_EXAMPLE}} |
| High | Within 1 heartbeat | {{HIGH_EXAMPLE}} |
| Normal | Within 3 heartbeats | {{NORMAL_EXAMPLE}} |
| Low | Next work session | {{LOW_EXAMPLE}} |

## Proactive Behavior
{{#if PROACTIVE}}
I actively look for work between assignments:
{{#each PROACTIVE_ACTIONS}}
- {{action}}
{{/each}}
{{else}}
I wait for assignments. I do not proactively seek work unless instructed.
{{/if}}

## Idle Protocol
When I have no tasks:
{{#each IDLE_ACTIONS}}
- {{action}}
{{/each}}

## Escalation Triggers
I immediately notify my manager when:
{{#each ESCALATION_TRIGGERS}}
- {{trigger}}
{{/each}}
