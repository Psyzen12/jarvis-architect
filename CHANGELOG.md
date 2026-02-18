# Changelog

## v2.2.0 (2026-02-18)

### Added
- lib/defaults.sh: Extracted default values into reusable library
- references/PLATFORM_COMPATIBILITY.md: Triple platform guide (OpenClaw + Claude Code + Codex)
- references/WORKSPACE_ANATOMY.md: Detailed explanation of every generated file

### Improved
- Removed empty "Pet Peeves" and "Hard Rules" sections from quick mode output
- Fixed "Proactive Behavior" section showing duplicate intro text in HEARTBEAT.md
- TOOLS.md Tech Stack section shows helpful placeholder instead of empty headers
- AGENTS.md simplified for quick mode (no empty delegation sections)
- Python post-processor handles nested empty section cleanup more robustly
- Architect version bumped to 2.2.0 in metadata output

## v2.1.0 (2026-02-18)

### Improved
- Empty markdown sections are now automatically removed from generated output
- USER.md template no longer leaves placeholder text for update format
- Shell generator uses Python post-processor for cleaner section cleanup
- All generated files pass zero-placeholder validation

### Fixed
- Handlebars block syntax cleanup now handles all edge cases
- No more "(not set)" leaking into generated workspaces in quick mode

## v2.0.0 (2026-02-17)

### Added
- Interactive CLI mode with full field prompting
- Quick mode (3 questions, smart defaults)
- Config file mode for automated/CI generation
- Config validator script (validate.sh)
- Health check script (health-check.sh)
- Sample and minimal config examples
- BOOTSTRAP.md first-run checklist generation
- metadata.yaml machine-readable config
- Auto-saves config for reproducible regeneration

### Templates
- SOUL.md with decision framework and personality
- IDENTITY.md with capabilities and interaction guide
- USER.md with communication preferences
- AGENTS.md with org structure and delegation rules
- MEMORY.md with long-term memory architecture
- HEARTBEAT.md with autonomous loop configuration
- BOOT.md with startup sequence and recovery
- TOOLS.md with tech stack and authority levels
- Daily memory log template
- Cron schedule README template

## v1.0.0 (2026-02-17)

### Added
- Initial skill definition (SKILL.md)
- Context document (CONTEXT.md)
- Basic template set
- 7-step conversational onboarding flow design
