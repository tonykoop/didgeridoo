(* Didgeridoo — Stopped-Pipe Bore Acoustics Starter
   tonykoop/didgeridoo
   Authority: first-order stopped-pipe estimates; L1 packet.
   Bore profile, end-correction, player coupling not yet measured.
   Manipulate block is CloudDeploy-ready (Public-Execute). *)

(* ── Stopped-Pipe Acoustic Model ──
   f_n = (2n-1) × c / (4 × L_eff)
   L_eff = L_geom + end_correction
   End correction for open flared bell: Δ = 0.6 × r_bell
   (first-order Rayleigh; actual value is bore-shape-dependent) *)

StoppedPipeFreq[Leff_Real, n_Integer : 1, c_Real : 343.0] :=
  (2*n - 1) * c / (4 * Leff)

BellEndCorrection[rBell_Real] := 0.6 * rBell

(* Convert inches to meters *)
InToM[x_] := x * 0.0254

(* ── Family spec rows from didgeridoo-design-table.xlsx ──
   Three candidate bore families at A1, C2, D2 *)
DidgeFamilyRows = {
  <|"key" -> "A1", "fHz" -> 55.00, "roughLenIn" -> 67.50,
    "mouthIDin" -> 1.50, "bellIDin" -> 3.50|>,
  <|"key" -> "C2", "fHz" -> 65.41, "roughLenIn" -> 57.00,
    "mouthIDin" -> 1.25, "bellIDin" -> 3.00|>,
  <|"key" -> "D2", "fHz" -> 73.42, "roughLenIn" -> 50.50,
    "mouthIDin" -> 1.25, "bellIDin" -> 2.75|>
}

(* Reference table *)
Print["Family spec — stopped-pipe first-order length estimates:"]
TableForm[
  Table[
    Module[{row = DidgeFamilyRows[[i]],
            c = 343.0},
      {
        row["key"],
        NumberForm[row["fHz"], {5, 2}],
        NumberForm[row["roughLenIn"], {4, 2}],
        NumberForm[
          c / (4 * row["fHz"]) / 0.0254, {5, 2}],
        NumberForm[
          row["roughLenIn"] - c / (4 * row["fHz"]) / 0.0254, {4, 2}]
      }
    ],
    {i, 1, 3}
  ],
  TableHeadings -> {None,
    {"Key", "Target Hz", "Rough blank (in)", "λ/4 (in)", "Trim allowance (in)"}
  }
]

(* ── Interactive Manipulate ── *)

Manipulate[
  Module[
    {
      r_mouth  = InToM[mouthID_in / 2],
      r_bell   = InToM[bellID_in / 2],
      L_m      = InToM[length_in],
      DeltaBell = BellEndCorrection[InToM[bellID_in / 2]],
      L_eff    = InToM[length_in] + BellEndCorrection[InToM[bellID_in / 2]],
      f1 = StoppedPipeFreq[InToM[length_in] + BellEndCorrection[InToM[bellID_in / 2]], 1],
      f2 = StoppedPipeFreq[InToM[length_in] + BellEndCorrection[InToM[bellID_in / 2]], 2],
      f3 = StoppedPipeFreq[InToM[length_in] + BellEndCorrection[InToM[bellID_in / 2]], 3]
    },
    Grid[{
      {"Body length (in)", NumberForm[length_in, {5, 2}]},
      {"Body length (m)", NumberForm[InToM[length_in], {5, 4}]},
      {"Mouth ID (in)", mouthID_in},
      {"Bell ID (in)", bellID_in},
      {"Bell end correction (mm)", NumberForm[1000 * DeltaBell, {4, 1}]},
      {"L_eff (m)", NumberForm[InToM[length_in] + DeltaBell, {5, 4}]},
      {"Drone f1 (Hz)", NumberForm[f1, {5, 2}]},
      {"Overblow f2 (Hz)", NumberForm[f2, {5, 2}]},
      {"Overblow f3 (Hz)", NumberForm[f3, {5, 2}]},
      {"Note", "L1 estimates. Lip coupling, bore profile, leaks not modeled."}
    },
    Frame -> All,
    Background -> {{GrayLevel[0.88], White}, None}]
  ],

  (* Controls *)
  {{length_in, 67.5, "Body length (in)"}, 40.0, 80.0, 0.25,
    Appearance -> "Labeled"},
  {{mouthID_in, 1.5, "Mouth ID (in)"}, 0.75, 2.5, 0.25,
    Appearance -> "Labeled"},
  {{bellID_in, 3.5, "Bell ID (in)"}, 1.5, 6.0, 0.25,
    Appearance -> "Labeled"},

  ControlPlacement -> Left,
  TrackedSymbols :> {length_in, mouthID_in, bellID_in}
]
