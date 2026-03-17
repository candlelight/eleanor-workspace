# TikTok Travel Scraper Setup

## What I Built

A script that scrapes TikTok profile videos and extracts travel-related content using APIFY.

## How to Use

```bash
# Run the scraper with your TikTok username
./scripts/tiktok_travel_scraper.sh catmihos
```

## What It Does

1. **Scrapes your TikTok profile** using APIFY's TikTok Profile Scraper
2. **Downloads all video data** (captions, hashtags, music, URLs)
3. **Filters for travel content** using keyword matching:
   - travel, trip, vacation, holiday, destination
   - hotel, resort, airbnb, flight, airport
   - beach, mountain, city, tour, guide
   - explore, adventure, wanderlust, backpacking
   - cruise, road trip, getaway, itinerary
   - And more...

4. **Outputs two files:**
   - `tiktok_travel_<username>.json` — Full structured data
   - `tiktok_travel_summary_<username>.txt` — Human-readable summary

## Important Note

**APIFY's scraper works on public profiles and videos.** It cannot access:
- Private favorites/liked videos
- Private accounts
- "Liked" videos tab (TikTok restricts this)

If your favorites are public, the scraper will find travel content from your posted videos.

## Alternative: Direct Favorites Access

If you need your actual "favorited" videos (not just posted content), TikTok doesn't provide API access to this. Options:

1. **Manual export** from TikTok app (Settings → Download data)
2. **Browser extension** to scrape your favorites page
3. **Share favorites** with me as a list of URLs

## Files Created

- `scripts/tiktok_travel_scraper.sh` — Main scraper script
- `docs/TIKTOK_SCRAPER.md` — This documentation

## Next Steps

1. Run the script with your TikTok username
2. Upload the output files here
3. I'll build your travel list from the results
