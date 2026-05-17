# Drawing Brief

Current status: bare-bones readiness packet. Fabrication authority is not
released from these notes.

## Required Future Drawings

| drawing_id | artifact | purpose | authority_target | prerequisite_evidence |
| --- | --- | --- | --- | --- |
| DRW-001 | `drawings/didgeridoo-bore-profile.svg` | readable bore station preview | derived_preview | measured station CSV or reviewed design table |
| DRW-002 | `drawings/didgeridoo-bore-profile.dxf` | shop/CNC bore authority | fabrication | reviewed bore CAD with traceable dimensions |
| DRW-003 | `cad/didgeridoo.scad` | parametric master geometry | fabrication | selected candidate, station table, end-correction decision |
| DRW-004 | `print-packet/assembly-plate.pdf` | annotated build plate | derived_preview | DRW-002 or DRW-003 promoted to authority |

## Authority Boundary

The current workbook, `family-spec.csv`, and
`CAD/bore-profile/bore-profile-register.csv` describe planning values and
review gates. They do not authorize cutting a final didgeridoo body.

The first authority candidate should be a measured bore station table or
reviewed parametric CAD model. Any SVG, PDF, render, or hero image produced
before that point is a preview or reference image only.

## Drawing Checks

- Every critical dimension must trace back to `family-spec.csv`,
  `cut-list.csv`, or a measured station table.
- Any DXF/CAD artifact promoted to fabrication authority must be added to
  `visual-output-register.csv`.
- Rendered or generated images must stay `concept_only` or `reference_only`
  and must not supply dimensions, toolpaths, or bore stations.
