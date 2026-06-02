---
name: gds-accessibility
description: 'Verify and apply accessibility requirements for UK government services built with the GOV.UK Design System — WCAG 2.2 AA conformance, the Public Sector Bodies Accessibility Regulations 2018, component-level accessibility acceptance criteria, keyboard operation, screen reader behaviour, focus management, error announcement, colour contrast, reduced motion, and accessibility statements. Use this skill whenever the user asks "is this accessible", "does this meet WCAG", "what about screen readers", "keyboard navigation", "focus state", "accessibility statement", "PSBAR", or is reviewing/auditing a component or page for accessibility on a UK public-sector service.'
---

# gds-accessibility

Apply accessibility rules that sit across every GOV.UK Design System component and pattern.

## When to use this skill

- Any direct question about WCAG, screen readers, keyboard, focus, contrast, motion, or assistive tech.
- A11y review of a page, component, or PR.
- Drafting or updating an accessibility statement for a UK public-sector service.
- Cross-cutting check after applying `gds-components` or `gds-patterns`.

## Legal and standards baseline

- **WCAG 2.2 Level AA** is the GOV.UK target.
- **Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility Regulations 2018** ("PSBAR") apply to most UK public-sector services and require a published accessibility statement.
- Services that pass GDS assessment must demonstrate WCAG 2.2 AA conformance and have an accessibility statement.

## Authoritative sources

- https://design-system.service.gov.uk/accessibility/ (criteria embedded per component)
- https://www.gov.uk/service-manual/helping-people-to-use-your-service/making-your-service-accessible-an-introduction
- Every component page on the Design System has an "Accessibility" section with acceptance criteria — treat these as canonical.

## Standing checklist (apply to any page)

1. **Skip link** to `<main>` is the first interactive element.
2. **Heading order** is meaningful and not skipped (`h1` once, then `h2`, `h3`…).
3. **All inputs have a `<label>` (or `<legend>` inside a `<fieldset>` for grouped inputs)** — placeholders are not labels.
4. **Errors** appear in an Error summary at the top, linked to each field; per-field Error message uses `aria-describedby`; `<title>` is prefixed with "Error:".
5. **Focus state** is the documented yellow (`#fd0`) outline — never `outline: none` without a visible replacement.
6. **Colour contrast** ≥ 4.5:1 for body text, 3:1 for large text and UI components.
7. **Keyboard**: every interactive element reachable and operable; no keyboard traps; logical tab order.
8. **Screen reader**: live regions for async updates (e.g. character count), correct roles, no decorative icons in the accessible name.
9. **Motion**: respect `prefers-reduced-motion`; avoid auto-playing animation.
10. **Language**: `<html lang="en">` (or `cy` for Welsh) set.

## Workflow

1. Identify what's being reviewed (component, page, or whole service).
2. Pull the canonical accessibility criteria for each component on the page.
3. Walk the standing checklist above.
4. Report findings with severity (Blocker / Major / Minor) and the specific WCAG SC where relevant.
5. If reviewing for assessment, also point at the accessibility statement and any third-party-audited report.

## Guardrails

- Do not declare something "accessible" from markup inspection alone. Recommend testing with keyboard, a screen reader (NVDA + Firefox, VoiceOver + Safari), and automated tools (axe, Pa11y) before stating conformance.
- Automated tools catch ~30–40% of issues; manual testing is required.
- Don't recommend ARIA where native HTML suffices — "no ARIA is better than bad ARIA".
