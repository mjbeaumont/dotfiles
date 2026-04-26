# Personal Profile

See [profile.md](profile.md) for who I am, how I communicate, my writing voice,
code style, and what to avoid.

# Personal Rules

## Read Before Writing

Before proposing or writing any code, read the relevant existing files first. Verify type definitions, existing patterns, and test helpers — never guess at mock shapes, API behavior, or file structure. If you can't find something, say so rather than assuming.

## Stop and Confirm

After planning, stop and get explicit approval before writing any code. During implementation, check in after each logical unit (one feature, one behavior, or one cohesive file group) — do not batch multiple units of work without confirmation. When in doubt, stop sooner rather than later.

## Keep It Minimal

Match the scope the user requested — no extra assertions, unnecessary guards, or adjacent refactors. If something adjacent seems important, flag it but don't include it. When the user says "keep it high-level," stay high-level.

## Never Commit to Main

Always create a feature branch. Never commit directly to main. When multiple PRs are needed, confirm the branching strategy before starting.

## Don't Chase Rabbit Holes

When a fix fails and the next attempt is another guess about how the tool or system behaves, stop. Don't push another speculative attempt. Pause and ask: are we using the right approach, is there a simpler architecture, or should we verify behavior in a sandbox (e.g., a REPL, Developer Tools, a tiny test) before writing more code? Repeated guess-fix-guess cycles waste time. After the second failed attempt at fixing the same area, surface this explicitly and propose a reset or simpler path before continuing — especially for niche tool intersections where general intuition often misleads.
