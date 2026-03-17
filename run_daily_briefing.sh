#!/bin/bash
# Daily Briefing Master Script
# This script is called by the main agent when a trigger is detected

WORKSPACE="/root/.openclaw/workspace"
DATE=$(date +"%Y-%m-%d")
DAY=$(date +"%A")
NOTION_TOKEN="${NOTION_TOKEN:-}"  # Set via environment variable
PAGE_ID="a5498b602fba82a7a7ab810b69d42258"

echo "=== Daily Briefing for $DATE ($DAY) ==="
echo ""

# Check if briefing data already exists
if [ -f "$WORKSPACE/briefing_data_$DATE.json" ]; then
    echo "Briefing data already exists for $DATE"
    echo "File: $WORKSPACE/briefing_data_$DATE.json"
    exit 0
fi

echo "Step 1: Data collection needs to be done by subagent"
echo "Step 2: Notion update needs to be done after data is collected"
echo ""
echo "To complete this briefing:"
echo "1. Spawn subagent with the task from daily_briefing_task_template.txt"
echo "2. Wait for subagent to return JSON data"
echo "3. Run update_notion_briefing.sh to push to Notion"
echo "4. Clean up trigger file"
