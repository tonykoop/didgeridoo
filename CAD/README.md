# CAD Notes

`didgeridoo.scad` is the current parametric bore-flare **envelope** master.
Authority: `pending_measurement` — see `visual-output-register.csv` CAD-001
and `mcp-session-log.md`. It does not replace or supersede
`bore-profile/didgeridoo-bore-starter.scad`, which stays the station-capture
template for recording real measurements.

## Why an envelope, not a bore profile

Didgeridoos have a flaring bore (narrow mouthpiece end, wide bell/foot end)
rather than a tone-hole schedule. `family-spec.csv` gives real design-table
mouth ID, bell/foot ID, and blank length for three candidate bore families
(`bell`, `conical`, `cylindrical`), but `analysis/bore-station-measurement-log.csv`
is currently **fully unmeasured** — every one of the 12 stations in
`analysis/bore-station-station-map.csv` is `unmeasured`. There is no interior
taper schedule in this repo to loft from, and `design.md` only describes the
bell family's interior shape in prose ("gradual expansion from mouth opening
toward bell") with no formula.

`didgeridoo.scad` handles the three families honestly and differently:

- **cylindrical** — mouth ID equals foot/bell ID by definition. Every
  interior station is set to the design-table mouth ID exactly. No
  assumption.
- **conical** — a straight-sided cone by definition. Every interior station
  is the exact linear interpolation between the design-table mouth ID and
  foot/bell ID. No assumption (this is what "conical" means).
- **bell** — no interior-taper formula exists anywhere in this repo. The
  master exposes `bell_show_assumption_curve` (default `true`, so the file
  always renders something for shop review): when true it fills interior
  stations with one clearly-labeled `bell_flare_exponent_assumption` curve
  (an assumption, not authority); when false the interior stations fall back
  to the `-1` TBD sentinel (same convention as
  `bore-profile/didgeridoo-bore-starter.scad`) and the module renders a flat
  station-check plate instead of a solid.

## Parameters

`profile` selects one of the three `family-spec.csv` rows
(`DID-V5-A1-BELL-P0` / `DID-V5-C2-CONICAL-P0` / `DID-V5-D2-CYL-P0`).
`wall_thickness_in` (0.50 in) comes from `design.md`'s Source Basis workbook
input; `CAD/didgeridoo-openscad-authority-plan.md` still flags wall thickness
as measurement-required for the as-built prototype, so treat it as a planning
assumption, not a confirmed as-built value. `fabrication_mode` /
`measurement_reviewed` gate fabrication the same way
`bore-profile/didgeridoo-bore-starter.scad` does — flipping `fabrication_mode`
alone can never make this master fabrication authority; `measurement_reviewed`
only becomes true after a real, reviewed pass over
`analysis/bore-station-measurement-log.csv`.

Render check: `openscad -o /tmp/didgeridoo-check.stl CAD/didgeridoo.scad`
exits 0 for the default `profile = "bell"` (assumption curve on).
