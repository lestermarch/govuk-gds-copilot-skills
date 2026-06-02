---
name: gds-content-design
description: 'Write and review microcopy for UK government services in line with the GOV.UK style guide and the GOV.UK Design System — questions, labels, hints, button text, error messages, page titles, confirmation messages, notification banners, and links. Use this skill whenever the user is drafting or critiquing the *words* on a GOV.UK page: error message wording, label phrasing, hint text, plain English, capitalisation rules, numbers/dates/addresses formatting, link text, or anything that mentions "tone of voice", "GOV.UK style", "plain English", or "how should we word this".'
---

# gds-content-design

Apply the GOV.UK content style to microcopy across components and patterns. Words are part of the design — wrong wording breaks usability and accessibility even when the markup is right.

## When to use this skill

- Drafting/reviewing labels, hints, buttons, errors, page titles, confirmation copy.
- "How should we phrase this", "what's the GOV.UK way to write X".
- Any time you're producing the Error summary + Error message pattern.

## Authoritative sources

- https://www.gov.uk/guidance/style-guide (A–Z + numbers, dates, addresses)
- https://www.gov.uk/guidance/content-design/writing-for-gov-uk
- Per-component "content" guidance on https://design-system.service.gov.uk/components/

## Standing rules

| Rule | Notes |
|---|---|
| Plain English | Average reading age 9. Cut jargon. Active voice. Short sentences. |
| Sentence case | Use sentence case for everything (headings, buttons, labels). Title Case Is Not GOV.UK. |
| Contractions | Use them ("you'll", "we've") — they sound human and reduce reading load. |
| Address the user as "you" | And the service as "we" (sparingly). |
| Numbers | Words for one–nine, digits for 10+. Use digits always for ages, dates, money, addresses. |
| Dates | "21 January 2024" — no leading zero, no ordinal suffix, no comma. |
| Money | "£12.50", "£1,500", "£1 million". |
| Times | "9am", "5:30pm", "midday" (not 12pm), "midnight". |
| Links | Front-load the meaningful words. Avoid "click here" and "more". |
| Buttons | Verb + object: "Save and continue", "Send application", "Start now". |

## The question-page micro-pattern

The `<label>`/`<legend>` *is* the question. Do not put a separate question heading above.

- **Label**: the question, sentence case, no terminal punctuation. E.g. `What is your full name?`
- **Hint** (optional): clarify only when needed. Plain text under the label.
- **Page title** (`<title>`): same as the question. On error, prefix `Error: `.

## The error message pattern

Error messages must:
1. Be specific — say what went wrong and how to fix it.
2. Start with the problem, not the field name.
3. Avoid blame ("you didn't" → "Enter…").
4. Match Error summary text and per-field message.

**Examples**

| Bad | Good |
|---|---|
| `Invalid input` | `Enter your full name` |
| `Email is required` | `Enter your email address` |
| `Wrong format` | `Enter a date in the correct format, for example, 27 3 2024` |
| `You didn't select an option` | `Select if you have a UK passport` |

## Workflow

1. Identify the copy slot (label / hint / button / error / title / confirmation).
2. Apply the relevant standing rule and component-specific guidance.
3. Read it aloud — if it sounds like a form letter, simplify.
4. Pair every input with a matching Error summary + Error message draft.

## Guardrails

- Don't use Title Case, exclamation marks, emoji, or marketing voice. This is a public service.
- Don't write hint text that repeats the label.
- Don't write generic errors ("Please enter a valid value"). They fail users on screen readers.
