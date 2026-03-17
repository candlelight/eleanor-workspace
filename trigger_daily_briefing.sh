#!/bin/bash
# Daily Briefing Trigger
# This file is touched by cron to signal the main agent to run the briefing

DATE=$(date +"%Y-%m-%d")
TRIGGER_FILE="/root/.openclaw/workspace/.run_daily_briefing_$DATE"

# Create trigger file
touch "$TRIGGER_FILE"

echo "Daily briefing triggered for $DATE"
echo "Trigger file: $TRIGGER_FILE"
