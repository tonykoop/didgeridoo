# Bore Station Measurement Plan

Status: B5 planning packet. This file defines how to capture bore geometry; it
does not assert measured bore dimensions.

## Authority Boundary

The current repo contains a 2013 notebook photo, a workbook-derived CNC design
table, legacy SolidWorks files, and shop photos. Those are useful evidence, but
the clean repo does not yet contain a reviewed station-by-station bore profile.
Until `analysis/bore-station-measurement-log.csv` is populated from a physical
blank or a reviewed design table, OpenSCAD and DXF outputs are starter
templates only.

## Station Datum

- `BS-000` is the mouthpiece seal plane after any beeswax or mouthpiece insert
  datum is defined.
- `BS-100` is the open foot end after the blank is cut long but before final
  pitch-trimming.
- Intermediate stations are normalized percentages of effective body length.
  The actual axial positions must be calculated from a measured blank length,
  not guessed from photos.

## Measurement Method

1. Choose one physical blank or one reviewed design-table row and assign a
   stable `blank_id`.
2. Measure the body length from the mouthpiece datum to the foot datum.
3. Convert each normalized station in
   `analysis/bore-station-station-map.csv` to an axial position in inches.
4. At each station, record major and minor inner diameters, wall thickness if
   reachable, tool type, repeat count, temperature, humidity, and photo ID.
5. Mark `authority_status` as `measured_pending_review` until a human review
   signs off the row and any derived OpenSCAD/DXF output.

## CAD Handoff

`CAD/bore-profile/didgeridoo-bore-starter.scad` is a non-fabrication starter.
It can render a station-check plate and can be turned into a bore envelope only
after all station diameters are filled with positive measured values. Any DXF
export must be registered in `visual-output-register.csv` and must trace back
to the populated measurement log or a reviewed design table.
