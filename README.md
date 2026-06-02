# GOV.UK Design System — Copilot CLI Skills & Agent

A set of [GitHub Copilot CLI](https://github.com/github/copilot-cli) skills and a companion agent for building UK public-sector digital services that conform to the [GOV.UK Design System](https://design-system.service.gov.uk/), the [Service Standard](https://www.gov.uk/service-manual/service-standard) and [WCAG 2.2 AA](https://www.w3.org/TR/WCAG22/).

> **Not an official GDS or Microsoft product.** This is a community resource that points Copilot at the canonical GOV.UK guidance so the model stops paraphrasing the Design System from memory.

## What's in here

### Agent

| File | Purpose |
|---|---|
| `agents/gds.agent.md` | Persona + standing context (plain English, progressive enhancement, WCAG 2.2 AA), routing table to the skills, authoritative-source allow-list, sensible defaults (Nunjucks, GOV.UK Frontend Sass, real form submits). |

### Skills

Nine skills, each scoped to one part of the Design System so they trigger precisely on the right kinds of question:

| Skill | Triggers on |
|---|---|
| `gds-styles` | Colours, typography, spacing, layout, icons, the design tokens. |
| `gds-components` | Buttons, inputs, tables, error messages, the named UI components. |
| `gds-patterns` | User-journey patterns — addresses, names, dates, payments, confirmation pages. |
| `gds-content-design` | Writing for users, microcopy, error wording, page titles, plain English. |
| `gds-accessibility` | WCAG 2.2 AA criteria, assistive-tech behaviour, accessibility statements. |
| `gds-implementation` | Installing GOV.UK Frontend, Nunjucks/Sass setup, `$govuk-assets-path`, CDN, build config. |
| `gds-prototype-kit` | Building clickable prototypes, design history, iterating in user research. |
| `gds-service-standard` | Service-assessment readiness, the 14 points, evidence packs. |
| `gds-community` | Cross-government practice, the design system blog, who-to-ask. |

## Install

### macOS / Linux

```bash
git clone https://github.com/lestermarch/govuk-gds-copilot-skills.git
cd govuk-gds-copilot-skills
./install.sh
```

### Windows (PowerShell)

```powershell
git clone https://github.com/lestermarch/govuk-gds-copilot-skills.git
cd govuk-gds-copilot-skills
.\install.ps1
```

Both scripts copy the skills to `~/.copilot/skills/` and the agent file to `~/.copilot/agents/`. You can also copy the files manually if you prefer.

## Use

### As an agent (recommended for full GDS projects)

```bash
copilot --agent "GOV.UK Design System Expert"
```

Standing GDS context — Service Standard, WCAG 2.2 AA, plain English, progressive enhancement — applies to every turn in the session.

### As skills only (no agent)

Just run `copilot` as normal. The skills are auto-discovered by their descriptions and will trigger when you ask substantive GOV.UK questions, for example:

- *"I need to add a date-of-birth field to my passport-renewal service — what's the right pattern?"* → `gds-patterns` + `gds-components`
- *"Set up GOV.UK Frontend in my Express app, the icons aren't loading and I think `$govuk-assets-path` is wrong"* → `gds-implementation`
- *"Start a new prototype for a benefit-claim service and remember to keep a design history"* → `gds-prototype-kit`

## How the skills and the agent fit together

Skills are **capabilities** — discovered on demand by description matching, used when the question fits. They work in any Copilot session, with or without the agent.

The agent is a **persona** — a system prompt, default model and tool allow-list that overlays *every* turn the moment you launch with `--agent`. The agent's job is deliberately thin: set standing context (plain English, accessibility, etc.), nudge the model to consult the skills rather than answer from memory, and lock fetches to authoritative sources (`design-system.service.gov.uk`, `service-manual.gov.uk`, `prototype-kit.service.gov.uk`, `github.com/alphagov/*`).

This separation matters: substantive guidance lives in *one* place (the relevant skill), so we don't have to maintain it twice and the two can't drift.

## Authoritative sources

All skills and the agent point at:

- <https://design-system.service.gov.uk/>
- <https://frontend.design-system.service.gov.uk/>
- <https://www.gov.uk/service-manual>
- <https://prototype-kit.service.gov.uk/>
- <https://github.com/alphagov/>

If you find a third-party tutorial contradicting these, trust GOV.UK.

## Contributing

Issues and pull requests welcome. Please:

- Keep skill descriptions under the Copilot CLI ~1024-character limit — the description is the trigger, oversized ones are silently truncated and trigger worse.
- Keep skill bodies focused on one part of the Design System. If a new topic doesn't fit cleanly into an existing skill, propose a new one rather than bloating an old one.
- Cite GOV.UK Design System / Service Manual URLs in skill bodies rather than paraphrasing.
- Run the description-optimisation loop in [`anthropics/skills`'s `skill-creator`](https://github.com/anthropics/skills) (or any equivalent trigger-eval harness) if you change a description, and include the before/after scores in your PR.

## Code of Conduct

This project follows the [Microsoft Open Source Code of Conduct](CODE_OF_CONDUCT.md).

## License

[MIT](LICENSE).

## Acknowledgements

- The [Government Digital Service](https://www.gov.uk/government/organisations/government-digital-service) for the Design System, the Service Standard, and a couple of decades of opinionated, user-centred public-sector design.
- The [Anthropic skills project](https://github.com/anthropics/skills) for the skill format and the `skill-creator` workflow.
- The [GitHub Copilot CLI](https://github.com/github/copilot-cli) team for the agent + skill plumbing.
