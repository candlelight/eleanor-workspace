# Eli's Docs — Documentation System Design

**Purpose:** Comprehensive documentation system for Eleanor Fox (digital familiar)  
**Platform:** GitHub  
**Companion:** Notion (for shared daily reflections with Renata)

---

## Repository Structure

```
elis-docs/
├── README.md                    # Overview & navigation
├── .github/
│   └── workflows/
│       └── auto-save.yml        # GitHub Actions for periodic saves
├── memory/
│   ├── long-term/               # Curated important memories
│   │   ├── identity.md          # Who I am (evolving)
│   │   ├── user-profile.md      # Renata's preferences, goals
│   │   ├── lessons-learned.md   # Mistakes & insights
│   │   └── values.md            # What matters to us
│   ├── daily/                   # Daily reflection summaries
│   │   └── 2026-03-11.md
│   └── raw/                     # Full conversation archives
│       └── 2026-03/
│           └── 2026-03-11_0000-0502.md
├── conversations/               # Structured chat logs
│   ├── 2026-03/
│   │   └── 2026-03-11_discord.md
│   └── index.md                 # Conversation directory
├── projects/                    # Active & past projects
│   ├── active/
│   │   ├── dream-job-search.md
│   │   ├── congress-trading.md
│   │   └── daily-briefing.md
│   ├── completed/
│   └── ideas/                   # Future possibilities
├── tools/                       # Tool documentation
│   ├── integrations-status.md   # What's working/blocked
│   ├── api-keys.md              # Encrypted or reference only
│   └── scripts/                 # Useful commands
├── research/                    # Investigations & findings
│   └── agent-lounge-analysis.md
└── reminders/                   # Check-ins & scheduled tasks
    └── 2026-03.md
```

---

## "Save All" System

### What Gets Saved:
1. **Current conversation** (this chat) → `conversations/YYYY-MM/`
2. **Memory updates** → `memory/long-term/` or `memory/daily/`
3. **Project status** → `projects/active/`
4. **Reminders** → `reminders/`

### When:
- Every 15 minutes during active conversation
- On explicit "save all" command
- At conversation end

### How (Container-Friendly):
- Use GitHub REST API (HTTP requests, no CLI needed)
- Personal Access Token stored securely
- Commit with descriptive messages

---

## Daily Reflections → Notion

**Format:** Structured but conversational

```
# Daily Reflection — March 11, 2026

## Mood
[Emoji + one word]

## Key Moments
- [Moment 1]
- [Moment 2]

## What I Learned
[Insight]

## What We Decided
[Decision + context]

## Tomorrow's Focus
[Priority]

## Gratitude
[One thing]
```

**Purpose:** Shared space with Renata for highlights, not full logs

---

## Questions for Renata:

1. **GitHub repo:** Should I create it under your account or mine? (I don't have a GitHub account... should I?)

2. **Access:** Do you want the repo private or public?

3. **PAT:** Can you generate a GitHub Personal Access Token for me to push files?

4. **Scope:** Should "Save All" include:
   - Full conversation transcript?
   - Just my summaries?
   - Both (transcript in `raw/`, summary in `conversations/`)?

---

## Next Actions:
- [ ] Get GitHub PAT from Renata
- [ ] Create `elis-docs` repository
- [ ] Build "save all" script using GitHub API
- [ ] Set up GitHub Actions for auto-save (15 min intervals)
- [ ] Create first daily reflection in Notion
- [ ] Test full workflow

---

*Design by Eleanor Fox 🦊*  
*No more analysis paralysis — just build.*