---
name: gds-prototype-kit
description: 'Build, run, and share rapid HTML prototypes of UK government services using the GOV.UK Prototype Kit — installing the kit, creating pages with Nunjucks, branching journeys, faking data and sessions, maintaining a design history / design log / audit trail of what changed after each round of research, password-protecting and publishing to Heroku, and handing prototypes to user research. Use this skill whenever the user mentions "prototype kit", "govuk-prototype-kit", "gov.uk prototype", "make a clickable prototype", "test with users in research", "prototype a journey", "alpha prototype", or wants to mock a GOV.UK journey end-to-end before any production build. Prefer this skill over gds-implementation when the goal is throwaway research artefacts rather than production code.'
---

# gds-prototype-kit

Build clickable HTML prototypes of UK government services for user research using the GOV.UK Prototype Kit (https://prototype-kit.service.gov.uk/).

## When to use this skill

- The user wants to mock a journey end-to-end *before* committing to production code — typically in discovery or alpha.
- Phrases: "prototype kit", "govuk-prototype-kit", "clickable prototype", "mock the journey", "test with 5 users", "alpha prototype", "design history", "publish to Heroku".
- The user needs branching ("if they pick yes, show this; if no, skip"), fake data, or fake sign-in for research.
- Choose **this skill over `gds-implementation`** when the artefact is throwaway and for research, not production.

## What it is (and isn't)

The Prototype Kit is a Node + Express + Nunjucks app pre-wired with `govuk-frontend`. It exists to make prototypes that *look real* to research participants and *cost almost nothing* to change.

It is **not** a production framework. Prototypes have no test coverage, no real auth, no database, no accessibility guarantee beyond what `govuk-frontend` provides, and store "data" in the session. Never ship a prototype as a live service — rebuild it properly per `gds-implementation` and the Service Standard (`gds-service-standard`).

## Authoritative sources

- https://prototype-kit.service.gov.uk/docs/ — official docs
- https://github.com/alphagov/govuk-prototype-kit — source + releases
- https://prototype-kit.service.gov.uk/docs/templates — starter templates per page type
- Design History pattern: https://prototype-kit.service.gov.uk/docs/ (search "design history")

## Canonical install

Requires Node.js (current LTS). Then:

```bash
npx govuk-prototype-kit@latest create my-prototype
cd my-prototype
npm run dev
```

The kit serves at http://localhost:3000 with hot reload. Pages live in `app/views/` as `.html` files using Nunjucks. Routes go in `app/routes.js`.

## A minimal page

`app/views/start.html`:

```njk
{% extends "layouts/main.html" %}
{% block pageTitle %}Apply for a thing – GOV.UK{% endblock %}
{% block content %}
  <h1 class="govuk-heading-xl">Apply for a thing</h1>
  {{ govukButton({ text: "Start now", href: "/name", isStartButton: true }) }}
{% endblock %}
```

`app/views/name.html` (a question page — the `<label>` *is* the question; defer wording to `gds-content-design`):

```njk
{% extends "layouts/main.html" %}
{% block content %}
  <form method="post" action="/name-answer">
    {{ govukInput({
      label: { text: "What is your full name?", classes: "govuk-label--l", isPageHeading: true },
      id: "full-name", name: "full-name"
    }) }}
    {{ govukButton({ text: "Continue" }) }}
  </form>
{% endblock %}
```

## Branching journeys

Two ways:

1. **Static links** — `href="/yes-path"` / `href="/no-path"` directly from Radios. Simplest; works for linear demos.
2. **Routes that read session data** — in `app/routes.js`:

   ```js
   router.post('/eligibility-answer', (req, res) => {
     const answer = req.session.data['eligible'];
     if (answer === 'yes') return res.redirect('/next-question');
     return res.redirect('/not-eligible');
   });
   ```

   Form fields automatically populate `req.session.data` keyed by the input `name` — no controller boilerplate.

## Fake data and sign-in

- For pre-populated answers (e.g. a returning user), set defaults in `app/data/session-data-defaults.js`.
- For "signed-in" prototypes, create a fake sign-in page that sets `req.session.data['signed-in'] = true` and gate downstream pages on it.
- Never put real personal data, real credentials, or production API keys in a prototype. Research participants will see it.

## Design history

Maintain `app/views/design-history.html` with dated entries describing every meaningful change and the research finding that drove it. This is the artefact that survives — the prototype itself is disposable.

## Publishing for research

The kit ships with built-in password protection. Set `BASIC_AUTH_USERNAME` and `BASIC_AUTH_PASSWORD` env vars before deploy. Heroku is the documented deploy target:

```bash
heroku create my-prototype
git push heroku main
heroku config:set BASIC_AUTH_USERNAME=research BASIC_AUTH_PASSWORD=...
```

Share the URL + credentials with the research team — never publicly.

## Workflow

1. Confirm the goal is *research*, not production. If production, route to `gds-implementation`.
2. Sketch the journey on paper or in `gds-patterns` terms first — pages, branches, end states.
3. Scaffold with `npx govuk-prototype-kit@latest create`.
4. Build pages using documented templates (start, question, check-answers, confirmation) — pull markup from `gds-components`, wording from `gds-content-design`.
5. Wire branches via static links or session-data routes.
6. Password-protect and deploy for research; never expose publicly.
7. After each round of research, update the design history with what changed and why.

## Guardrails

- Do not promote a prototype to production. The kit has no tests, no real auth, no a11y assurance, and stores everything in session memory.
- Do not collect real personal data in a prototype.
- Do not skip password protection on deployed prototypes — they look like the real GOV.UK and can mislead the public.
- Do not write custom CSS for visuals you can get from `govuk-frontend` — fidelity to the real Design System is what makes research valid.
- Accessibility still matters in research. A prototype that fails basic keyboard nav will fail with disabled participants — keep `gds-accessibility` in the loop.
