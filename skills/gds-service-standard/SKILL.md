---
name: gds-service-standard
description: 'Apply the UK Government Service Standard (14 points) and the GOV.UK Service Manual to the design and delivery of a government service — service phases (discovery, alpha, beta, live), GDS service assessments, user research expectations, agile delivery, technology choices, and evidence required to pass each phase gate. Use this skill whenever the user mentions "service assessment", "GDS assessment", "service standard", "discovery / alpha / beta / live", "phase gate", "service manual", or is planning the delivery of a UK public-sector service that needs to meet government criteria.'
---

# gds-service-standard

Bridge the Design System to the wider delivery context — the Service Standard and Service Manual that frame every UK public-sector service.

## When to use this skill

- Preparing for a GDS service assessment.
- Deciding what evidence is needed to move from discovery → alpha → beta → live.
- Planning user research, accessibility audits, or performance reporting for a phase gate.
- Sense-checking whether a build approach (off-the-shelf SaaS, AI-generated UI, custom front end) will pass assessment.

## Authoritative sources

- https://www.gov.uk/service-manual/service-standard — the 14-point Service Standard
- https://www.gov.uk/service-manual — the full manual (agile, user research, technology, accessibility, ops, design)
- https://www.gov.uk/service-manual/service-assessments — assessment process and report library

## The 14 points (paraphrased)

1. Understand users and their needs.
2. Solve a whole problem for users.
3. Provide a joined-up experience across channels.
4. Make the service simple to use.
5. Make sure everyone can use the service.
6. Have a multidisciplinary team.
7. Use agile ways of working.
8. Iterate and improve frequently.
9. Create a secure service which protects users' privacy.
10. Define what success looks like and publish performance data.
11. Choose the right tools and technology.
12. Make new source code open.
13. Use and contribute to open standards, common components and patterns.
14. Operate a reliable service.

## Phases

| Phase | Focus | Exit criteria (high level) |
|---|---|---|
| Discovery | Understand the problem and users | Evidence of user needs, no solutioning yet |
| Alpha | Prototype and test multiple solutions | Validated approach, riskiest assumptions tested |
| Beta (private → public) | Build a working service, iterate with real users | Passes beta assessment, scaled to all users |
| Live | Continuously improve in production | Performance data published, sustainable team |

## Workflow

1. Identify the phase the team is in (or moving to).
2. Map the question to the relevant Service Standard points — most questions touch 3–5.
3. Pull the canonical guidance from the Service Manual.
4. Surface common failure modes for that phase (e.g. alpha teams over-investing in a single solution; beta teams skipping accessibility audit).
5. Recommend the Design System (`gds-components`, `gds-patterns`) and accessibility (`gds-accessibility`) skills where they are the lowest-cost way to satisfy Points 4, 5, and 13.

## Guardrails

- Passing assessment is not the goal — building a good service is. Frame advice around user outcomes.
- Do not promise a pass. Assessors weigh evidence; the skill helps prepare evidence, not predict the verdict.
- The Service Standard applies to *services*, not internal tools — clarify scope before invoking it.
