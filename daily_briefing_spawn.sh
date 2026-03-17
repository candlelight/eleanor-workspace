#!/bin/bash
# Daily Briefing Data Collection - Subagent Task
# This script spawns a subagent to collect all briefing data

WORKSPACE="/root/.openclaw/workspace"
DATE=$(date +"%Y-%m-%d")
DAY=$(date +"%A")

echo "Starting daily briefing data collection for $DATE"

# Spawn subagent with complete task
cat > /tmp/briefing_task.txt << 'TASKEOF'
You are a daily briefing data collector. Gather information from these sources and return structured JSON.

**REQUIRED DATA:**

1. **WEATHER** (Los Angeles, CA):
   - Current conditions, high/low (°F), brief forecast
   - Source: wttr.in or Open-Meteo

2. **MARKETS**:
   - S&P 500, NASDAQ, Gold, Bitcoin, 10Y Treasury
   - Source: Yahoo Finance, CoinGecko

3. **CONGRESS TRADING**:
   - 3-5 notable trades from Capitol Trades
   - Source: capitoltrades.com or Quiver Quantitative

4. **HEADLINES** (1-2 per source, diverse topics):
   - Reuters, NY Times, BBC, The Guardian
   - Avoid duplication (e.g., if Iran story on Reuters, pick different topic for others)

5. **TECH & AI** (1-2 items):
   - Wired, TechCrunch, The Verge

6. **BELOW THE FOLD SOURCES:**
   - Design & UX: Core77, Dezeen
   - Surface Pattern & Textile: Spoonflower, Patternbank
   - Graphic Design & Merch: Communication Arts, It's Nice That, Creative Review
   - Film & Screenwriting: Variety, Hollywood Reporter, Screencraft

**OUTPUT FORMAT:**
Return JSON with:
{
  "date": "YYYY-MM-DD",
  "weather": {...},
  "markets": {...},
  "congress_trading": [...],
  "headlines": {"reuters": [...], "nytimes": [...], "bbc": [...], "guardian": [...]},
  "tech_ai": [...],
  "below_the_fold": {
    "design_ux": [...],
    "textile_pattern": [...],
    "graphic_design": [...],
    "film_screenwriting": [...]
  },
  "errors": [...]
}

**RULES:**
- Use web_search and web_fetch tools
- Be fast but thorough (120 seconds max)
- Return only JSON, no commentary
- If source fails, note in errors array
- Curate headlines for variety - don't repeat same story across sources
TASKEOF

# Note: This script is called by the main agent via sessions_spawn tool
# It should not be run directly from cron
# The cron job should trigger the main agent to run this task

echo "Daily briefing task ready for $DATE"
echo "Task file created at /tmp/briefing_task.txt"
echo "Have the main agent run: sessions_spawn with this task"
