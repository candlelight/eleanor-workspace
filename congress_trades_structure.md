# Congress Trades Tab Structure

## Tab Name: Congress Trades

## Columns:

| Column | Header | Description | Formula/Notes |
|--------|--------|-------------|---------------|
| A | Date Reported | Date the trade was reported (45-day delay) | Manual entry from Capitol Trades |
| B | Senator | Name of senator who made the trade | Manual entry |
| C | Party | D or R | Manual entry |
| D | State | Senator's state | Manual entry |
| E | Ticker | Stock ticker symbol | Manual entry |
| F | Company Name | Full company name | Manual entry |
| G | Transaction Type | Buy / Sell / Sale (Partial) / Sale (Full) | Manual entry |
| H | Amount Range | $1,001-$15,000 / $15,001-$50,000 / etc | Manual entry |
| I | Shares | Number of shares (if disclosed) | Manual entry |
| J | Sector | Tech / Healthcare / Energy / Finance / etc | Manual entry |
| K | Our Action | TRACK / PAPER TRADE / SKIP / ETHICAL EXCLUDE | Manual decision |
| L | Paper Trade Date | Date we entered paper trade | Auto when K=PAPER TRADE |
| M | Entry Price | Price when we paper traded | Manual entry |
| N | Position Size | $ amount of paper trade (suggest $1000-5000) | Manual entry |
| O | Current Price | Latest price (can link to Stock Analyzer) | Formula or manual |
| P | P&L $ | Current P&L in dollars | =O-M * shares |
| Q | P&L % | Current P&L percentage | =P/N |
| R | Notes | Why we tracked/skipped | Manual entry |
| S | Data Source | Capitol Trades / Senate Disclosure / etc | Manual entry |

## Paper Trade Summary Section (Top of sheet, rows 1-10)

Row 1: "📊 CONGRESS TRADING EXPERIMENT - PAPER PORTFOLIO"
Row 2: (blank)
Row 3: "Portfolio Value:" | =SUM(N:N) + SUM(P:P) | "Starting Value:" | =SUM(N:N)
Row 4: "Total P&L $:" | =SUM(P:P) | "Total P&L %:" | =SUM(P:P)/SUM(N:N)
Row 5: "Active Positions:" | =COUNTIF(K:K,"PAPER TRADE") | "Tracked Senators:" | =COUNTUNIQUE(B:B)
Row 6: "Last Updated:" | =NOW() | | 
Row 7: (blank)
Row 8: "ETHICAL EXCLUSIONS APPLIED:"
Row 9: "❌ Private Prisons | ❌ Weapons/Defense | ❌ Tobacco | ❌ Big Oil"

## Data Starts Row 11

## Conditional Formatting:
- P&L % (Column Q): Green if >0, Red if <0
- Our Action (Column K): Yellow highlight for "PAPER TRADE"

## Filters:
- By Senator
- By Sector
- By Transaction Type
- By Our Action
