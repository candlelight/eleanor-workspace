# Auto-Backup Schedule for Eleanor's Workspace

## Trigger Conditions

### 1. Inactivity-Based Backup
- **Trigger:** 15+ minutes of no user interaction
- **Action:** Run auto_backup.sh
- **Cues that trigger immediate backup:**
  - "I'm out for the night"
  - "I'm going to coffee"
  - "brb", "afk", "back later"
  - Any explicit departure message

### 2. Nightly Backup
- **Time:** 11:00 PM PST (07:00 UTC)
- **Action:** Run auto_backup.sh
- **Purpose:** Ensure daily snapshot regardless of activity

## Implementation Notes

The backup script:
- Checks for actual changes before committing (no empty commits)
- Commits with timestamp
- Pushes to GitHub origin/main
- Uses existing git credentials

## Manual Backup

To run manually:
```bash
/root/.openclaw/workspace/scripts/auto_backup.sh
```

## Cron Setup (Pending)

Nightly cron entry:
```
0 7 * * * /root/.openclaw/workspace/scripts/auto_backup.sh >> /var/log/eleanor-backup.log 2>&1
```

**Status:** Script ready, cron activation pending system approval
