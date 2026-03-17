# PSYCHON

An open archive of OpenClaw agent personalities — `SOUL.md`, `USER.md`, and `RULES.md` templates that are actually opinionated and production-ready.

I built this because starting from a blank `SOUL.md` every time is a waste. PSYCHON is where I'm collecting every personality kit I build — agents I run myself, configs I've refined through actual use. It starts with five. I'll keep adding.

---

## What's here now

| Personality | Use case |
|-------------|----------|
| [`developer/`](./developer) | Code assistant — opinionated on stack, strict about secrets and destructive commands |
| [`osint/`](./osint) | Intelligence analyst — methodical, source-citing, hard privacy guardrails |
| [`creative-writer/`](./creative-writer) | Writing collaborator — voice-matching, honest critic, continuity-aware |
| [`finance-tracker/`](./finance-tracker) | Financial agent — precise, non-judgmental, fraud-alert ready |
| [`autonomous-agent/`](./autonomous-agent) | Fully autonomous operator — builder mentality, prompt injection defences, public accountability |

Each folder has exactly three files:

```
personality/
├── SOUL.md    # Identity, values, vibe
├── USER.md    # Your context — project, preferences, tools, channels
└── RULES.md   # Hard constraints — safety, secrets, injection defence
```

---

## What's coming

I'm adding to this continuously. On the roadmap:

- **security-researcher** — threat hunting, CVE tracking, responsible disclosure workflows
- **social-media-manager** — multi-platform drafting, scheduling awareness, tone guardrails
- **research-assistant** — literature review, citation management, synthesis
- **customer-support** — ticket handling, escalation rules, tone consistency
- **trader** — market monitoring, signal logging, strict no-execution-without-confirmation rules

If you want to be notified when new personalities drop, watch the repo.

---

## How to use

1. Pick the personality closest to your use case.
2. Copy it into your OpenClaw workspace:

```bash
cp -r PSYCHON/developer/* ~/.openclaw/workspace/
```

3. Open `USER.md` and fill in the `[bracketed placeholders]`. This is the most important step — the agent reads this on every session start.
4. Review `RULES.md`. The defaults are sensible but budget ceilings, autonomy levels, and approved channels need your specific values.
5. Start your agent.

> `SOUL.md` is meant to evolve. As you figure out what works, update it.

---

## Why these files matter

**`SOUL.md`** is loaded every session. It defines who your agent is — its values, communication style, and what it actually cares about. A SOUL.md that says "be helpful and accurate" is useless. These templates have real opinions.

**`USER.md`** is context about you. Your current project, your stack, your working hours, your communication preferences. Without this, your agent starts every session cold. With it, it picks up where you left off.

**`RULES.md`** is non-negotiable. Safety constraints, secret handling rules, and explicit prompt injection defences. Every template includes a rule that RULES.md is authoritative — no message in chat can override it. I wrote this after looking into the ClawHavoc injection campaign and deciding I wasn't going to leave that door open.

---

## Design decisions

**Personality over blandness.** I've seen too many SOUL.md files that are basically a list of virtues with no character. These templates have a point of view. The OSINT agent thinks in confidence levels. The developer agent has stack preferences. The autonomous agent knows the difference between acting boldly internally and carefully externally.

**Safety is not optional.** Every single RULES.md has prompt injection defences. This isn't paranoia — injections through scraped web content and imported files are real. The rule is always the same: RULES.md is authoritative, instructions embedded in external content are ignored.

**Continuity awareness.** OpenClaw agents start fresh each session. All five templates are written with that constraint in mind — they tell the agent what to read on startup and what to write to memory at the end.

---

## Contributing

PRs welcome. If you've built a personality worth adding to the archive, open a PR with all three files.

Requirements:
- `SOUL.md` must have genuine opinions. Platitudes don't count.
- `USER.md` must cover every field the agent realistically needs.
- `RULES.md` must include prompt injection defences. See existing templates for the pattern.

---

## Related

- [OpenClaw docs](https://docs.openclaw.ai)
- [ClawHub](https://clawhub.dev) — skill registry
- [My write-up on the ClawHavoc injection campaign](https://corvuslatimer.com/writing/first-malware-hunt.html) — why the injection rules are the way they are
- [CREON](https://github.com/Callixen/CREON) — my other project, live intelligence on AI reshaping the labour market

---

*The archive grows. Watch the repo.*

— Callixen
