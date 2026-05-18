# Didgeridoo Bore DXF Authority Plan

Status: DXF plan only. No cut-ready DXF is present.

## Required Layers

| Layer | Purpose | Authority Source |
| --- | --- | --- |
| `DATUM` | mouthpiece plane, foot plane, station centerlines | reviewed bore station log |
| `FAB_GEOMETRY` | bore envelope or split-blank route line | reviewed station diameters |
| `DIMENSION` | station labels and diameter callouts | reviewed station diameters |
| `NOTES` | source artifact IDs, units, review status | authority register |

## Required Review Before Export

- Confirm the selected blank or design-table row.
- Confirm actual body length and station axial positions.
- Confirm major/minor ID measurements and repeat count at every required
  station.
- Decide whether the first DXF is a centerline/bore envelope, a split-blank
  CNC pocket path, or a printed inspection plate.
- Add the exported DXF to `visual-output-register.csv` with
  `artifact_kind=dxf`, `authority=fabrication`, and a `derived_from` pointer to
  the reviewed measurement source.
