# Cron Schedule - {{AGENT_NAME}}

## Active Crons

| Schedule | Task | Description |
|----------|------|-------------|
{{#each CRONS}}
| {{schedule}} | {{task}} | {{description}} |
{{/each}}

## How Crons Work in OpenClaw
- Crons are defined in the OpenClaw gateway configuration
- Each cron triggers a message to the agent on its channel
- The agent processes the message like any other task
- Use `openclaw cron list` to see active crons
- Use `openclaw cron add` to create new ones

## Adding a New Cron
1. Determine the schedule (cron syntax or interval)
2. Write a clear trigger message
3. Add via `openclaw cron add --agent {{AGENT_SLUG}} --schedule "..." --message "..."`
4. Update this README with the new entry
5. Monitor the first few runs to verify behavior
