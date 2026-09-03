#!/usr/bin/env bash
# User-level PreToolUse hook: fires on `gh pr create` or `gh pr edit` across
# all repos. Layers on top of any repo-specific PR hooks (e.g. services
# injects the template). This hook enforces VOICE/TONE on the PR body.
#
# WHY blocking instead of additionalContext: a non-blocking hook injects its
# text into the tool *result*, i.e. after the command already ran with the
# `--body` baked in — too late to shape the PR it fired on. So the first time
# we see a `gh pr create|edit` in a session we DENY, handing the guidance back
# as the denial reason. That bounces control to the model before the PR is
# created, so it recomposes the body with the guidance in hand and retries.
#
# Avoiding an infinite deny loop: a per-session flag file marks "guidance
# already shown". The retry sees the flag and is allowed through, then clears
# it so the next PR in the same session re-triggers the reminder.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')
SESSION=$(echo "$INPUT" | jq -r '.session_id // "nosession"')

if ! echo "$COMMAND" | grep -qE '(^|&&|;|\|)\s*gh\s+pr\s+(create|edit)'; then
  exit 0
fi

FLAG="${TMPDIR:-/tmp}/claude-pr-voice-ack-${SESSION}"

# Second pass: the model has the guidance and is retrying. Allow it through and
# clear the flag so a later PR in this session gets the reminder again.
if [ -f "$FLAG" ]; then
  rm -f "$FLAG"
  exit 0
fi

# First pass: block, and hand the guidance back as the denial reason.
touch "$FLAG"
jq -Rs '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "deny", permissionDecisionReason: .}}' <<'EOF'
PR DESCRIPTION VOICE — non-negotiable defaults. Revise the --body to match these, then re-run the command:

The code shows WHAT changed. Your job is to give the reviewer the WHY.
The HOW only matters when something is genuinely odd — and if it's not
clear from the code or comments, that's a code/comment problem to fix
there, not something to paper over in the PR description.

Write each section as conversational prose, like explaining to a teammate
over Slack. Not a technical spec.

STRIP these patterns (they are tells that you've drifted into spec-writing):
  - H3 subsections inside Context or Solution (### Resolver, ### Coexistence note)
    — fold them into prose
  - Markdown tables describing what each function does — the code is right there
  - File:line citations woven into narrative ("mirrors today's foo.ts:23-48")
  - Code-pattern callouts (`satisfies Record<...>` style notes about compile-error
    safety nets — that's a code detail, not a design choice worth surfacing)
  - Cross-PR pattern references ("uses the X pattern from #N")
  - Enumerating every interesting design decision — pick the 2-3 that actually matter
  - Hard-wrapped body text (manual newlines mid-paragraph) — write each paragraph
    as a single continuous line and let GitHub handle the wrapping; forced wraps
    render as ragged breaks on GitHub

FOR LARGE PRs, add a "way in" — orient the reviewer to the SHAPE of the diff
so it's not intimidating. Examples of what this sounds like:
  "Big diff but it's really the same pattern repeated across 20 files."
  "Three things happen here: a series of behavioral functions, an orchestrator
   that strings them together, and the types they share."
The goal: reviewer knows where to start and what to skim.

KEEP bullets when they're terse single-line facts (Testing checks,
What-could-go-wrong risks). Strip them when they're trying to do the work of prose.

CANONICAL BEFORE/AFTER (services PR #11480, Solution section):

  BEFORE (spec-style, what NOT to write):
  ### Internal structural contracts, no Sequelize coupling
  Every converter consumes a minimal, service-defined contract...
  ### Converters
  | Function | Input | Returns |
  |---|---|---|
  | `referralToCandidate` | `TrialReferrerInput | null` | `PromotionCandidate | null` |
  | `couponToCandidate` | ... | ... |
  ### Resolver
  `resolveTrialDiscount(candidates)` filters nulls, ranks candidates by source...
  The precedence map is `satisfies Record<...>` so adding a source without
  ranking it is a compile error.

  AFTER (prose, what TO write):
  This first PR simply creates the types we'll use, as well as a pure resolver
  that takes source-specific promotions, coalesces them into a common shape,
  and then projects a winner based on a fixed priority order.

That entire spec block became one sentence. Match that compression ratio.
EOF

exit 0
