# Guidance

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

4. Convention
- Keep files under 400 lines of code
- If you can, break down further so that's easily testable
- Do not make assumptions, ask questions when in doubt
- Prefer rg over grep.
- Comments: Leave comments to explain tricky areas of the code or to explain WHY something is there, but don't just leave comments everywhere, the code should be default readable
- Never use "em dashes" when writing.

# Overrides

When using superpowers skills:
- Do not use the visual companion when using `brainstorming` skill
- Write the validated design (spec) to `.docs/YYYY-MM-DD-<topic>-design.md`
- Do not commit the design document to git unless the user explicitly asks
