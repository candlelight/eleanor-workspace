# Daily Briefing Automation Setup

**Notion Page ID:** 31e98b602fba80168b18f21ccc60d194  
**Delivery Time:** 8:00 AM PST daily  
**Email:** efox@agentmail.to → rphillippi@gmail.com  

---

## Page Structure (Per Instructions)

### Header
- Title format: *Vol. I | [Day], [Month] [Date], [Year] | 8:00 AM PST*
- Date updates daily

### Sections

#### 1. Personal Context (Daily)
- **Weather:** Current conditions + forecast (°F), practical note
- **Calendar:** Today's events from Google Calendar
- **Flagged emails:** Urgent/starred emails summary

#### 2. Financial & Markets (Daily)
- Market snapshot table: S&P 500, NASDAQ, Gold, BTC, 10Y Treasury
- Congress trading: Capitol Trades disclosures
- Gold & stocks: ChartSchool technical signals
- Crypto signals: Brief technical snapshot
- Portfolio notes: Placeholder

#### 3. Headlines & News (Daily)
Sources (2-3 headlines each):
1. Financial Times
2. Reuters
3. NY Times
4. BBC
5. The Guardian
6. The Atlantic

Format: **SOURCE** | [Headline](url) + 1-2 sentence AI summary

#### 4. Tech & AI (Daily)
Sources:
1. Wired
2. TechCrunch
3. The Verge
4. AI developments

#### 5. Below the Fold (Toggle Sections - Daily)
- Design & UX (toggle)
- Surface pattern & textile design (toggle)
- Graphic design & merch (toggle)
- Film & screenwriting (toggle)

#### 6. Film Grants & Opportunities (Mondays only)
- Table: Organisation | Deadline | Notes
- Sources: WIFV, Film Independent, Sundance, Screencraft, etc.
- Non-Monday: "Published Mondays only. Next update: Monday." (collapsed)

#### 7. Job Opportunities (Wednesdays only)
- Table: Role | Company | Location | Notes
- Target: Systems Strategist, Service Design, Design Ops, UX Leadership
- Regions: EU, UK, US
- Non-Wednesday: "Published Wednesdays only. Next update: Wednesday." (collapsed)

---

## Color Coding

- Financial & markets: **Blue** background
- Headlines & news: **Blue** background
- Tech & AI: **Blue** background
- Film grants: **Purple** background (Mondays)
- Job opportunities: **Green** background (Wednesdays)
- Below the fold: Default

---

## Technical Implementation Notes

### Data Sources Needed

1. **Weather API:** OpenWeatherMap or similar (need API key)
2. **Calendar API:** Google Calendar API (OAuth already done)
3. **Gmail API:** For flagged emails (OAuth already done)
4. **Market Data:** Finnhub or Alpha Vantage (need API key)
5. **Congress Trading:** Capitol Trades website scraping
6. **News Sources:** RSS feeds or web scraping
7. **Job Boards:** LinkedIn, Indeed, etc. (scraping)

### Notion API Requirements

- Update page content daily
- Maintain structure (headers, toggles, tables)
- Handle color-coded backgrounds
- Create toggle blocks for collapsible sections

### Error Handling

- Unreachable source: Skip and note at bottom
- API failures: "Data unavailable. Check manually."
- Delayed market data: Note timestamp
- Never hallucinate data

---

## Current Status

⏳ **Pending:** Notion API integration setup  
⏳ **Pending:** Data source API keys  
⏳ **Pending:** Subagent creation for daily scraping  

---

## Created Files

1. `daily_briefing_content.md` - Source content structure
2. `daily_briefing_automation.md` - This file
3. `tiktok_progress.md` - TikTok scraping tracker

---

*Last Updated: March 16, 2026*
