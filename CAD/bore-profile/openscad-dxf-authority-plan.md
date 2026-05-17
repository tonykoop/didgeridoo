# OpenSCAD And DXF Authority Plan

Status: starter authority plan, not measured geometry.

## Source Chain

1. `analysis/bore-station-station-map.csv` defines normalized capture stations.
2. `analysis/bore-station-measurement-log.csv` records measured diameters,
   ovality, wall thickness, tool, conditions, and photo evidence.
3. A reviewed export from the populated log becomes the only source allowed to
   populate `measured_inner_diameter_in` in
   `CAD/bore-profile/didgeridoo-bore-starter.scad`.
4. A DXF export is allowed only after every required station has positive,
   reviewed dimensions and the exported file is recorded in
   `visual-output-register.csv`.

## OpenSCAD Starter Behavior

The current SCAD file renders a station-check plate. It intentionally uses
`-1` sentinel values for all bore diameters. If `fabrication_mode` is set to
`true` before measured values are supplied, the file asserts and refuses the
fabrication path.

## DXF Gate

The first fabrication DXF should be named
`drawings/didgeridoo-bore-profile.dxf` and must include:

- a mouthpiece datum,
- a foot datum,
- station IDs matching the measurement log,
- bore envelope geometry derived from reviewed station diameters,
- notes naming the measurement log or reviewed design-table export,
- units in inches or a documented unit conversion.

No DXF is created in this lane because the measurement authority is not present
yet.
