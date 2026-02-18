# Platform Compatibility Guide

Jarvis Architect generates workspaces that work across three platforms. This document explains how.

## Supported Platforms

### OpenClaw
The native platform. All generated files follow OpenClaw conventions directly. Heartbeat, crons, and boot sequences integrate with the OpenClaw gateway.

### Claude Code (Anthropic CLI)
Claude Code reads CLAUDE.md or AGENTS.md from the workspace root. The generated AGENTS.md, TOOLS.md, and BOOT.md provide all the context Claude Code needs. To use:
1. Generate the workspace
2. Copy or symlink AGENTS.md to CLAUDE.md if needed
3. Claude Code will pick up identity, workflows, and constraints automatically

### Codex (OpenAI CLI)
Codex reads AGENTS.md from the repo root. The generated files are compatible. To use:
1. Generate the workspace
2. Codex reads AGENTS.md for delegation and authority rules
3. TOOLS.md provides tech stack and workflow context

## File Mapping

| Generated File | OpenClaw | Claude Code | Codex |
|---------------|----------|-------------|-------|
| SOUL.md | Identity core | System prompt context | System prompt context |
| IDENTITY.md | Agent metadata | Read on boot | Read on boot |
| USER.md | Operator prefs | User context | User context |
| AGENTS.md | Org structure | CLAUDE.md equivalent | AGENTS.md (native) |
| MEMORY.md | Persistent memory | Session context | Session context |
| HEARTBEAT.md | Cron loop config | N/A (manual) | N/A (manual) |
| BOOT.md | Startup sequence | Session init | Session init |
| TOOLS.md | Domain/workflows | Tool guidance | Tool guidance |

## Key Differences

- **Heartbeat/Crons**: Only OpenClaw supports autonomous heartbeat loops natively. On Claude Code and Codex, the human triggers sessions manually.
- **Memory persistence**: OpenClaw persists memory across sessions via workspace files. Claude Code and Codex rely on the same files but the human must ensure they persist between invocations.
- **Channel integration**: OpenClaw connects to Discord/Telegram/Slack natively. Other platforms use terminal I/O.

## Making It Work Everywhere

The generated workspace is just markdown files and shell scripts. Any AI coding assistant that reads markdown context files will benefit from the structure. The key insight: good agent scaffolding is platform-agnostic because it is just well-organized context.
