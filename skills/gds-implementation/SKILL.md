---
name: gds-implementation
description: 'Install, configure, and ship the GOV.UK Design System in code — the govuk-frontend npm package, Nunjucks templates and macros, Sass settings, the $govuk-assets-path variable for serving fonts/images/manifest from local /assets/ or a CDN, JavaScript initialisation (initAll), browser/JS support policy, CSP nonces for the inline support-detection script, and govuk-frontend version upgrades. Always use this skill for production engineering questions about wiring govuk-frontend into a real service: "install govuk-frontend", "configure $govuk-assets-path", "fonts/assets from CDN", "Sass paths", "import GOV.UK styles", "initAll", "upgrade govuk-frontend from v4 to v5", "CSP for govuk-frontend", "Express + Nunjucks", "Eleventy / Next.js / Rails with GOV.UK", or any engineering integration question — even when the user appears to be asking about a single config variable.'
---

# gds-implementation

Wire the GOV.UK Design System into an application. This is the engineering counterpart to `gds-components` and `gds-styles`.

## When to use this skill

- Installing or upgrading `govuk-frontend`.
- Configuring Sass paths, asset paths, font URL, the `$govuk-assets-path` variable.
- Setting up Nunjucks (or Twig, Liquid, Razor, JSX equivalents) to use the macro library.
- Initialising the JavaScript (`initAll()` or `createAll()` per v5+).
- Adopting in non-Express stacks (Eleventy, Next.js, Astro, Rails, .NET, Django).
- Reading release notes and migrating across major versions.

## Authoritative sources

- https://frontend.design-system.service.gov.uk/ (Frontend docs)
- https://github.com/alphagov/govuk-frontend (source + release notes)
- https://github.com/alphagov/govuk-prototype-kit (canonical reference setup)
- Per-component pages on https://design-system.service.gov.uk/components/ (macro signatures)

## Canonical install (Node / Nunjucks)

```bash
npm install govuk-frontend
```

```scss
// app.scss
$govuk-assets-path: '/assets/';
@import 'govuk-frontend/dist/govuk/all';
```

```js
// app.js (govuk-frontend v5+)
import { initAll } from 'govuk-frontend';
initAll();
```

```js
// Nunjucks (Express)
const nunjucks = require('nunjucks');
nunjucks.configure([
  'app/views',
  'node_modules/govuk-frontend/dist'
], { autoescape: true, express: app });
```

Static assets (fonts, images, manifest) must be served from `/assets/` — copy `node_modules/govuk-frontend/dist/govuk/assets` into the public dir.

## Page template

```njk
{% extends "govuk/template.njk" %}
{% from "govuk/components/button/macro.njk" import govukButton %}
{% block content %}
  {{ govukButton({ text: "Start now", href: "/start", isStartButton: true }) }}
{% endblock %}
```

## Workflow

1. Identify the stack. Node + Nunjucks is first-class; everything else needs adaptation.
2. For non-Nunjucks stacks, recommend either (a) pre-rendering Nunjucks at build time, or (b) re-implementing the markup using the documented HTML — never paraphrasing it.
3. Install `govuk-frontend`, wire Sass with `$govuk-assets-path`, copy assets, mount JS via `initAll()`.
4. Add the required `<meta>` tags, `lang` attribute, and IE-conditional class handling from the page template.
5. For Content Security Policy: `govuk-frontend` adds an inline `<script>` (`document.body.className += ' govuk-frontend-supported'`) — allow it via a nonce or move to an external file.
6. For upgrades, read the changelog top-to-bottom — v4→v5 in particular renamed JS APIs, moved Sass paths to `dist/govuk/`, and dropped IE11.

## Browser / JS support

GOV.UK follows a "progressive enhancement" model. Server-render everything; JS adds behaviour. Test that every flow works with JS disabled. Supported browsers track the [GOV.UK browser support matrix](https://www.gov.uk/service-manual/technology/designing-for-different-browsers-and-devices).

## Guardrails

- Do not copy component HTML from the Design System website without versioning — pin to the `govuk-frontend` release you depend on.
- Do not fork or vendor `govuk-frontend` source unless you have a maintained downstream. Use it as an npm dependency.
- Do not load fonts from a third-party CDN — bundle them via the `govuk-frontend` assets.
- Do not assume CSS-in-JS, Tailwind, or a CSS reset is compatible — the Design System ships with its own normalising styles.
