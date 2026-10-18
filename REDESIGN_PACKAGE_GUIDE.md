# 🚀 AtliQ Hardware — Business Insight 360: Dashboard Redesign Package

> **Enterprise-Grade Power BI Redesign Package for `Business_Insight__360.pbix` with Official AtliQ Hardware Branding, Custom 1920×1080 Dark Canvas Wallpapers, Theme JSON, and Interactive React Web Showcase.**

---

## 📦 What's Inside This Redesign Package

| Item | File / Path | Description |
| :--- | :--- | :--- |
| **Redesigned PBIX File** | [`Business_Insight__360_Redesigned.pbix`](file:///c:/Portfolio%20Website/Business%20Insight%20360/Business_Insight__360_Redesigned.pbix) | Enhanced Power BI file with custom AtliQ theme built-in, uncompressed DataModel storage, and calibrated metadata. |
| **Original PBIX File** | [`Business_Insight__360.pbix`](file:///c:/Portfolio%20Website/Business%20Insight%20360/Business_Insight__360.pbix) | Untouched draft backup (307 MB). |
| **Official AtliQ Logo (Master)** | [`assets/atliq_logo.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets/atliq_logo.png) | 1024×1002 High-Resolution 32-bit Transparent PNG with official brand chevron & arc. |
| **AtliQ Logo Header Badge** | [`assets/atliq_logo_badge.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets/atliq_logo_badge.png) | 500×120 Transparent PNG badge combining the circular emblem and brand typography. |
| **Power BI Dark Theme** | [`AtliQ_Business_Insight_360_Theme.json`](file:///c:/Portfolio%20Website/Business%20Insight%20360/AtliQ_Business_Insight_360_Theme.json) | Complete theme file with AtliQ brand colors (`#FF5722`, `#00D2B4`, `#2979FF`), dark surface styles (`#131B2E`), and card rounded corners. |
| **Full HD Canvas Wallpapers** | [`assets/wallpaper_*.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets) | 6 Pixel-perfect 1920×1080 canvas backgrounds with AtliQ logo embedded in headers & slot card containers. |
| **Interactive React Showcase** | [`redesign-showcase/index.html`](file:///c:/Portfolio%20Website/Business%20Insight%20360/redesign-showcase/index.html) | Standalone interactive React 18 web dashboard with live tabs, chart animations, and P&L table. |

---

## 🎨 Where the AtliQ Hardware Logo is Applied

The AtliQ Hardware logo provided has been strategically integrated across all layers of the dashboard:

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│  [AtliQ Logo]  AtliQ Hardware | Business Insight 360      [Home] [Finance] [Sales] [Market] ...  │  Y: 16-106
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```

1. **Header Navigation Bar on All 6 Pages**:
   - The logo is embedded at `X: 42, Y: 24, W: 74, H: 74` directly into the 1920×1080 canvas wallpaper templates.
   - It sits adjacent to the bold title **"AtliQ Hardware"** (`#FF5722`) and **"Business Insight 360"** (`#F8FAFC`).
2. **Landing Page (Home View)**:
   - A large 200×200px master emblem is featured inside the hero banner next to the executive summary.
3. **Manual Insertion in Power BI Desktop (Optional Standalone Visual)**:
   - If you want the logo to be an interactive button (e.g. clicking returns to Home page):
     - In Power BI Desktop: Click **Insert** → **Image** → select [`assets/atliq_logo.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets/atliq_logo.png).
     - Set Position: `X: 42, Y: 24, Width: 74, Height: 74`.
     - In Format Image: Under **Action**, set **Type** = `Page navigation`, **Destination** = `Home`.
4. **Interactive React Web App**:
   - Present in the sticky executive navigation bar and footer signature.

---

## 🖼️ Canvas Wallpapers Inventory (1920 × 1080 Full HD)

Each wallpaper has been pre-rendered with subtle glassmorphic glow, AtliQ logo, navigation pills, and container slots aligned with the visual layout of your report:

| Page | Wallpaper File | Key Container Slots |
| :--- | :--- | :--- |
| **1. Home (Landing)** | [`wallpaper_home.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets/wallpaper_home.png) | Hero card with 200px AtliQ logo, 5 module navigation cards, and enterprise summary footer. |
| **2. Finance View** | [`wallpaper_finance.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets/wallpaper_finance.png) | Slicer ribbon, Left full-height P&L Statement card, Top-right Area Trend chart, Bottom-right Market & Segment matrix cards. |
| **3. Sales View** | [`wallpaper_sales.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets/wallpaper_sales.png) | Slicer ribbon, Customer Performance table, Performance scatter plot card, 2 donut chart cards, and Product matrix card. |
| **4. Market View** | [`wallpaper_market.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets/wallpaper_market.png) | Slicer ribbon, Market Performance matrix, Center-right scatter plot card, Donut chart, Waterfall chart, and Segment matrix. |
| **5. Supply Chain** | [`wallpaper_supply_chain.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets/wallpaper_supply_chain.png) | Slicer ribbon, 3 KPI error cards (Net Error, Absolute Error, Accuracy %), Forecast vs Sales combo chart card, Customer & Product tables. |
| **6. Executive View** | [`wallpaper_executive.png`](file:///c:/Portfolio%20Website/Business%20Insight%20360/assets/wallpaper_executive.png) | Slicer ribbon, 4 C-Suite KPI cards (Revenue, Gross Margin, Net Profit, Accuracy), Trend line chart, Segment breakdown, Top Customers & Products. |

---

## 🛠️ Step-by-Step Instructions: Applying the Redesign in Power BI Desktop

### Step 1: Open the Redesigned File
Double-click [`Business_Insight__360_Redesigned.pbix`](file:///c:/Portfolio%20Website/Business%20Insight%20360/Business_Insight__360_Redesigned.pbix).
The file will launch in Power BI Desktop with the new AtliQ theme already active.

### Step 2: Apply the Canvas Background Wallpapers
For each page in your report:
1. Click anywhere on the empty canvas (so no individual visual is selected).
2. In the right sidebar, open the **Format page** icon (paintbrush with page).
3. Expand **Canvas background**:
   - Under **Image**, click **Browse...**
   - Select the corresponding wallpaper from the `assets/` folder (e.g. `wallpaper_finance.png` for Finance view).
   - Set **Image fit** to `Fit` (or `Fill`).
   - Set **Transparency** to `0%`.
4. Expand **Wallpaper** (optional):
   - Set Color to `#0B0F19` with `0%` transparency.

### Step 3: Align Visuals to the Card Containers
With the background wallpaper active, the card outlines will guide where to place your visuals:
- Set visual background to **Transparent** (`Transparency: 100%`) or let the visual sit neatly inside the container.
- Turn off the visual **Border** and **Shadow** (the wallpaper already renders shadows and borders).
- Ensure visual fonts are set to White (`#F8FAFC`) or Accent (`#FF5722` / `#00D2B4`).

### Step 4: Import / Refresh Theme (If Needed)
If you ever need to re-apply the theme:
1. Go to the **View** tab in the top ribbon.
2. Click the dropdown arrow on **Themes**.
3. Select **Browse for themes...**
4. Choose [`AtliQ_Business_Insight_360_Theme.json`](file:///c:/Portfolio%20Website/Business%20Insight%20360/AtliQ_Business_Insight_360_Theme.json).

---

## 📐 Layout Coordinates Blueprint (1920 × 1080)

### Finance View Visual Coordinates
```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Header: AtliQ Logo (X:42, Y:24) | Title (X:130, Y:26) | Nav Tabs (X:980, Y:38)│
├──────────────────────────────────────────────────────────────────────────────┤
│ Slicers Bar: X: 24, Y: 118, Width: 1872, Height: 64                          │
├────────────────────────────────┬─────────────────────────────────────────────┤
│                                │                                             │
│  P&L Statement (Matrix)        │  P&L Monthly Trend (Area Chart)             │
│  X: 24, Y: 194                 │  X: 758, Y: 194                             │
│  Width: 720, Height: 864       │  Width: 1138, Height: 480                   │
│                                ├──────────────────────┬──────────────────────┤
│                                │ Market Matrix        │ Segment Matrix       │
│                                │ X: 758, Y: 686       │ X: 1332, Y: 686      │
│                                │ Width: 560, H: 372   │ Width: 564, H: 372   │
└────────────────────────────────┴──────────────────────┴──────────────────────┘
```

---

## 📊 Complete DAX Measures Reference

### 1. Revenue & Sales Measures
```dax
-- Gross Sales Amount
Gross Sales = SUMX(fact_sales_monthly, fact_sales_monthly[sold_quantity] * RELATED(gross_price[gross_price]))

-- Net Invoice Sales
Net Invoice Sales = [Gross Sales] - [Pre Invoice Deductions]

-- Net Sales (Core Revenue Measure)
Net Sales = [Net Invoice Sales] - [Post Invoice Deductions]

-- Net Sales LY (Last Year)
Net Sales LY = CALCULATE([Net Sales], SAMEPERIODLASTYEAR(dim_date[date]))

-- Net Sales YoY Growth %
Net Sales YoY Chg % = DIVIDE([Net Sales] - [Net Sales LY], [Net Sales LY], 0)
```

### 2. Cost & Profitability Measures
```dax
-- Total COGS (Cost of Goods Sold)
Total COGS = [Manufacturing Cost] + [Freight Cost] + [Other Cost]

-- Gross Margin (GM $)
Gross Margin = [Net Sales] - [Total COGS]

-- Gross Margin % (GM %)
Gross Margin % = DIVIDE([Gross Margin], [Net Sales], 0)

-- Operational Expenses (OpEx)
Operational Expenses = SUM('operating-expenses-table-1'[operational_expenses])

-- Net Profit ($)
Net Profit = [Gross Margin] - [Operational Expenses]

-- Net Profit % (NP %)
Net Profit % = DIVIDE([Net Profit], [Net Sales], 0)
```

### 3. Supply Chain & Accuracy Measures
```dax
-- Net Forecast Error
Net Error = SUM(fact_sales_monthly[sold_quantity]) - SUM(fact_forecast_monthly[forecast_quantity])

-- Absolute Forecast Error
Absolute Error = SUMX(
    fact_sales_monthly,
    ABS(fact_sales_monthly[sold_quantity] - RELATED(fact_forecast_monthly[forecast_quantity]))
)

-- Forecast Accuracy %
Forecast Accuracy % = 
VAR AbsErr = [Absolute Error]
VAR SoldQty = SUM(fact_sales_monthly[sold_quantity])
RETURN
IF(SoldQty > 0, MAX(0, 1 - DIVIDE(AbsErr, SoldQty, 0)), 1)
```

---

## 💻 Interactive React Web Showcase

We have built a standalone interactive React 18 web dashboard located at:
[`redesign-showcase/index.html`](file:///c:/Portfolio%20Website/Business%20Insight%20360/redesign-showcase/index.html)

**To test or present it:**
- Simply double-click `redesign-showcase/index.html` in Windows Explorer or open it in your browser.
- It runs with zero build setup, featuring:
  - Live interactive tabs for **Home, Finance, Sales, Market, Supply Chain, and Executive views**.
  - High-res **AtliQ Hardware logo** rendered with anti-aliasing.
  - Interactive **Chart.js** area trend line chart.
  - Fully dynamic **P&L matrix statement** with conditional styling.
  - Links to preview or download all wallpaper templates.
