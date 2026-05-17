# Didgeridoo V5 Starter Design

Current status: bare-bones readiness packet.

Fabrication authority: not build-ready. The existing workbook and this packet
define a measured-build starting point, not final CAD/CAM geometry. CAD/DXF
status is future authority until a measured bore profile or reviewed drawing is
added.

## Intent

V5 is a starter lift for a stave-built or split-blank didgeridoo packet. The
first useful build target is a practical A1 drone with a bell-flared bore:

- Target drone: A1, 55.00 Hz.
- Governing model: stopped pipe, `f = c / (4 * L_eff)`.
- Starter blank length: 67.50 in, using the workbook convention of theoretical
  quarter-wave length plus 6 in trim allowance, rounded up to 0.25 in.
- Mouthpiece opening: 1.50 in ID.
- Candidate bell opening: 3.50 in ID.
- Expected ideal resonances before measured correction: 165.00 Hz and
  275.00 Hz.

The A1 bell candidate is long enough to feel like a full didgeridoo and short
enough for first-round shop handling. C2 and D2 candidates are kept in
`family-spec.csv` as comparison rows, but V5 should validate one candidate
before multiplying variants.

## Source Basis

The starting values come from `didgeridoo-design-table.xlsx` and its
`Didgeridoo` worksheet:

- Speed of sound input: 343 m/s at 20 C.
- Wall thickness input: 0.50 in.
- Mouthpiece opening input: 1.50 in.
- Three bore families: cylindrical, conical, and bell.
- Build convention: cut long, then trim from the foot end to raise pitch.

The workbook formulas are treated as design evidence and planning data. They
are not enough by themselves to release a V5 build-ready packet, because the
actual mouthpiece compliance, bell end correction, bore roughness, leak path,
and player coupling have not been measured.

## Bore Profile

Recommended V5 starter profile: bell-flared A1.

Candidate profile definition:

- Mouth end: 1.50 in ID.
- Main body: gradual expansion from mouth opening toward bell.
- Bell end: 3.50 in ID.
- Length reference: 61.38 in first-order quarter-wave length at 20 C, plus
  6.00 in trim allowance in the rough blank.
- End condition: lips seal the mouthpiece end; foot/bell end is open.

Do not cut the internal bore from these notes alone. First create a station
table or CAD spline with measured datum points, then review the drawing against
the bore-profile register in `CAD/bore-profile/bore-profile-register.csv`.

## Mouthpiece

Starter mouthpiece assumption:

- 1.50 in opening at the wood body or wax ring.
- Beeswax or removable test ring for early playability.
- Final lip contact geometry is measurement-required.

Open measurements:

- Comfortable lip aperture for the intended player.
- Wax ring thickness and inner-edge radius.
- Whether the mouthpiece volume shifts the effective closed-end behavior.
- Leak check at wax/body interface after warm-up.

## Bell And End Condition

The didgeridoo is modeled as a stopped pipe: the player's lips close the mouth
end acoustically and the bell/foot is open. The bell opening is a strong
correction term, so the bell row stays preliminary until measured.

The workbook's K1 row uses an open-end correction of `0.6 * radius`. For the
3.50 in A1 bell that is 1.05 in. This packet records that as an assumption, not
as a final trim instruction. The validation loop must measure the real drone
and trim response before deciding whether to shorten the body by that amount.

## Materials And Process

Supported V5 process paths:

- PVC prototype: fastest acoustic validation of length, leak behavior, and
  mouthpiece feel.
- Agave stalk: natural-bore path when a suitable dried stalk exists.
- Split hardwood blank: CNC/lathe path for controlled bore geometry.
- Stave-built hardwood: longer-term path after the bore station table and
  stave derivation are ready.

Preferred first validation path: PVC or inexpensive split-blank mockup. Do not
spend hardwood-CNC effort before the A1 length and mouthpiece assumptions have
passed a basic pitch/leak/response test.

## Unknowns Requiring Measurement

- Actual bore ID along the full length after boring, routing, sanding, and
  finishing.
- Fundamental pitch after mouthpiece is installed and warmed by playing.
- First toot / second resonance behavior relative to the ideal 3f prediction.
- Air leak behavior at glue seams, mouthpiece, and any natural cracks.
- Finish safety inside the bore after cure, including odor, tack, dust, and
  player contact risk.
- Whether bell flare moves the response closer to the desired tone or only
  makes tuning less predictable.
- Whether the final process is cylindrical, conical, bell-flared, or a hybrid
  found-bore profile.

## Promotion Gate

This packet can become a V5 build packet only after:

- `validation-loop.csv` has measured bore and pitch rows for the chosen
  candidate.
- A CAD/DXF/design-table artifact is named as fabrication authority.
- The starter BOM has in-hand or verified purchase-time sources.
- Finish and glue choices are confirmed safe for a breath-contact instrument.
- The final design language stops saying starter/planning-only because the
  evidence supports a stronger claim.
