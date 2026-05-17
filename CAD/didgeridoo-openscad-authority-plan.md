# Didgeridoo OpenSCAD And DXF Authority Plan

Status: CAD authority plan only. No build-ready geometry is released here.

## Readiness Label

Current packet readiness: `L1_packet`.

Reason: the repo now has a reviewable starter packet, family specification,
validation gates, and provenance placeholders, but it does not yet have
measured bore stations, reviewed CAD/DXF, or physical tuning evidence.

## Folder Convention

The repository already uses `CAD/` for engineering assets. Issue #1 names a
lowercase `cad/<instrument>.scad`, but creating both `CAD/` and `cad/` would be
fragile on Windows checkouts. This plan uses `CAD/didgeridoo.scad` and
`CAD/bore-profile/` unless a later layout-only change migrates the repo.

## Future OpenSCAD Master

Target file: `CAD/didgeridoo.scad`.

The first OpenSCAD master must expose every critical value as a named
parameter. No dimension should appear as an unexplained literal in geometry.

| parameter | starter value | source | authority status |
| --- | ---: | --- | --- |
| `target_frequency_hz` | 55.00 | `family-spec.csv` row `DID-V5-A1-BELL-P0` | planning only |
| `mouth_bore_id_in` | 1.50 | `family-spec.csv` | measurement-required |
| `foot_bell_id_in` | 3.50 | `family-spec.csv` | measurement-required |
| `quarter_wave_length_in` | 61.38 | `family-spec.csv`, checked in `analysis/wolfram-study-notes.md` | planning only |
| `starter_blank_length_in` | 67.50 | `family-spec.csv`, workbook trim convention | planning only |
| `station_spacing_in` | TBD | future bore station table | measurement-required |
| `wall_thickness_in` | TBD | physical stock, design table, or reviewed drawing | measurement-required |

## Required CAD Inputs Before Fabrication Authority

1. Record a bore station table at 3-6 in spacing for the selected prototype or
   reviewed design.
2. Record actual mouthpiece opening and wax/body interface dimensions.
3. Record foot/bell ID and the open-end correction assumption used for the
   selected bore profile.
4. Decide whether the first authority file is a measured station CSV,
   `CAD/didgeridoo.scad`, `CAD/bore-profile/v5-a1-bell.dxf`, or a design
   table.
5. Add the promoted authority artifact to `visual-output-register.csv` with
   `authority=fabrication` only after review.

## DXF Export Gate

Target file: `CAD/bore-profile/v5-a1-bell.dxf`.

The DXF must be derived from reviewed station data or the OpenSCAD master. It
must not be traced from concept images, shop photos, or prose. Until the DXF
exists and is reviewed, `CAD/bore-profile/bore-profile-register.csv` remains a
planning register rather than fabrication geometry.

## Wolfram/Acoustic Link

The current Wolfram note checks first-order stopped-pipe lengths only. The next
notebook or `.wl` script should add:

- end-correction sensitivity for the selected bell ID;
- trim increment versus cents change near A1;
- measured cold and warmed pitch comparison;
- toot/response comparison against ideal odd harmonics.

No Wolfram plot or notebook output should become fabrication authority unless
the governing dimensions also appear in the promoted CAD, DXF, design table, or
measured station table.
