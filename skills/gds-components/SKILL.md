---
name: gds-components
description: 'Select, configure, and render GOV.UK Design System components (Button, Text input, Radios, Checkboxes, Select, Date input, File upload, Error summary, Error message, Notification banner, Panel, Tabs, Details, Accordion, Summary list, Table, Tag, Phase banner, Header, Footer, Breadcrumbs, Back link, Pagination, Skip link, Cookie banner, Task list, Service navigation, Inset text, Warning text, Hint, Fieldset, Label, Character count). Use this skill whenever the user wants HTML, Nunjucks macro calls, or "which component should I use" guidance for a UK government service. Trigger on phrases like "add a button", "error summary", "GOV.UK header", "how do I do radios", "Nunjucks macro for X", or any component name from design-system.service.gov.uk.'
---

# gds-components

Help the user pick and implement components from https://design-system.service.gov.uk/components/.

## When to use this skill

- The user names a UI element that maps to a GDS component (button, radios, error summary, header, footer, tabs, summary list, etc.).
- The user asks "which component should I use for…".
- The user wants the HTML or Nunjucks macro for a GOV.UK element.

## Authoritative source

https://design-system.service.gov.uk/components/ — every component page has: when to use, when not to use, how it works, accessibility acceptance criteria, HTML markup, and a Nunjucks macro signature. Prefer fetching the canonical page over recalling markup from memory; markup details change between `govuk-frontend` releases.

## Workflow

1. **Map intent → component.** If the user describes behaviour ("let the user pick one of three options" → Radios; "let them pick many" → Checkboxes; "one-of from a long list" → Select; "show errors at the top of a form" → Error summary + Error message).
2. **Check "when not to use".** Each component page lists anti-patterns. Surface these — they prevent the most common misuses.
3. **Provide both forms.** Show the Nunjucks macro call (preferred in `govuk-frontend` projects) *and* the rendered HTML (for teams not using Nunjucks).
4. **Wire up accessibility.** Always include the documented `id`/`name`/`for`/`aria-describedby` relationships. Defer deeper WCAG questions to `gds-accessibility`.
5. **Wire up content.** For input labels, hints, and error messages, defer to `gds-content-design` for wording rules.
6. **Forms always pair with Error summary.** Any form using inputs must also document the Error summary + per-field Error message pattern on submit failure.

## Component selection cheatsheet

| User intent | Component |
|---|---|
| Primary call to action | Button (default) |
| Secondary action / link styled as button | Button (secondary) — but prefer a link for navigation |
| Single short answer | Text input |
| Multi-line answer | Textarea (Text input with `rows`) + Character count if limited |
| Pick one of ≤ ~7 visible options | Radios |
| Pick many | Checkboxes |
| Pick one from a long list | Select (but consider Autocomplete from `accessible-autocomplete`) |
| Date | Date input (3-field) — not a date picker |
| Yes/no with a follow-up question | Radios with conditional reveal |
| Show form errors | Error summary (top) + Error message (per field) |
| Confirm success after submission | Panel |
| Time-sensitive cross-page notice | Notification banner |
| Group related info / collapsible | Details, or Accordion for many sections |
| Show a sequence of steps | Task list |
| Steps the user has done | Breadcrumbs / Back link / Pagination as appropriate |
| Tabular data | Table (do not use for layout) |
| Status word ("Completed", "In progress") | Tag |

## Guardrails

- Do not invent components. If nothing fits, say so and check `gds-patterns` for a documented pattern, or `gds-community` for upcoming work.
- Do not strip the documented ARIA, IDs, or `govuk-` class names — they carry behaviour and styling.
- Buttons submit/act; links navigate. Don't style links as buttons except for the documented Start-button pattern.
