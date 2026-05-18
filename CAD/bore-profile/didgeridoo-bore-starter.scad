// Didgeridoo bore profile starter.
// Status: non-fabrication B5 starter. No measured bore geometry is present.
// Fill measured_inner_diameter_in from analysis/bore-station-measurement-log.csv
// only after a reviewed measurement pass.

fabrication_mode = false;
inch = 25.4;

preview_length_in = 72;
station_t = [0, 0.05, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00];
station_labels = [
  "BS-000", "BS-005", "BS-010", "BS-020", "BS-030", "BS-040",
  "BS-050", "BS-060", "BS-070", "BS-080", "BS-090", "BS-100"
];

// Sentinel -1 means unmeasured. Positive values may only come from the reviewed
// bore station log or a reviewed design-table export.
measured_inner_diameter_in = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];

function has_all_measurements(v) = min(v) > 0;

if (fabrication_mode) {
  assert(
    has_all_measurements(measured_inner_diameter_in),
    "NO FABRICATION: populate measured_inner_diameter_in from reviewed bore-station data first."
  );
}

module station_tick(x_mm, label_index) {
  translate([x_mm, 0, 0]) square([1.0, 18], center = true);
  translate([x_mm - 6, -18, 0]) rotate([0, 0, 90])
    text(station_labels[label_index], size = 4, halign = "right", valign = "center");
}

module station_check_plate() {
  length_mm = preview_length_in * inch;
  translate([length_mm / 2, 0, 0]) square([length_mm, 0.5], center = true);
  for (i = [0 : len(station_t) - 1]) {
    station_tick(station_t[i] * length_mm, i);
  }
  translate([0, 18, 0])
    text("Didgeridoo bore stations: capture template only", size = 5);
  translate([0, 26, 0])
    text("No measured bore geometry or fabrication DXF in this starter", size = 4);
}

module measured_bore_envelope_2d() {
  length_mm = preview_length_in * inch;
  upper = [
    for (i = [0 : len(station_t) - 1])
      [station_t[i] * length_mm, measured_inner_diameter_in[i] * inch / 2]
  ];
  lower = [
    for (i = [len(station_t) - 1 : -1 : 0])
      [station_t[i] * length_mm, -measured_inner_diameter_in[i] * inch / 2]
  ];
  polygon(points = concat(upper, lower));
}

if (has_all_measurements(measured_inner_diameter_in)) {
  measured_bore_envelope_2d();
} else {
  station_check_plate();
}
