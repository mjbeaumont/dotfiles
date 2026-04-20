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
