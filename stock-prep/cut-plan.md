# Multi-Cut Yield Planner — Base / Mid / Upper

Plan 2–3 instruments from a single tall agave or yucca stalk by dividing it into cut zones before making any saw cuts. Maximises yield and assigns each zone to the instrument it is best suited for acoustically and structurally.

---

## 1. Stalk-Height Classes

| Class | Dried stalk length | Typical yield |
|---|---|---|
| **Tall** | ≥ 96 in (8 ft) | 2–3 instruments + trim offcuts |
| **Short** | 48–95 in (4–7 ft 11 in) | 1 instrument + possible rainstick/flute offcut |
| **Stub** | < 48 in (< 4 ft) | Rainstick or flute blank only |

Measure the dried stalk end-to-end before zoning. The base end is the widest, heaviest end (root side); the upper end is the narrowest (tip side).

---

## 2. Cut Zones (Tall Stalk ≥ 8 ft)

```
BASE                              UPPER (tip)
|<--- Base/Bell zone --->|<--- Mid zone --->|<--- Upper zone --->|

Widest OD                                            Narrowest OD
Heaviest wall                                        Lightest wall
```

| Zone | Portion of stalk length | Expected OD range | Primary instrument |
|---|---|---|---|
| **Base / Bell** | Bottom 40–50 % | 3.5–6 in | Didgeridoo (bell/bore source) |
| **Mid** | Middle 30–40 % | 2.5–4 in | Didgeridoo (upper bore) or rainstick |
| **Upper** | Top 20–25 % | 1.5–3 in | NA flute blank or rainstick |

> **Overlap rule:** Zones are guidelines, not fixed fractions. Let wall thickness and taper (see `material-spec.md`) drive where exactly you cross-cut. Move the base/mid boundary up or down by 4–6 in to land on a section that passes the wall-thickness check.

---

## 3. Zone → Instrument Assignments

### 3a. Tall stalk — 3-instrument split

```
Stalk length example: 120 in

BASE/BELL zone: 0–54 in     → Didgeridoo blank (A1–Bb1 range)
MID zone:       54–96 in    → Second didgeridoo (higher key, shorter bore) or rainstick
UPPER zone:     96–120 in   → NA-flute blank or rainstick
Trim/kerf loss: ~2 in total across two cross-cuts
```

### 3b. Tall stalk — 2-instrument split (conservative)

```
BASE/BELL zone: 0–60 in     → Didgeridoo blank
UPPER zone:     60–120 in   → Rainstick (full-length, good cascade)
Trim/kerf loss: ~1 in
```

### 3c. Short stalk — 1-instrument split

```
Full stalk: 60–95 in        → Single didgeridoo blank (may require acoustic shortening)
No secondary cut
```

---

## 4. Cut-Point Selection

1. Lay the stalk horizontally on sawhorses. Mark the intended cut lines with chalk or tape before cutting.
2. At each proposed cut, measure:
   - OD at that point (should be ≥ 2 in for a playable bore)
   - Wall thickness (must be ≥ 1/4 in — see `material-spec.md`)
   - Check for knots, cracks, or narrowing that would weaken the cut zone
3. Adjust the cut line ± a few inches to avoid structural weak points.
4. Use a fine-tooth cross-cut saw or band saw. Protect against agave dust (see `safety/agave-dust.md`).

---

## 5. Yield Expectations

| Stalk height | Instrument yield | Notes |
|---|---|---|
| Tall (≥ 8 ft) | **2–3 instruments** | Base → didge, mid → didge or rainstick, upper → flute or rainstick |
| Short (4–7 ft) | **1 instrument + possible offcut** | Usually one full didge; upper trim may yield a small flute blank |
| Stub (< 4 ft) | **1 rainstick or flute only** | Not enough length for a didge in the A1–E1 range |

Typical kerf and trim waste per cross-cut: 1/4–1/2 in. Budget 2–3 cuts for a tall stalk → 1 in total waste.

---

## 6. Waste / Offcut Notes

- **End trim (1–2 in each end):** Remove damaged, weathered, or cracked end grain before zoning. These scraps are good test pieces for the knuckle-tap cure check.
- **Mid-cut offcuts (< 6 in):** Too short for instruments; useful as bore-diameter gauge samples or dust-collection test media.
- **Failed-zone pieces:** Sections that fail the wall/taper check can still be used as percussion shakers (fill with seeds) or left as garden stakes — no-waste principle.

---

## 7. Recording the Cut Plan (A6 Log)

```
Stalk ID: ___________   Species: [ ] agave  [ ] yucca   Length: ______ in
Height class: [ ] tall (≥8 ft)  [ ] short  [ ] stub

END TRIMS
  Base end trim: ______ in      Upper end trim: ______ in

CUT LINES (measure from base end)
  Cut 1 at ______ in → Base/Bell zone ends here
  Cut 2 at ______ in → Mid zone ends here (if 3-instrument split)

ZONE ASSIGNMENTS
  Base/Bell (0–______): ____________________
  Mid (______–______): ____________________ (if applicable)
  Upper (______–end): ____________________

Notes:
```

---

## Cross-References

- Stalk grading before cutting: `stock-prep/material-spec.md`
- Cure verification: `stock-prep/cure-check.md`
- Bore prep after cutting: `stock-prep/bore-prep.md`
- Rainstick build (upper zone): `builds/yucca-rainstick.md`
- NA-flute build (upper zone): `builds/yucca-na-flute.md`
- Dust safety during cross-cutting: `safety/agave-dust.md`
