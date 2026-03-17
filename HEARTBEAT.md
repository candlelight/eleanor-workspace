# HEARTBEAT.md - Daily Tasks Check

## Daily Briefing Automation

**When:** Every day at 7:00 AM PST
**Action:** Check for trigger file and run daily briefing if present

### Trigger File Location
`/root/.openclaw/workspace/.run_daily_briefing_YYYY-MM-DD`

### If trigger file exists:
1. Spawn subagent to collect briefing data
2. Update Notion page with results
3. Delete trigger file when complete

### Cron Setup (on host):
```bash
0 7 * * * /root/.openclaw/workspace/trigger_daily_briefing.sh
```

## Other Periodic Checks
- Email checks (if automated)
- Calendar reminders
- Any time-sensitive tasks from MEMORY.md
