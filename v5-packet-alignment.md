# V5 Packet Alignment

Status: V5-shaped starter slice, not V5 sign-off.

## Readiness

Readiness label: `L1_packet`.

This packet is reviewable because it has repo-root packet files, an acoustic
family spec, visual authority boundaries, validation gates, Wolfram/acoustic
notes, and a starter MCP provenance log. It is not build-ready because the
selected bore has not been measured, no CAD/DXF artifact has been promoted to
fabrication authority, and no prototype pitch/leak results are logged.

## Issue #1 Closure Target

PR #2 should continue to use `Refs #1`, not `Closes #1`.

Reason: issue #1 requires all V5 deliverables, including parametric CAD,
vector design plates, a render, an annotated print plate, and an MCP log with
design-session provenance. This starter slice materially advances the issue but
does not satisfy the full acceptance gate.

## Current V5 Coverage

| V5 area | current artifact | status | next gate |
| --- | --- | --- | --- |
| V4 packet files | `design.md`, `bom.csv`, `sourcing.csv`, `cut-list.csv`, `validation.csv`, `risks.md`, `drawing-brief.md`, `photo-shotlist.md` | present | review for completeness |
| Acoustic family spec | `family-spec.csv` | present, validator-clean | add measured bore and pitch evidence |
| Visual authority | `visual-output-register.csv` | reference photos only | add CAD/DXF rows only after authority exists |
| CAD authority plan | `CAD/didgeridoo-openscad-authority-plan.md` | plan only | create reviewed `CAD/didgeridoo.scad` or station table |
| MCP provenance | `CAD/mcp-session-log.md` | starter log | add rows from actual design MCP sessions |
| Bore measurement gates | `validation.csv`, `validation-loop.csv` | present | record station ID, pitch, leak, trim, and safety evidence |
| Wolfram/acoustics | `analysis/wolfram-study-notes.md` | scoped calculation notes | add measured-data sensitivity study |

## Authority Boundary

Fabrication authority remains unreleased. The workbook, README, design notes,
photos, and current registers are planning evidence. The first possible
authority artifact should be a measured bore station table, reviewed OpenSCAD
master, reviewed DXF, or reviewed design table.
