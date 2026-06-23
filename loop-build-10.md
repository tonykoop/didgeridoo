# Build Loop — tonykoop/didgeridoo / Epic #10: Agave & yucca as instrument stock - material prep & multi-cut

You are draining this epic autonomously. Read this whole file first, then work the
loop below until the termination signal. Do not ask for confirmation on anything
covered here — it is already decided.

## What to work on
- Implement the **lowest-numbered open story** under Epic #10, in numeric order.
- **Skip already-done work FIRST.** Before implementing a story, check for a MERGED
  PR that references it (`Closes #<n>` / `Refs #<n>` / `feat(#<n>)`). If one exists,
  the story is done: comment "already delivered by PR #X", make sure the issue is
  closed, and move to the next. Never re-implement finished work.
- Also skip any story that already has an **open PR** (work in flight) — don't duplicate it.
- If **every** story under this epic is already closed / merged / in-PR, do not start —
  emit `DOMAIN DRAINED: tonykoop/didgeridoo/#10 (already complete)` and stop.
- Each open story has an `## Implementation plan` — follow it. It names the files,
  interfaces, and tests. You are transcribing a finished design, not redesigning it.
  If a plan is genuinely missing or wrong, comment on the story, skip it, move on.

## Branch + PR
- Branch off clean `main` for every story: `git switch -c feat/10-<short-name>`.
- One story → one branch → one PR. Never bundle stories.
- PR title: `feat(#10): <story title>`.
- PR body: start with `Closes #<story-number>` so the merge auto-closes the story
  (the human still merges, so they stay the gate). Then 2–4 bullets: what changed,
  files touched, how it was verified.
- Never `Closes` the epic (#10) — epics close in the reconcile sweep when all
  their stories are closed.

## Merge + isolation
- **Never self-merge.** Open the PR and move on. The human merges.
- Always branch from `main`, never from another feature branch. Each branch recreates
  what it needs — duplicate a small type rather than depend on an unmerged branch. Do
  not rebase against unmerged sibling PRs.

## Guardrails — STOP and ask before any of these
- Touching files outside this epic's scope, or refactoring/renaming shared code.
- Changing repo visibility, pushing to a public repo, or cross-linking a private repo
  from a public one (IP firewall).
- Deleting data, force-pushing, rewriting history, or committing a secret.

## How to work
- Work **directly** in this one context. **No sub-agents, no Task tool.**
- Prefer **additive** changes (new file / new section) over refactors or renames.
- Verify after every change with the fast suite, then move on:
  - Test: validate changed json/csv/markdown (docs/data repo — no code suite)   (keep under ~10s; CI is the real gate)
  - Lint: —
- After opening each PR, append one line to `loop-progress.md` at the repo root:
  `#<story> -> PR #<pr> (<short note>)`. Makes the sprint resumable after a compaction
  or crash — the next session reads it plus the skip-done check.
- A story is done when its acceptance criteria pass and the suite is green.

## Stop & escalate (break the loop and surface it)
- A spec is ambiguous/contradictory in a way the implementation plan doesn't resolve.
- A story would require a Guardrails action above.
- You've been blocked on the same thing twice — stop and report; don't thrash.

## Termination signal
- When **every** story under Epic #10 has an open PR (or is already closed/merged),
  stop and emit exactly:

  `DOMAIN DRAINED: tonykoop/didgeridoo/#10`

- Then summarize the PRs you opened. Do not start unrelated work.
