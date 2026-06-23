# Yucca → Native-American (NAF) Style Flute Variant

> **Status: NEEDS CLARIFICATION**
>
> This document captures the concept and identifies the open acoustic questions. It is **not a complete build spec** — a tuned NA-style flute requires a bore-physics and finger-hole placement model that does not yet exist in this repo. Do not promise or attempt specific tuning without that calc. When the acoustic model is available, this document becomes the anchor for the full build spec.

---

## 1. Concept

Yucca stalks in the 1.5–2.5 in OD range (typically the upper zone of a tall stalk — see `stock-prep/cut-plan.md`) are promising candidates for a Native-American (NAF) style flute:

- **Length:** Upper zone sections are 18–30 in — within the typical NAF range for pentatonic minor scales in the G3–D4 octave.
- **Bore:** After pith clearance (see `stock-prep/bore-prep.md`), the internal bore diameter is 0.5–1.0 in — consistent with NAF bore dimensions.
- **Material:** Yucca's wall hardness is comparable to cedar or pine (common NAF materials); the natural surface is suitable for minimal finishing.
- **Acoustic pathway:** Standard 2-chamber NAF design — the air column in the lower chamber resonates through finger holes; the upper chamber and block direct airflow across the SAC (slow air chamber) gap.

This is a credible instrument concept. The construction pathway from materials to playable flute is clear in principle. What is missing is the calculation that translates bore diameter and length into finger-hole positions for a target key.

---

## 2. Open Acoustic Questions (Unblocking Conditions)

The following questions must be answered before a tuned build spec can be written. They are listed in dependency order.

### Q1 — Bore diameter and taper
- What is the effective bore diameter of a cleared yucca stalk at the range of upper-zone ODs (1.5–2.5 in OD)?
- Is the bore taper gradual enough to support a predictable resonant frequency, or must it be reamed to a straight bore?
- **Needed:** Measurement data from several cleared yucca upper-zone sections.

### Q2 — SAC geometry and flue dimensions
- What SAC (slow air chamber) length and flue gap dimensions are appropriate for the bore diameter found in Q1?
- The SAC is typically cut into the stalk or formed with a saddle block; yucca's wall thickness constrains the depth of this cut.
- **Needed:** Wall-thickness measurement at the mouthpiece end (where the SAC is cut) to confirm the cut is feasible.

### Q3 — Finger-hole placement for target key
- Given bore diameter, effective length, and SAC geometry, where must the finger holes be positioned to produce a pentatonic minor scale in the target key?
- This requires the NAF acoustic model (tone-hole position as a function of bore diameter, wall thickness, and effective length — the standard NAF calculator formulae).
- **Needed:** NAF bore-physics calculator, preferably implemented in the instrument-maker repository alongside the existing didgeridoo bore model. Route this request to instrument-maker if pursued.

### Q4 — Finger-hole sizing
- What diameter produces correct intonation at each hole position, accounting for yucca's wall thickness?
- Depends on Q3.

---

## 3. What Needs to Exist to Unblock This

| Blocker | Owner / Location |
|---|---|
| NAF bore-physics model (bore OD + length → effective acoustic length + finger-hole positions) | instrument-maker repo — parallel to the existing didgeridoo bore model |
| Measurement data: bore ID of cleared yucca upper-zone sections | this repo — gather during `stock-prep/bore-prep.md` execution |
| Wall-thickness measurement at mouthpiece zone | this repo — record during material grading (`stock-prep/material-spec.md`) |

Once these three inputs exist, a full tuned build spec can be authored as a revision to this document.

---

## 4. Provisional Build Concept (Not for Use Without Q1–Q4 Answered)

The steps below describe the physical construction sequence, contingent on the acoustic calc providing hole positions and diameters. They are captured here for completeness, not as current instructions.

1. **Select stalk section:** Upper zone, 18–30 in, OD 1.5–2.5 in, passes cure-check and material-spec grading.
2. **Clear bore (pith removal):** Follow `stock-prep/bore-prep.md`. Target bore ID per acoustic model output.
3. **Establish SAC and flue:**
   - Mark the SAC zone at ~1/3 of the stalk length from the mouthpiece end.
   - Cut the SAC channel to depth permitted by wall thickness.
   - Shape or carve a saddle block to direct airflow across the flue gap.
4. **Drill finger holes:** At positions from acoustic model output; use appropriate bit diameter per Q4.
5. **Tune and adjust:** Ream or cover holes as needed to correct intonation.
6. **Finish:** Light oil finish (boiled linseed); optionally wrap the mouthpiece zone and SAC block with cordage.

---

## 5. Safety Note

Pith removal and hole drilling in yucca releases calcium-oxalate raphides. Follow `safety/agave-dust.md` throughout construction.

---

## Cross-References

- Stalk zone selection: `stock-prep/cut-plan.md` (upper zone)
- Bore prep (pith clearance): `stock-prep/bore-prep.md`
- Acoustic model needed: instrument-maker repo bore-physics model (NAF variant — not yet built)
- Dust safety: `safety/agave-dust.md`
