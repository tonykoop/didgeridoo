# Design Intent — didgeridoo rev A

- Master CAD (envelope): `CAD/didgeridoo.scad` (sha256: 86219732ab9d2847231d72b28dec062c1e952f19ee1c46049314f83971c8c2bf), driven by `family-spec.csv` and `design.md`, both derived from `didgeridoo-design-table.xlsx` (sha256: 80c21687474361947217b07fb3bb809dc6939b7a2a04ae6574fa2205e11c3639).
- Station-capture template (unchanged): `CAD/bore-profile/didgeridoo-bore-starter.scad` (sha256: 347c79901ed3589102918873d560f1468f90f00a92d4371e5c93419c03eac0cb) — renders a station-check plate until `analysis/bore-station-measurement-log.csv` is populated and reviewed.
- Function: Lip-blown stopped-pipe drone instrument (didgeridoo). Player's lips acoustically close the mouthpiece end; the bell/foot end is open. Fundamental set by `f ≈ c / (4 × L_eff)`. The recommended first V5 candidate is an A1 (55.00 Hz) bell-flared bore: 1.50 in mouthpiece ID, 3.50 in bell/foot ID, 67.50 in starter blank length (61.38 in theoretical quarter-wave + 6.00 in trim allowance). Two comparison candidates (C2 conical, D2 cylindrical) are carried in `family-spec.csv` for formula validation before the bell candidate is committed to.
- Environment: breath-contact instrument (bore finish, glue, and wax touch the player's mouth/lungs — safety gate, see Must-nots). Long slender hardwood/PVC/agave bore is handled and transported end-to-end; no sustained structural load beyond its own weight and player grip.
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Mouthpiece bore ID | 1.50 in | measurement-required after boring/finishing | drone pitch, playability, lip seal | family-spec.csv `DID-V5-A1-BELL-P0` (design table rows 10-40) |
| Bell/foot ID | 3.50 in | measurement-required; open-end correction still an assumption | drone pitch (end correction), tone color | family-spec.csv `DID-V5-A1-BELL-P0` |
| Starter blank length | 67.50 in | cut long, trim from foot per workbook convention | drone pitch (L_eff) | family-spec.csv `DID-V5-A1-BELL-P0`; theoretical quarter-wave 61.38 in + 6.00 in trim allowance |
| Wall thickness | 0.50 in | not yet confirmed as-built | wall strength, weight, exterior/interior offset in envelope model | design.md Source Basis (workbook input); `CAD/didgeridoo-openscad-authority-plan.md` still flags as measurement-required |
| Interior bore taper (12 stations, BS-000…BS-100) | TBD (all `unmeasured`) | full measurement + review pass required before any fabrication claim | overall tone/response; distinguishes cylindrical vs. conical vs. bell in practice | analysis/bore-station-measurement-log.csv (empty template), analysis/bore-station-station-map.csv (station grid) |
| Bell interior flare shape | assumption only (`bell_flare_exponent_assumption = 2.2` in CAD/didgeridoo.scad) | replace with measured stations before any authority claim | tone/response prediction for the bell candidate | no formula exists in this repo; CAD-authored assumption, clearly labeled non-authority |
| Open-end correction (bell) | 0.6 × bell radius ≈ 1.05 in | validation-loop measurement of real drone vs. trim response | trim length decision | design.md "Bell And End Condition" (workbook K1 row convention) |

## Incidental (free for DFM)

- Exterior finish/decoration, stave count and species selection (oak, maple, cherry, padauk, etc.), non-mating cosmetic surface treatment, mouthpiece wax-ring styling once the 1.50 in opening and lip-contact geometry are set.

## Must-nots (DFM may never violate)

- Do not claim fabrication authority for any bore diameter until `analysis/bore-station-measurement-log.csv` is populated and reviewed (risks.md "Fabrication Risks"; `analysis/bore-station-authority-register.csv` AUTH-B5-004/005).
- Do not treat bore finishes, adhesives, sanding dust, or wax additives as breath-safe until product choice, cure, odor, tack, and dust checks are recorded (risks.md "Safety Risks").
- Do not machine hardwood before a PVC or scrap validation pass confirms the A1 length and mouthpiece assumptions (design.md "Materials And Process"; risks.md "Fabrication Risks").
- Do not infer toolpaths or DXF geometry from prose, photos, or the current CAD/DXF authority plans — only from a reviewed station table or reviewed CAD (drawings/didgeridoo-bore-dxf-authority-plan.md).
- Never overstate readiness (risks.md "Scope Risks": updating README status before CAD/DXF, visual register, validation rows, and MCP provenance exist would overstate readiness) — this repo stays L1 concept packet this pass.

## Material intent

- Preferred first validation path: PVC or inexpensive split-blank mockup (design.md "Materials And Process").
- Candidate build materials: PVC prototype tube, dried agave stalk, hardwood split blank (oak/maple/cherry/jatoba/padauk per README), slow-cure epoxy, beeswax mouthpiece ring, bore sealant (shellac or reviewed breath-contact finish), exterior finish — see `bom.csv` for full list (all rows `unverified_until_purchase`).
- Forbidden: none recorded yet; bore-contact finish/adhesive choices remain gated on the safety checks in `risks.md`.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable.
