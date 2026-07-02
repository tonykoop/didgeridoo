// Didgeridoo bore-flare envelope master.
// tonykoop/didgeridoo — CAD/didgeridoo.scad
//
// AUTHORITY: pending_measurement. NOT fabrication authority. This file
// renders a candidate bore-flare ENVELOPE for shop review only; it does not
// control cut geometry until every interior station is measured and
// reviewed (see analysis/bore-station-measurement-log.csv,
// analysis/bore-station-authority-register.csv AUTH-B5-004/005).
//
// Source of truth for every numeric parameter below:
//   - family-spec.csv rows DID-V5-A1-BELL-P0 / DID-V5-C2-CONICAL-P0 /
//     DID-V5-D2-CYL-P0 (mouthpiece_bore_id_in, foot_bell_id_in,
//     starter_blank_length_in, theoretical_quarter_wave_length_in,
//     target_hz), themselves derived from didgeridoo-design-table.xlsx
//     "Didgeridoo" worksheet rows 10-40 (see design.md "Source Basis").
//   - wall_thickness_in: design.md "Source Basis" — "Wall thickness input:
//     0.50 in" (workbook input). CAD/didgeridoo-openscad-authority-plan.md
//     still flags wall thickness as measurement-required for the as-built
//     prototype, so this stays a planning assumption, not a confirmed
//     as-built value.
//   - station grid (0/5/10/20/.../100 %): analysis/bore-station-station-map.csv.
//   - interior station diameters: analysis/bore-station-measurement-log.csv
//     — currently EVERY row is "unmeasured". This master therefore has no
//     real interior-profile data to draw from for any family.
//
// Governing shape, by family-spec.csv `profile` column:
//   - cylindrical: mouth ID == foot/bell ID BY DEFINITION -> every interior
//     station equals the design-table mouth ID exactly. No shape assumption.
//   - conical: straight-sided cone BY DEFINITION -> every interior station
//     is the exact linear interpolation between the design-table mouth ID
//     and foot/bell ID. No shape assumption (this is what "conical" means).
//   - bell: NO interior-taper formula exists anywhere in this repo.
//     design.md only says "gradual expansion from mouth opening toward
//     bell." Only the two endpoints (mouth ID, bell ID) and the overall
//     blank length are design-table values. When bell_show_assumption_curve
//     is true (default, so this file always renders something for the shop
//     to look at) the interior stations are filled by
//     bell_flare_exponent_assumption below — an ASSUMPTION, clearly labeled,
//     not measured or reviewed. When false, interior bell stations fall back
//     to the TBD sentinel and the module renders a flat station-check plate
//     instead of a solid, exactly like CAD/bore-profile/didgeridoo-bore-starter.scad.
//
// fabrication_mode stays false. measurement_reviewed stays false until a
// real measurement pass against analysis/bore-station-measurement-log.csv is
// recorded and reviewed — flipping fabrication_mode alone can never make
// this master fabrication authority.

inch = 25.4;

// ---- top-level switches -----------------------------------------------
profile = "bell"; // "bell" | "conical" | "cylindrical" — family-spec.csv row to render
fabrication_mode = false; // never true without a reviewed measurement pass
measurement_reviewed = false; // set true only after a reviewed pass over
                               // analysis/bore-station-measurement-log.csv
bell_show_assumption_curve = true; // true: draw ONE labeled candidate bell
                                    // flare curve (assumption, not authority)

// ---- design-table-derived family rows (family-spec.csv) ----------------
// [key, mouth_bore_id_in, foot_bell_id_in, starter_blank_length_in,
//  quarter_wave_length_in, target_hz, family_spec_row_id]
family = [
  ["bell",        1.50, 3.50, 67.50, 61.38, 55.00, "DID-V5-A1-BELL-P0"],
  ["conical",     1.50, 3.00, 57.75, 51.62, 65.41, "DID-V5-C2-CONICAL-P0"],
  ["cylindrical", 1.50, 1.50, 52.00, 45.98, 73.42, "DID-V5-D2-CYL-P0"],
];

wall_thickness_in = 0.50; // design.md Source Basis; unreviewed as-built value

// ---- bore-station grid (analysis/bore-station-station-map.csv) ---------
station_pct = [0, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
station_labels = [
  "BS-000", "BS-005", "BS-010", "BS-020", "BS-030", "BS-040",
  "BS-050", "BS-060", "BS-070", "BS-080", "BS-090", "BS-100",
];

// ASSUMPTION — not from design table, not from any measurement. No
// interior-taper formula exists for the bell family anywhere in this repo.
// This exponent just picks one illustrative, monotonic, mouth-slow /
// bell-fast flare shape for shop-review visualization. Replace with real
// analysis/bore-station-measurement-log.csv values once measured + reviewed.
bell_flare_exponent_assumption = 2.2;

function family_row(key) =
  family[0][0] == key ? family[0] :
  family[1][0] == key ? family[1] :
  family[2][0] == key ? family[2] :
  family[0]; // fall back to "bell" rather than crash on a typo

row = family_row(profile);
mouth_id_in = row[1];
bell_id_in = row[2];
length_in = row[3];
quarter_wave_in = row[4];
target_hz = row[5];
row_id = row[6];

// diameter_at(t_pct): honest interior-diameter model per family, in inches.
// Returns -1 (TBD sentinel, same convention as didgeridoo-bore-starter.scad)
// wherever no real value exists.
function diameter_at(t_pct) =
  profile == "cylindrical" ? mouth_id_in :
  profile == "conical" ? mouth_id_in + (bell_id_in - mouth_id_in) * (t_pct / 100) :
  // profile == "bell"
  (bell_show_assumption_curve
    ? mouth_id_in + (bell_id_in - mouth_id_in) * pow(t_pct / 100, bell_flare_exponent_assumption)
    : (t_pct == 0 || t_pct == 100 ? (t_pct == 0 ? mouth_id_in : bell_id_in) : -1));

interior_diameter_in = [for (t = station_pct) diameter_at(t)];

function has_all_stations(v) = min(v) >= 0;

if (fabrication_mode) {
  assert(
    measurement_reviewed,
    "NO FABRICATION: pending_measurement. Populate and review analysis/bore-station-measurement-log.csv for the selected profile first."
  );
}

echo(str(
  "didgeridoo envelope — profile=", profile, " (", row_id, "), target=",
  target_hz, " Hz, blank length=", length_in, " in, quarter-wave=",
  quarter_wave_in, " in, mouth ID=", mouth_id_in, " in, bell/foot ID=",
  bell_id_in, " in — pending_measurement, NOT fabrication authority"
));

// ---- geometry ------------------------------------------------------------

module station_tick(x_mm, label_index) {
  translate([x_mm, 0, 0]) square([1.0, 18], center = true);
  translate([x_mm - 6, -18, 0]) rotate([0, 0, 90])
    text(station_labels[label_index], size = 4, halign = "right", valign = "center");
}

// Fallback used whenever a station's diameter is unresolved (TBD == -1).
// Same intent as CAD/bore-profile/didgeridoo-bore-starter.scad: a capture
// template, not a bore body.
module station_check_plate_2d() {
  length_mm = length_in * inch;
  translate([length_mm / 2, 0, 0]) square([length_mm, 0.5], center = true);
  for (i = [0 : len(station_pct) - 1]) {
    station_tick(station_pct[i] / 100 * length_mm, i);
  }
  translate([0, 18, 0])
    text(str("Didgeridoo envelope (", profile, "): interior stations unresolved"), size = 5);
  translate([0, 26, 0])
    text("Enable bell_show_assumption_curve, or measure+review a station table", size = 4);
}

// Lofts a stack of circular stations into a solid via consecutive hull()
// pairs — the standard OpenSCAD idiom for a horn/bore-shaped loft along Z.
module lofted_envelope(radii_mm, z_mm) {
  n = len(radii_mm);
  for (i = [0 : n - 2]) {
    hull() {
      translate([0, 0, z_mm[i]]) cylinder(h = 0.01, r = max(radii_mm[i], 0.01), $fn = 64);
      translate([0, 0, z_mm[i + 1]]) cylinder(h = 0.01, r = max(radii_mm[i + 1], 0.01), $fn = 64);
    }
  }
}

module bore_envelope_solid() {
  length_mm = length_in * inch;
  z_mm = [for (t = station_pct) t / 100 * length_mm];
  inner_r_mm = [for (d = interior_diameter_in) d / 2 * inch];
  outer_r_mm = [for (r = inner_r_mm) r + wall_thickness_in * inch];

  // Extend the inner (cavity) loft slightly past both ends so the bore
  // reads as open, not capped, at the mouthpiece and bell/foot faces.
  overcut_mm = 2 * inch;
  inner_z_ext = concat([z_mm[0] - overcut_mm], z_mm, [z_mm[len(z_mm) - 1] + overcut_mm]);
  inner_r_ext = concat([inner_r_mm[0]], inner_r_mm, [inner_r_mm[len(inner_r_mm) - 1]]);

  difference() {
    lofted_envelope(outer_r_mm, z_mm);
    lofted_envelope(inner_r_ext, inner_z_ext);
  }
}

if (has_all_stations(interior_diameter_in)) {
  bore_envelope_solid();
} else {
  station_check_plate_2d();
}
