---
name: gds-patterns
description: 'Apply GOV.UK Design System patterns for task-level user journeys — asking users for information (name, address, date of birth, email, phone, NI number, gender/sex), helping them complete tasks (check answers, confirmation page, task list, question pages, step-by-step navigation), helping them with their account (create accounts, sign in, recover passwords), and patterns for payments. Use this skill whenever the user is designing a flow rather than a single component — e.g. "how do I ask for an address", "what should the check-your-answers page look like", "confirmation page after submission", "service start page", or any multi-step journey on a UK government service.'
---

# gds-patterns

Apply documented user-journey patterns from https://design-system.service.gov.uk/patterns/. Patterns compose components into proven flows.

## When to use this skill

- The user is designing a *flow* or *page type*, not a single widget.
- Phrases: "how to ask for X", "check answers page", "confirmation page", "start page", "task list page", "step by step", "create account", "verify email", "recover password".
- Anything where the answer is "one question per page" or "show a summary before submitting".

## Authoritative source

https://design-system.service.gov.uk/patterns/ — split into:
- **Ask users for…** (name, address, DOB, email, phone, postcode, NI number, gender/sex, nationality, bank details, passport details)
- **Help users to…** (check answers, confirm an answer, complete a task, recover from errors)
- **Page types** (start, question, check-your-answers, confirmation, task list)
- **Account management** (create, sign in, sign out, recover password)
- **Payments**

Fetch the canonical page when answering — pattern guidance evolves (e.g. asking for sex/gender has been substantially revised).

## Core principles (apply to every pattern)

1. **One thing per page.** Each question on its own URL. This makes journeys easier to test, analyse, and recover from errors.
2. **Progressive disclosure.** Ask the minimum; reveal follow-ups only when needed.
3. **Plain question, then input.** The `<label>` (or `<legend>` for grouped inputs) *is* the question — no separate "question" text above the label.
4. **Always finish with a check-answers page**, then a confirmation page with a reference number.
5. **Let users change answers** from check-answers without losing data.
6. **Don't ask for what you already know** or what you can derive.

## Common page types

| Page | Purpose | Key components |
|---|---|---|
| Start page | Explain the service, link to start | Button (Start), service description |
| Question page | One question | Fieldset/Label + input + Error summary on fail |
| Check answers | Review before submit | Summary list with "Change" links |
| Confirmation | Confirm success | Panel with reference, "what happens next" |
| Task list | Multi-section service | Task list component with Tags |

## Workflow

1. Identify the journey stage (collecting info → reviewing → submitting → confirming).
2. Pick the documented pattern; if asking for personal data (name, address, DOB) follow the specific pattern page — these encode legal, accessibility, and inclusivity decisions you should not re-derive.
3. Compose the right components via `gds-components`.
4. Defer wording (questions, hints, errors) to `gds-content-design`.
5. Defer accessibility verification to `gds-accessibility`.

## Guardrails

- Do not invent journeys for sensitive data (sex/gender, ethnicity, immigration status). Use the documented pattern verbatim and explain trade-offs.
- Do not combine multiple questions on one page just to "save clicks" — the pattern exists for good evidence-based reasons (error recovery, analytics, accessibility).
- Confirmation pages must include a reference number and what-happens-next content.
