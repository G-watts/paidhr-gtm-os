# treg (project-scoped)

treg is a gateway that lets an agent call 4,000+ data and model endpoints (enrichment, email finding, SEO, ads, web data) with one account. Calls are billed from a prepaid balance at the provider's rate. Source: https://treg.to/pricing, https://treg.to/docs

Everything for treg lives inside this project. Nothing is installed globally.

## Layout

| Path | What | In Git? |
|---|---|---|
| `.treg/bin/` | standalone `uv` binary | no (gitignored) |
| `.treg/python/` | private Python 3.12 managed by uv | no |
| `.treg/venv/` | virtualenv with `tools-registry[proxy]` (the `treg` CLI) | no |
| `.treg/config.json` | treg config and **login token** (secret) | no |
| `tools/treg/treg.cmd`, `tools/treg/treg` | wrappers that set `TREG_CONFIG` to `.treg/config.json` and turn telemetry off | yes |
| `.claude/skills/treg/SKILL.md` | treg skill for Claude Code (from `treg skill bootstrap --project`) | yes |
| `.agents/skills/treg/SKILL.md` | same skill for other agents (Copilot, Cursor, Codex) | yes |
| `.mcp.json` | project-scoped MCP server `https://treg.to/mcp/`, OAuth, no token in file | yes |

## Use

Always run treg through the wrapper so it reads the project config, not `~/.treg`:

```
tools\treg\treg.cmd login        # PowerShell / cmd
tools/treg/treg login            # Git Bash
tools\treg\treg.cmd              # account, team, balance
```

MCP: in Claude Code run `/mcp`, pick `treg`, choose Authenticate. Claude Code stores the OAuth token in its own credential store.

## Rebuild `.treg/` on a new machine

From the project root in PowerShell:

```
$t = "$PWD\.treg"
New-Item -ItemType Directory -Force "$t\download","$t\bin" | Out-Null
Invoke-WebRequest https://github.com/astral-sh/uv/releases/latest/download/uv-x86_64-pc-windows-msvc.zip -OutFile "$t\download\uv.zip"
Expand-Archive "$t\download\uv.zip" "$t\bin" -Force
$env:UV_CACHE_DIR="$t\cache"; $env:UV_PYTHON_INSTALL_DIR="$t\python"; $env:UV_NO_MODIFY_PATH="1"
& "$t\bin\uv.exe" python install 3.12 --no-bin
& "$t\bin\uv.exe" venv "$t\venv" --python 3.12 --managed-python
& "$t\bin\uv.exe" pip install --python "$t\venv\Scripts\python.exe" "tools-registry[proxy]"
tools\treg\treg.cmd config --base-url https://treg.to
```

Do not run `treg mcp install` or the official `install.sh`: both write to user-wide config (`~/.treg`, `claude mcp add --scope user`, Cursor and Codex configs).
