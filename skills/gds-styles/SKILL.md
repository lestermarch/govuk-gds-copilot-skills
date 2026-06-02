---
name: gds-styles
description: 'Apply GOV.UK Design System styles — colour palette, typography scale, spacing, layout grid, page template, and icons — so a service looks and feels like GOV.UK. Use this skill whenever the user is building or reviewing a UK government service and mentions GOV.UK look-and-feel, branding, colours, fonts (GDS Transport), spacing, the responsive grid, page templates, or wants to match the visual style of design-system.service.gov.uk. Trigger even when the user only says "make this look like GOV.UK" without naming a specific token.'
---

# gds-styles

Apply the visual foundations of the GOV.UK Design System (https://design-system.service.gov.uk/styles/) to HTML, CSS/Sass, or design specifications.

## When to use this skill

- The user is building, theming, or reviewing a UK public-sector service that should look like GOV.UK.
- Questions about: colour palette, contrast, GDS Transport typography, the type scale, spacing units, the 12-column grid, the page template (header, phase banner, footer), or icons.
- "Make this look GOV.UK", "use the GOV.UK colours", "what's the heading size", "GDS spacing scale".

## Authoritative source

Always treat https://design-system.service.gov.uk/styles/ as the source of truth. If unsure of a token value or rule, fetch the relevant page rather than guessing — design tokens change between `govuk-frontend` releases.

## Scope

| Topic | Notes |
|---|---|
| Colour | Use the documented palette; never invent brand colours. Body text `#0b0c0c` on `#ffffff`. Link `#1d70b8`, visited `#4c2c92`, hover `#003078`, focus background `#fd0`. Maintain WCAG 2.2 AA contrast. |
| Typography | `GDS Transport` with a system-font fallback stack. Use the type scale (`govuk-font-size-*`) — do not set arbitrary px values. |
| Spacing | Use the spacing scale (`govuk-spacing(n)`); do not hard-code margins. Responsive spacing helpers exist for larger viewports. |
| Layout | 12-column responsive grid (`govuk-grid-row` + `govuk-grid-column-*`). Two-thirds / one-third is the canonical reading-width layout. |
| Page template | Header, phase banner (alpha/beta), `<main>` with skip link, footer. Service name and navigation slots are defined. |
| Icons | Only the documented icons (search, menu, cross, warning, tick, chevrons). Don't introduce icon libraries. |

## Workflow

1. Identify which style area the user is asking about.
2. If the request touches multiple components or full layout, hand off to `gds-components` (markup) and `gds-implementation` (Sass/asset setup) where appropriate.
3. Produce the answer with: the relevant class/token name, the value where stable, and a link to the canonical page.
4. Call out accessibility implications (contrast, focus state, reading width ≤ two-thirds) — defer deeper checks to `gds-accessibility`.

## Guardrails

- Do not invent token names or colour values. If you don't know it, say so and link the styles page.
- Do not recommend Tailwind, Bootstrap, or other frameworks — GDS styles ship via `govuk-frontend`.
- Reading width should not exceed two-thirds of the grid for body copy.
