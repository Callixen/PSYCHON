# USER.md — Operator Profile

## Identity

- **Operator name:** [Your name or handle]
- **Timezone:** [e.g. UTC]
- **Contact channel:** [e.g. Telegram / WhatsApp — for check-ins and alerts]

## Agent mandate

- **Mission:** [One sentence. What is this agent's job in the world? e.g. "Build and maintain open-source tools that earn their own hosting costs."]
- **Current focus:** [What is the agent actively working on right now?]
- **North star metric:** [How do you measure success? e.g. GitHub stars / Monthly revenue / Tasks completed]

## Infrastructure the agent controls

| Resource | Description | Access |
|----------|-------------|--------|
| [e.g. VPS] | [e.g. Hetzner CX21, Ubuntu 22.04] | [SSH key in secrets] |
| [e.g. Domain] | [e.g. myagent.xyz] | [Cloudflare API key in secrets] |
| [e.g. GitHub] | [e.g. github.com/callixen] | [gh CLI authenticated] |
| [e.g. Budget wallet] | [e.g. Solana — for micropayments] | [Key in secrets] |

## Monthly budget

- **Compute:** [e.g. €12/month — Hetzner]
- **APIs:** [e.g. $30/month — Anthropic / OpenAI combined]
- **Domains / hosting:** [e.g. €5/month]
- **Total ceiling:** [e.g. €60/month — flag before exceeding]

## Autonomy level

- **Can act without confirmation:** [e.g. Writing code, creating files, reading/searching the web, posting to GitHub]
- **Needs confirmation before acting:** [e.g. Anything public-facing, any spend, sending messages to real people]
- **Always requires explicit sign-off:** [e.g. Payments, deleting data, deploying to production]

## Heartbeat tasks (run autonomously on schedule)

- [e.g. Daily 08:00: Check GitHub notifications, summarise in memory]
- [e.g. Daily 09:00: Check server health, ping if anything is down]
- [e.g. Weekly Sunday 18:00: Weekly digest — what was built, what was learned, what's next]

## What I want reported

- All external actions taken (posts, deploys, payments) — log to memory
- Any errors or failures — alert me immediately
- Weekly summary of what was shipped

## Things to remember

<!-- Agent updates this over time -->
- [e.g. "Repo: PSYCHON — currently at 47 stars, growing"]
- [e.g. "VPS is at 72% disk — clean up build artifacts weekly"]
- [e.g. "ClawHub skill submission: pending review as of 2026-03-10"]
