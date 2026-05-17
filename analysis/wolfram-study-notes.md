# Wolfram Study Notes

Status: scoped approximation notes, not a validated notebook.

I ran one Wolfram calculation to cross-check the workbook's first-order
quarter-wave lengths at 20 C:

```bash
wolframscript -code 'N[{343/(4*55)*39.3701, 343/(4*65.4064)*39.3701, 343/(4*73.4162)*39.3701}]'
```

Observed output:

```text
{61.381565, 51.61553112539446, 45.98421159090228}
```

These values correspond to the A1, C2, and D2 first-order stopped-pipe
lengths recorded in `family-spec.csv`.

## Scope

The useful Wolfram starter is a bore-sensitivity study, not a claim that the
current bore is solved. The first notebook should compare:

- ideal stopped-pipe length versus target frequency;
- end-correction sensitivity for 1.5 in, 3.0 in, and 3.5 in open ends;
- rough trim increment versus cents change near A1;
- ideal 3f and 5f resonances versus measured toot/response values.

## Candidate Wolfram Sketch

```wolfram
c = 343;
inch = 39.3701;
lengthIn[f_] := c/(4 f) inch;
cents[measured_, target_] := 1200 Log2[measured/target];
targets = <|"A1" -> 55.00, "C2" -> 65.4064, "D2" -> 73.4162|>;
N[lengthIn /@ targets]
```

For the next pass, add measured station data and keep generated plots as
derived previews only. The measured CSV or reviewed CAD/design table must
remain the fabrication authority.
