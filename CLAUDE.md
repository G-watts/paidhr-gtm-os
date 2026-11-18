# PaidHR GTM Context OS

## Company

PaidHR (paidhr.com): HR and payroll platform for African businesses. Full summary to be filled in after research.

## How this folder works

- `.claude/skills/`: reusable Claude skills for repeat GTM tasks. Read when a task matches a skill.
- `context/icp/`: ideal customer profiles and buyer personas. Read before targeting, list building or writing copy.
- `context/positioning/`: market category, competitors, differentiation. Read before any messaging or competitive work.
- `context/messaging/`: value props, pain points, proof points, objection handling. Read before writing any copy.
- `context/brand-kit/`: voice, tone, visual rules, approved terms. Read before producing anything customer-facing.
- `context/docs/research/`: raw research notes with sources. Read when you need to verify or cite a company fact.
- `knowledge-base/playbooks/`: step-by-step workflows that work. Read before running a repeatable motion.
- `knowledge-base/learnings/`: results, experiments, what worked and what did not. Read before planning a new campaign.
- `meetings/`: meeting notes and decisions. Read when picking up work that came out of a meeting.
- `output/campaigns/`: finished deliverables per campaign (copy, specs, lists). Write here; read to reuse past work.
- `output/outbound/`: outbound sequences, email and LinkedIn copy, workflow specs. Write here; read before new outbound.
- `output/social/`: social posts and content drafts. Write here; read before new social content.
- `output/data/`: lists, enrichment outputs and signal data (CSV/XLSX are gitignored). Read when building lists.
- `inspiration/`: ads and examples to learn from, with a note on why each works. Read before writing copy or creative.
- `tools/`: tool configs, scripts and integration notes. Read before touching any tool or integration.
- `weekly-priorities/`: one file per ISO week (`YYYY-Www.md`). Read at the start of every session.
- `work-log/`: one file per ISO week logging every change. Append after every change.

## Rules

1. Cite a source (URL or file path) for every company fact. No source, no fact.
2. Never invent numbers. If a figure is unknown, write "unknown" and flag it.
3. No em dashes in any copy. Use commas, colons, full stops or parentheses.
4. Ask before sending or publishing anything (emails, posts, CRM writes, uploads).
5. Log every change in this week's work log (`work-log/YYYY-Www.md`) with a timestamp.

## Tools

- **treg** (CLI): paid data lookups (enrichment, email finding, SEO, ads, web data). Run via `tools\treg\treg.cmd`, never a global `treg`; skill in `.claude/skills/treg/`, setup in `tools/treg/README.md`. Check the price (`catalog get <id>`) before every call and get approval for anything paid.
- **Miro** (MCP, via plugin `miro@miro-ai`): diagrams, such as GTM system maps and workflow flows. Ask before creating or editing any board.
- **Notion** (MCP, `notion` in `.mcp.json`): where we publish finished docs. GitHub stays the source of truth: write and commit here first, then publish to Notion. Ask before creating or editing any page.

