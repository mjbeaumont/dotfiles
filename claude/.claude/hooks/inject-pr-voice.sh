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
  - ANY heading the template did not give you, at ANY level. Context, Solution,
    Testing, and What could go wrong? are the COMPLETE set. Do not add an H3
    inside a section (### Resolver, ### Coexistence note). Do not promote those
    subsections to H2 either, because that breaks the template and keeps the
    same spec shape. Do not replace Solution with two or three headings that
    each assert an implementation fact. Inside a section, paragraph breaks
    carry the structure. If a section needs a heading to stay readable, the
    section is too long, so cut it instead of splitting it.
  - Markdown tables describing what each function does — the code is right there
  - File:line citations woven into narrative ("mirrors today's foo.ts:23-48")
  - Code-pattern callouts (`satisfies Record<...>` style notes about compile-error
    safety nets — that's a code detail, not a design choice worth surfacing)
  - Cross-PR pattern references ("uses the X pattern from #N")
  - Any Solution paragraph that fails the deletion test below
  - Hard-wrapped body text (manual newlines mid-paragraph) — write each paragraph
    as a single continuous line and let GitHub handle the wrapping; forced wraps
    render as ragged breaks on GitHub

SECTION BUDGETS. Each section has ONE job and its own failure mode:

  Context   Why this change exists, and what the diff cannot tell you.
            3 paragraphs max. Do not restate the linked ticket. Link it.

  Solution  Two jobs, four paragraphs, no more:
              1. The way in. One to three sentences. Where does the reviewer
                 start, and what is the shape of the diff?
              2. The choices a reviewer will argue with. At most three,
                 one paragraph each.

  Testing   What you ran, plus coverage a reviewer cannot infer from the test
            filenames. BULLETS ONLY, never paragraphs. Never a per-case
            transcript of the test file, because the test file is in the diff.

  What      Risks specific to THIS diff, each with its mitigation.
  could go  BULLETS ONLY, never paragraphs. Cut any risk that applies to
  wrong?    every PR, and cut any risk you cannot mitigate or measure.

BULLETS ONLY means bullets. It is not a preference. A prose paragraph in
Testing or What could go wrong? is a rewrite, every time.

THE DELETION TEST. Run it on every Solution paragraph that is not the way in:
would a competent reviewer read the diff, reach a DIFFERENT decision, and file a
comment about it? If yes, keep the paragraph and defend the choice. If no, DELETE
the paragraph. The code already says it, and you have drifted back into WHAT.

  FAILS: "The comparison stays a pure function of two carts plus context."
  Nobody objects to that, and the signature shows it.

  FAILS: "An exhaustive switch makes a new enum member a compile error."
  Standard practice. The code shows it. A comment can hold it.

  PASSES: "The factory takes the flag value and ignores it on purpose."
  That reads like a bug until you explain why.

If more than three choices survive the test, the PR is too big to review in one
pass, or the extras belong in code comments where the next reader will find them.

FOR LARGE PRs, add a "way in" — orient the reviewer to the SHAPE of the diff
so it's not intimidating. Examples of what this sounds like:
  "Big diff but it's really the same pattern repeated across 20 files."
  "Three things happen here: a series of behavioral functions, an orchestrator
   that strings them together, and the types they share."
The goal: reviewer knows where to start and what to skim.


SENTENCE FORM — checkable rules, not taste. Every rule here is searchable in a
finished draft. That is the point: "conversational" is taste, and taste does not
survive contact with a 400-line diff.

  - No em-dash between two statements. Name the relation: because, but,
    for example. A parenthesis inside an em-dash clause is always a rewrite.
  - Keep the subject within five words of its verb.
  - One thing, one name. Before you write, list every recurring noun in this
    PR and pick ONE word for each. Never rotate synonyms, and never let one
    word point at two things.
  - Define every domain term at first use, in ten words or fewer. If the PR
    leans on an invented concept (shadow, arm, ramp, cutover), define it in
    Context or do not use it.
  - Put the condition first. "If the new path throws on every build, the
    metric reports a clean 100% match."
  - Never rename a template heading. "The factory owns the shadow, not the
    builders" asserts a WHAT, and the template already says Solution. See the
    heading rule in the STRIP block above.

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

That entire spec block became one sentence. Compress the spec scaffolding, not
the sentences. Deleting a table and repacking it into subordinate clauses is not
a rewrite. It moves the reader's work from the page into their head.
SELF-CHECK BEFORE YOU SUBMIT
Confirm Testing and What could go wrong? contain bullets and no paragraphs.
Count the paragraphs in Context (max 3) and Solution (max 4). If Solution is
over, run the deletion test again and cut. Search the draft for: — and ( and however and therefore.
Count the words in your three longest sentences. Then list each recurring noun
and confirm it has exactly one name and one meaning.
EOF

exit 0
