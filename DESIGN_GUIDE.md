# 🎨 Business Insight 360 — Dashboard Design Guide

> **Detailed page-by-page redesign specifications, layout blueprints, and step-by-step instructions for transforming the draft dashboard into a premium, production-ready analytics experience.**

---

## 📏 Canvas & Global Settings

| Setting | Value |
|---------|-------|
| Canvas Size | 1280 × 720 px (16:9) |
| Page Background | `#0F0F23` at 0% transparency |
| Wallpaper | `#0F0F23` at 0% transparency |
| Default Font | Segoe UI |
| Theme File | `BusinessInsight360_Theme.json` |

---

## 🏠 Page 1: Home (Landing Page)

### Layout Blueprint

```
┌──────────────────────────────────────────────────────────────────┐
│                                                                  │
│     [AtliQ Logo]   Business Insight 360                 [Info]   │  Y: 20-100
│                 360° Business Performance Analytics              │
│                                                                  │
├──────────────────┬──────────────────┬────────────────────────────┤
│                  │                  │                            │
│   💰 Finance     │   📈 Sales       │   📣 Marketing            │  Y: 140-360
│     View         │     View         │     View                  │
│                  │                  │                            │
│  Analyze P&L,    │  Track customer  │  Evaluate segment         │
│  revenue, margins│  & product       │  performance & ROI        │
│                  │  performance     │                            │
├──────────────────┼──────────────────┼────────────────────────────┤
│                  │                  │                            │
│   🔗 Supply      │   👔 Executive   │   ℹ️ Info /               │  Y: 380-600
│     Chain        │     View         │     Support               │
│                  │                  │                            │
│  Forecast        │  High-level KPI  │  Documentation,           │
│  accuracy & risk │  overview for    │  glossary, contact        │
│                  │  C-suite         │                            │
└──────────────────┴──────────────────┴────────────────────────────┘
│  Last Refreshed: [DateTime]                          v1.0  │      Y: 640-680
└──────────────────────────────────────────────────────────────────┘
```

### Step-by-Step

1. **Background**: Set canvas to `#0F0F23`
2. **Title Section** (Y: 20–100):
   - Add a **text box**: "Business Insight 360"
   - Font: Segoe UI Semibold, 36pt, White
   - Subtitle: "360° Business Performance Analytics" — 14pt, `#A0A0C0`
   - Add AtliQ logo image (top-left, 60×60px)
3. **Navigation Tiles** (6 tiles in 2×3 grid):
   - Tile size: ~380×200px each with 16px gaps
   - Each tile = **Blank Button** visual
   - Background: `#1B1B3A`
   - Border: 1px solid `#2D2D5E`, radius 8px
   - **Hover State**: Background → `#2D2D5E`, Border → `#00BFA6`
   - **Action**: Type = Page Navigation, Destination = target page
   - **Icon**: Add emoji or imported SVG icon at top of each tile
   - **Title**: 14pt, Segoe UI Semibold, White
   - **Description**: 10pt, Segoe UI, `#A0A0C0`
4. **Footer**: Text box with "Last Refreshed: " + `NOW()` measure, 9pt, `#A0A0C0`

---

## 💰 Page 2: Finance View

### Layout Blueprint

```
┌──────────────────────────────────────────────────────────────────┐
│ [🏠] [Finance●] [Sales] [Marketing] [Supply Chain] [Executive]  │  H: 45px
│  ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔  │
├─────────┬──────────────────────────────────────┬─────────────────┤
│         │  Slicers: [FY▼] [Quarter▼] [YTD▼]   │                 │
│         │  [Region▼] [Market▼] [Segment▼]      │                 │  H: 35px
├─────────┼──────────────────────────────────────┼─────────────────┤
│         │                                      │                 │
│ Net     │     P&L TREND (Area Chart)           │   SEGMENT       │
│ Sales   │                                      │   BREAKDOWN     │
│ $3.74B  │   ── Revenue  ── COGS  ── Expenses   │   (Donut)       │  H: 270px
│ ▲+5.2%  │                                      │                 │
│─────────│                                      │    $3.74B       │
│ GM%     │                                      │   ● Peripherals │
│ 38.08%  │                                      │   ● PC          │
│ ▲+0.8pts│                                      │   ● N&S         │
│─────────┼──────────────────────────────────────┼─────────────────┤
│ NP%     │     P&L STATEMENT DETAIL (Matrix)    │                 │
│ 2.31%   │                                      │                 │
│ ▼-0.3pts│  Name  │ Actual │ LY  │ Var$ │ Var%  │                 │  H: 280px
│         │  Revenue│ $3.7B │$3.2B│+$500M│+15.6%│                 │
│         │  COGS  │$2.3B  │$2.0B│-$300M│+15.0%│                 │
│         │  GM    │$1.4B  │$1.2B│+$200M│+16.7%│                 │
│         │  OpEx  │$520M  │$480M│-$40M │+8.3% │                 │
│         │  NP    │$880M  │$720M│+$160M│+22.2%│                 │
└─────────┴──────────────────────────────────────┴─────────────────┘
 W: 180px              W: 770px                    W: 290px
```

### Key Design Specifications

| Element | Properties |
|---------|-----------|
| **Nav Bar** | Rectangle: `#12122A` fill, full width × 45px height. Active tab underlined with `#00BFA6` |
| **KPI Cards** | Background: `#1B1B3A`, Border: `#2D2D5E`, Padding: 12px |
| **KPI Value** | 28pt Segoe UI Semibold, White |
| **KPI Label** | 10pt Segoe UI, `#A0A0C0` |
| **Variance Badge** | Positive: `#00BFA6` text with ▲ | Negative: `#FF6B6B` text with ▼ |
| **Area Chart** | Lines: Teal/Gold/Coral, Area fill: 20% opacity |
| **Donut Chart** | Inner radius: 60%, Center label: Total Net Sales in White |
| **P&L Table** | Column headers: `#00BFA6` on `#12122A`, Alt row: `#161633` |
| **Var $ Column** | Conditional format: Teal (positive), Coral (negative) |
| **Var % Column** | Conditional format: Teal (positive), Coral (negative) |

### Slicers Configuration

| Slicer | Type | Position |
|--------|------|----------|
| Fiscal Year | Dropdown | Top row |
| Quarter | Dropdown | Top row |
| YTD/YTG | Button slicer | Top row |
| Region | Dropdown | Top row |
| Market | Dropdown | Top row |
| Segment | Dropdown | Top row |

---

## 📈 Page 3: Sales View

### Layout Blueprint

```
┌──────────────────────────────────────────────────────────────────┐
│ [🏠] [Finance] [Sales●] [Marketing] [Supply Chain] [Executive]  │  H: 45px
├─────────┬────────────────────────────────────────────────────────┤
│ FILTERS │    KPI: Net Sales    │  Gross Margin %  │  Total COGS │
│         │    $14.2M ▲+8.5%    │   34.8% ▲+1.2pts │  $9.26M     │  H: 80px
├─────────┼──────────────────────────────────┬─────────────────────┤
│ Date    │                                  │    PRODUCT          │
│ Range   │    CUSTOMER PERFORMANCE          │    PERFORMANCE      │
│ [===]   │    (Scatter Plot)                │    Top 10 by NS     │  H: 300px
│         │                                  │    (Bar Chart)      │
│ Region  │    X: Net Sales                  │                     │
│ [All ▼] │    Y: Gross Margin %             │    █████ Prod 1     │
│         │    Size: Units Sold              │    ████  Prod 2     │
│ Product │                                  │    ███   Prod 3     │
│ [All ▼] │    ● ● ●  ●                    │    ██    Prod 4     │
│         │       ●  ●   ● ●               │    █     Prod 5     │
├─────────┼──────────────────────────────────┴─────────────────────┤
│         │    PERFORMANCE TABLE (Matrix)                          │
│ Region  │                                                        │
│ Filter  │    Customer │ Category │ Net Sales │ GM% │ Units │ Δ%  │  H: 250px
│ □ All   │    Cust A   │ HDD     │ $14.2M ██│34.8%│ 110  │+18% │
│ □ APAC  │    Cust B   │ Mouse   │ $12.6M █ │33.6%│  90  │+3%  │
│ □ EU    │    ...      │ ...     │ ...      │ ... │ ...  │ ... │
│ □ NA    │                                                        │
└─────────┴────────────────────────────────────────────────────────┘
  W: 160px                        W: 1080px
```

### Design Specifications

- **Left filter panel**: Width 160px, Background `#1B1B3A`, separated by 1px `#2D2D5E` border
- **Scatter plot**: Bubble color by segment, X/Y axis labels in `#A0A0C0`, gridlines `#2D2D5E`
- **Bar chart**: Horizontal bars in Teal, category labels on left in `#E8E8F0`
- **Performance table**: Data bars in Teal for Net Sales column, conditional formatting on Growth %

---

## 📣 Page 4: Marketing View

### Layout Blueprint

```
┌──────────────────────────────────────────────────────────────────┐
│ [🏠] [Finance] [Sales] [Marketing●] [Supply Chain] [Executive]  │  H: 45px
├──────────────────────────────────────────────────────────────────┤
│  KPI1: NS    │ KPI2: GM%  │ KPI3: NP%  │ KPI4: Mkt  │ KPI5     │
│  $42.1M      │ 38.5%      │ 14.2%      │ Spend      │ ROI      │  H: 70px
│  +7.2% MoM   │ +1.1 pts   │ -0.5 pts   │ $2.8M      │ 14.0x    │
├─────────────┬──────────────┬─────────────────────────────────────┤
│ VIEW TOGGLE │              │                                     │
│ [GM%][NP%]  │              │                                     │
├─────────────┼──────────────┼─────────────────────────────────────┤
│ WATERFALL   │  SCATTER:    │     DONUT:                          │
│ Performance │  Segment     │     Region/Market                   │
│ Breakdown   │  Analysis    │     Contribution                    │  H: 280px
│ by Product  │  (NS vs GM%) │                                     │
│             │              │     ● APAC 45%                      │
│ ██ ██ ██ ██│  ●  ●       │     ● EU   30%                      │
│    ██    ██│    ● ●       │     ● LATAM 15%                     │
│             │       ●      │     ● NA   10%                      │
├─────────────┴──────────────┴─────────────────────────────────────┤
│  PERFORMANCE MATRIX                                              │
│                                                                  │  H: 230px
│  Division │ Segment │ Category │ Net Sales │ GM% │ NP% │ ROI    │
│  P&A      │ Periph  │ HDD     │ $42.1M ██│38.5%│10.2%│ $2.80  │
│  PC       │ Notebook│ Laptop  │ $18.0M █ │49.5%│-0.5%│ 14.0x  │
│  N&S      │ Network │ Router  │ $2.8M    │39.2%│-0.5%│ $185   │
└──────────────────────────────────────────────────────────────────┘
```

### Toggle Button Setup

1. Create a **disconnected table** named "Metric" with values: "Gross Margin %", "Net Profit %"
2. Add a **Slicer** using `Metric[Metric]` field, styled as buttons
3. Button style: Active = `#00BFA6` fill, Inactive = `#2D2D5E` fill
4. Use `Selected Metric` DAX measure in visuals that switch

---

## 🔗 Page 5: Supply Chain View

### Layout Blueprint

```
┌──────────────────────────────────────────────────────────────────┐
│ [🏠] [Finance] [Sales] [Marketing] [Supply Chain●] [Executive]  │  H: 45px
├──────────────────────────────────────────────────────────────────┤
│ Slicers: [FY▼] [Quarter▼] [Customer▼] [Segment▼]               │  H: 35px
├───────────────┬───────────────┬──────────────┬───────────────────┤
│  FA%          │  NET ERROR    │  ABS ERROR   │  RISK METRICS     │
│  78.5% ▲      │  +2,350 units │  4.1K units  │  3 High Risks     │  H: 85px
│  🎯 Target:80% │              │              │  🔴🟡🟢           │
├───────────────┼───────────────┴──────────────┼───────────────────┤
│  GAUGE:       │  FORECAST ACCURACY TREND     │ MATRIX: Accuracy  │
│  Current      │  (Line Chart)                │ by Segment &      │
│  Month FA%    │                              │ Category           │  H: 250px
│               │  ── Forecast ── Target       │                   │
│   [78.5%]     │                              │ Seg │ Cat │ FA%   │
│  ┌────────┐   │  ─────────────────────       │ Per │ HDD │ 82%  │
│  │  ◠     │   │  90 ─                ─       │ Per │ SSD │ 76%  │
│  │ /    \  │   │  80 ─  ─────────    ─       │ PC  │ Lap │ 71%  │
│  └────────┘   │  70 ─                ─       │ N&S │ Rtr │ 80%  │
│               │     J F M A M J J A S O N D  │                   │
├───────────────┼──────────────────────────────┼───────────────────┤
│  GAUGE:       │  EXCESS/OOS INVENTORY        │  RISK ANALYSIS    │
│  Target vs    │  (Waterfall Chart)           │  (Conditional)    │
│  Actual       │                              │                   │  H: 220px
│               │  ██ ██   ██                  │  🔴 Supplier Delay│
│   [12.5%]     │     ██ ██   ██ ██            │  🟡 Demand Spike  │
│               │                              │  🟢 Demand Low    │
└───────────────┴──────────────────────────────┴───────────────────┘
```

### Gauge Chart Settings

- **Fill**: Gradient from `#FF6B6B` (0%) → `#F59E0B` (60%) → `#00BFA6` (100%)
- **Target line**: `#FFD700`, dashed, at 80%
- **Callout value**: 22pt, White
- **Axis labels**: `#A0A0C0`

### Risk Conditional Formatting

| Risk Level | Color | Condition |
|-----------|-------|-----------|
| High Risk | `#FF6B6B` (🔴) | FA% < 60% or Net Error > 50% of forecast |
| Medium Risk | `#F59E0B` (🟡) | FA% 60-75% or Net Error 25-50% |
| Low Risk | `#00BFA6` (🟢) | FA% > 75% and Net Error < 25% |

---

## 👔 Page 6: Executive View

### Layout Blueprint

```
┌──────────────────────────────────────────────────────────────────┐
│ [🏠] [Finance] [Sales] [Marketing] [Supply Chain] [Executive●]  │  H: 45px
├──────────────────────────────────────────────────────────────────┤
│ Slicers: [Time: YTD▼] [Region▼] [Product▼] [Currency▼]          │  H: 35px
├────────────────┬────────────────┬──────────────┬─────────────────┤
│  1. REVENUE    │ 2. GROSS       │ 3. NET       │ 4. FORECAST     │
│  $18.4M        │    MARGIN      │    PROFIT    │    ACCURACY     │  H: 90px
│  ▲12.9% vs LY  │    44.5%       │    $5.2M     │    91.2%        │
│  Target: $20M  │    ▲2.8pts     │    ▲15.1%    │    ▲3.3pts     │
├────────────────┴────────────────┼──────────────┴─────────────────┤
│                                 │                                │
│  REVENUE BY REGION              │  MARKET SHARE TREND            │
│  (Map / Filled Map)             │  (Ribbon / Area Chart)         │
│                                 │                                │  H: 250px
│  ○ NA: $7.2M                    │  ████████ Company              │
│  ○ EU: $5.1M                    │  ░░░░░░ Comp A                 │
│  ○ APAC: $4.0M                  │  ▒▒▒▒ Comp B                   │
│  ○ LATAM: $1.3M                 │                                │
│  ○ MEA: $0.8M                   │  Q1   Q2   Q3   Q4            │
├────────────────┬────────────────┼────────────────┬───────────────┤
│ REVENUE BY     │                │ TOP 5 PRODUCTS │ TOP 5 CUST    │
│ DIVISION &     │                │ ████ Prod X    │ ████ Cust A   │  H: 250px
│ SEGMENT        │                │ ███  Prod Y    │ ███  Cust B   │
│ (Treemap)      │                │ ██   Prod Z    │ ██   Cust C   │
│                │                ├────────────────┼───────────────┤
│ ┌──────┬──────┐│                │ BOTTOM 5 PROD  │ BOTTOM 5 CUST │
│ │ P&A  │ PC   ││                │ ████ Prod U    │ ████ Cust F   │
│ │ 32%  │ 28%  ││                │ ███  Prod T    │ ███  Cust G   │
│ └──────┴──────┘│                │ ██   Prod S    │ ██   Cust H   │
└────────────────┴────────────────┴────────────────┴───────────────┘
```

### KPI Card Enhanced Styling

Each of the 4 KPI cards should include:
1. **Icon** (top-right corner): Relevant Unicode or imported icon
2. **Metric name**: 10pt, `#A0A0C0`
3. **Value**: 28pt, White, Segoe UI Semibold
4. **LY comparison**: 10pt, showing change with Teal ▲ or Coral ▼
5. **Target**: 9pt, `#A0A0C0`, "Target: $X"
6. **Mini sparkline**: Small trend line below the value (if supported)

---

## 🔄 Navigation Bar (Reusable Across All Pages)

### Construction Steps

1. **Rectangle shape**: Full width (1280px) × 45px, Fill: `#12122A`, No border
2. **Home icon button** (left): 🏠 icon, 14pt, action → Home page
3. **View buttons** (centered):
   - Text: "Finance", "Sales", "Marketing", "Supply Chain", "Executive"
   - Font: 11pt Segoe UI, color: `#A0A0C0` (inactive), `#FFFFFF` (active)
   - **Active indicator**: 2px line below in `#00BFA6` (use a thin rectangle shape)
   - Action: Page Navigation → respective page
4. **Group all elements** → Copy → Paste to all pages → Update active state per page

### Quick Duplicate Method

1. Select all nav bar elements → **Ctrl+G** to group
2. **Ctrl+C** → Navigate to next page → **Ctrl+V**
3. Update the active tab's color and underline for each page

---

## 📋 Conditional Formatting Rules

### Standard Color Rules (Apply Consistently)

| Scenario | Color | Hex |
|----------|-------|-----|
| Positive variance / growth | Teal | `#00BFA6` |
| Negative variance / decline | Coral | `#FF6B6B` |
| Neutral / target met | Amber | `#F59E0B` |
| Table totals / subtotals | Gold | `#FFD700` |
| Highlighted / selected | White | `#FFFFFF` |
| De-emphasized | Muted Lavender | `#A0A0C0` |

### Data Bar Settings (for table columns)

- Positive fill: `#00BFA6` at 40% opacity
- Negative fill: `#FF6B6B` at 40% opacity
- Bar direction: Left to right
- Axis: On

### Icon Sets (for status columns)

- ✅ (`#00BFA6`): Value ≥ target
- ⚠️ (`#F59E0B`): Value within 5% of target
- ❌ (`#FF6B6B`): Value > 5% below target

---

## 🧰 Custom Tooltips

### Creating Tooltip Pages

1. **New page** → Format → Page size → Tooltip (320×240px)
2. Background: `#1B1B3A`, Border: `#2D2D5E`
3. Content: 2-3 KPIs relevant to the hover context
4. Assign as tooltip on target visuals via Format → Tooltip → Page → [tooltip page name]

### Suggested Tooltip Pages

| Tooltip Name | Content | Used On |
|-------------|---------|---------|
| Customer Detail | NS, GM%, Units, LY comparison | Scatter plots, tables |
| Product Detail | NS, GM%, Manufacturing Cost, Category | Bar charts, tables |
| Region Detail | NS, GM%, FA%, Top 3 products | Maps |

---

## ⚡ Performance Optimization Tips

1. **Use SUMMARIZE instead of ADDCOLUMNS** where possible
2. **Avoid CALCULATE wrapping simple aggregations** — use direct SUM/AVERAGE
3. **Pre-aggregate in Power Query** for frequently used combinations
4. **Limit visual interactions** — disable cross-filtering on dense pages
5. **Use variables in DAX** — compute once, reference multiple times:
   ```dax
   Optimized GM% = 
   VAR _NS = [Net Sales]
   VAR _COGS = [Total COGS]
   RETURN DIVIDE(_NS - _COGS, _NS, 0)
   ```
6. **Reduce cardinality** — remove unused columns in Power Query
7. **Run Performance Analyzer** regularly: View → Performance Analyzer → Start Recording

---

## ✅ Pre-Publication Checklist

- [ ] Theme applied and consistent across all 6 pages
- [ ] Navigation bar functional on every page
- [ ] All KPI values verified against source data
- [ ] Slicers filter correctly and cross-filter appropriately
- [ ] Conditional formatting applied to all variance columns
- [ ] Tooltips display correctly on hover
- [ ] Drill-through pages configured (Executive → Detail views)
- [ ] Bookmarks created for toggle states (GM%/NP% in Marketing)
- [ ] Mobile layout created for at least the Executive view
- [ ] Row-Level Security (RLS) configured if needed
- [ ] File size optimized (remove unused data, compress images)
- [ ] README.md is up to date with final screenshots

---

*This design guide accompanies the `BusinessInsight360_Theme.json` theme file and the `README.md` project documentation.*
