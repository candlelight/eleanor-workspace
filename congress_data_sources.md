# Congress Trading Data Sources - Research

## ✅ FREE OPTIONS

### 1. Capitol Trades (capitoltrades.com)
- **Cost:** FREE (web access)
- **API:** No official API, but scrapable
- **Data:** Senator trades, 45-day delayed
- **Fields:** Date, Senator, Ticker, Transaction Type, Amount Range
- **Limitations:** 3 years historical data only
- **Scraping:** Apify has a scraper ($5/month) or we can build our own
- **Verdict:** ✅ Best free option for manual tracking

### 2. Finnhub.io - Congressional Trading API
- **Cost:** FREE tier available
- **API:** Yes, REST API
- **Free Limits:** 60 calls/minute
- **Data:** Senate and House trades
- **Fields:** Date, name, ticker, transaction type, amount
- **Verdict:** ✅ Best for automation (API-first)

### 3. Senate Stock Watcher (senatestockwatcher.com)
- **Cost:** FREE
- **API:** No, but downloadable CSVs
- **Data:** Senate trades only
- **Format:** CSV exports available
- **Verdict:** ✅ Good for bulk historical data

### 4. Financial Modeling Prep (fmp.io)
- **Cost:** Free tier = 250 calls/day
- **API:** Yes
- **Endpoint:** /senate-trading
- **Data:** Senate disclosure data
- **Verdict:** ✅ Good API option, limited free tier

### 5. Quiver Quantitative
- **Cost:** Free tier available
- **API:** Yes
- **Data:** Congress trades + other alternative data
- **Verdict:** Worth exploring

---

## 🔶 PAID OPTIONS (Future)

### 1. Capitol Trades API (2iQ Research)
- **Cost:** Contact for pricing (~$500+/month typically)
- **API:** Yes, official
- **Verdict:** Too expensive for now

### 2. Unusual Whales
- **Cost:** $35/month
- **Data:** Congress + options flow
- **Verdict:** Good value if we expand to options

---

## 🎯 RECOMMENDATION

**Phase 1 (Now - Paper Trading):**
Use **Finnhub free tier** for automated data pulls + **Capitol Trades website** for manual verification

**Phase 2 (If profitable):**
Consider Unusual Whales ($35/month) for richer data

---

## 📋 FINNHUB API DETAILS

**Base URL:** https://finnhub.io/api/v1

**Endpoint:** GET /congressional-trading

**Parameters:**
- token (API key)
- from (YYYY-MM-DD)
- to (YYYY-MM-DD)

**Sample Response:**
```json
{
  "data": [
    {
      "date": "2025-01-15",
      "name": "Nancy Pelosi",
      "ticker": "AAPL",
      "transactionType": "Purchase",
      "amount": "1001-15000"
    }
  ]
}
```

**Free Tier Limits:**
- 60 calls/minute
- No daily limit mentioned
- Real-time data (same 45-day delay as source)

---

## NEXT STEPS

1. ✅ Sign up for Finnhub free API key
2. Test API with sample request
3. Build data ingestion to Google Sheets
4. Set up daily/weekly auto-pull
