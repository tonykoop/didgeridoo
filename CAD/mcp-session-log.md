# MCP Session Log

Status: starter provenance log, not V5 sign-off.

This repository currently has no recorded Claude Desktop MCP design session
that produced OpenSCAD, Blender, Illustrator, Photoshop, DXF, SVG, render, or
print-packet artifacts. The log exists so future V5 work has a stable audit
trail before any generated CAD or visual output is promoted.

The repo already uses the uppercase `CAD/` directory. Issue #1 names
`cad/mcp-session-log.md`; this starter keeps the log in `CAD/` to avoid a
case-only directory split on Windows filesystems. If the repo later migrates
to lowercase `cad/`, move this file in the same layout change.

| timestamp_utc | tool | artifact | claude_session_id | notes |
| --- | --- | --- | --- | --- |
| 2026-05-17T15:54:14Z | Codex CLI repo edit, no design MCP | `CAD/mcp-session-log.md` | n/a | Starter provenance log created. No CAD/Blender/Illustrator/Photoshop MCP-generated artifact exists yet, so no V5 MCP artifact is claimed. |

## Required Future Rows

Add one row per MCP session that produces or modifies a design artifact:

- OpenSCAD MCP or equivalent parametric CAD session for `CAD/didgeridoo.scad`.
- Blender session for any render or STL-derived preview.
- Illustrator session for SVG design plates and DXF export.
- Photoshop or Illustrator session for `print-packet/assembly-plate.pdf`.

Generated images, renders, SVG previews, or print plates remain non-authority
unless their dimensions trace to the promoted CAD, DXF, design table, or
measured station table recorded in `visual-output-register.csv`.
