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
| 2026-07-01T00:00:00Z | claude-code (Fable 5) | `analysis/bore-station-measurement-log.csv`, `analysis/bore-station-station-map.csv`, `analysis/bore-station-authority-register.csv`, `family-spec.csv`, `bom.csv`, `sourcing.csv`, `cut-list.csv`, `validation.csv` | fable-v5-refresh-2026-07-01 | V5 refresh pass, role=packet_refresh, input_authority=didgeridoo-design-table.xlsx, authority_result=fabrication, review_status=self_checked. Tabular packet data reviewed against design-table/family-spec baseline; no dimension changes made. Provenance row added to satisfy V5 fabrication-artifact logging for `analysis/bore-station-measurement-log.csv` (measurement_template, still fully unmeasured — this row records review, not new measurements). |
| 2026-07-01T00:00:00Z | claude-code (Fable 5) + OpenSCAD CLI | `CAD/didgeridoo.scad` | fable-v5-refresh-2026-07-01 | role=cad_authoring, input_authority=family-spec.csv + design.md (didgeridoo-design-table.xlsx-derived), authority_result=pending_measurement, review_status=self_checked. Parametric bore-flare envelope master: cylindrical/conical stations are exact-by-definition from the design-table mouth/bell IDs; bell-family interior stations use one labeled ASSUMPTION flare curve (no interior taper data exists in this repo yet) and fall back to a 2D station-check plate if the assumption curve is disabled. openscad render check: pass (openscad -o STL, exit 0, default bell profile). Does not supersede or modify `CAD/bore-profile/didgeridoo-bore-starter.scad`, which remains the station-capture template for actual measurements. |
| 2026-07-01T00:00:00Z | pre-existing (verified, not generated this pass) | `wolfram/didgeridoo-bore-acoustics.wl` | fable-v5-refresh-2026-07-01 | role=analysis_source, authority_result=derived_preview, review_status=unreviewed. Source-only stopped-pipe acoustics starter; not executed (no wolframscript run this pass, per V5 refresh scope). Verified `visual-output-register.csv` row WL-001 now points at it. |

## Required Future Rows

Add one row per MCP session that produces or modifies a design artifact:

- OpenSCAD MCP or equivalent parametric CAD session for `CAD/didgeridoo.scad`.
- Blender session for any render or STL-derived preview.
- Illustrator session for SVG design plates and DXF export.
- Photoshop or Illustrator session for `print-packet/assembly-plate.pdf`.

Generated images, renders, SVG previews, or print plates remain non-authority
unless their dimensions trace to the promoted CAD, DXF, design table, or
measured station table recorded in `visual-output-register.csv`.
