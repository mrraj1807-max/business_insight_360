# 🚀 Business Insight 360 — AtliQ Hardware

> **A comprehensive Power BI dashboard providing 360° business analytics across Finance, Sales, Marketing, Supply Chain, and Executive functions for AtliQ Hardware — a global consumer electronics manufacturer.**

---

## 📋 Table of Contents

- [Business Problem](#-business-problem)
- [Project Objectives](#-project-objectives)
- [Data Architecture](#-data-architecture)
- [Dashboard Views](#-dashboard-views)
- [Key DAX Measures](#-key-dax-measures)
- [Design System](#-design-system)
- [Implementation Steps](#-implementation-steps)
- [Tools & Technologies](#-tools--technologies)
- [Key Insights & Outcomes](#-key-insights--outcomes)
- [How to Use](#-how-to-use)
- [Author](#-author)

---

## 🔍 Business Problem

### Background

**AtliQ Hardware** is a rapidly growing consumer electronics company that sells products across multiple channels (Brick & Mortar retail, E-Commerce) and markets worldwide (APAC, EU, NA, LATAM). The company manufactures and distributes products spanning three divisions:

| Division | Description | Example Products |
|----------|-------------|-----------------|
| **P & A** (Peripherals & Accessories) | External hardware & accessories | Internal HDD, External SSD, Mouse, Keyboard |
| **PC** (Personal Computers) | Laptops & desktops | Notebooks, Desktops |
| **N & S** (Networking & Storage) | Networking equipment & storage | Wi-Fi Extenders, NAS, Routers |

### The Challenge

AtliQ Hardware experienced significant losses after opening a store in Latin America based on intuition and limited Excel-based analysis. The company's competitors leverage advanced analytics tools, while AtliQ relied on:

- **Fragmented Excel reports** that were slow to produce and error-prone
- **No real-time visibility** into financial health across regions
- **Inability to track** forecast accuracy, leading to inventory imbalances
- **Siloed departmental data** preventing cross-functional decision making
- **Reactive decision-making** instead of proactive, data-driven strategy

### The Cost of Inaction

- **Revenue leakage** from unoptimized pricing and discount structures
- **Excess inventory** tying up working capital in low-demand regions
- **Stockouts** in high-demand markets causing customer churn
- **Misaligned marketing spend** with no ROI visibility
- **Executive blind spots** — no unified view of company performance

---

## 🎯 Project Objectives

1. **Build a unified analytics platform** replacing fragmented Excel reports with a single source of truth
2. **Enable multi-departmental insights** through dedicated views for Finance, Sales, Marketing, Supply Chain, and C-suite executives
3. **Implement a complete P&L analysis pipeline** from Gross Sales → Net Sales → Gross Margin → Net Profit
4. **Create forecast accuracy tracking** to optimize inventory management
5. **Provide interactive, self-service analytics** with dynamic filtering by market, region, customer, product, and time period
6. **Deliver actionable benchmarks** against last year (LY) and targets for KPI tracking
7. **Design a premium, intuitive dashboard** that stakeholders will actually use

---

## 🏗 Data Architecture

### Source Databases

```
┌──────────────────────────────────────────────────────────────────┐
│                        DATA SOURCES                              │
├──────────────────────┬───────────────────────────────────────────┤
│   MySQL: gdb041      │   MySQL: gdb056                          │
│                      │                                           │
│   ► dim_customer     │   ► freight_cost                         │
│   ► dim_market       │   ► gross_price                          │
│   ► dim_product      │   ► manufacturing_cost                   │
│   ► fact_forecast    │   ► post_invoice_deductions              │
│   ► fact_sales       │   ► pre_invoice_deductions               │
│                      │                                           │
├──────────────────────┴───────────────────────────────────────────┤
│   Excel: operating-expenses-table-1.xlsx                         │
│   ► Operational expenses (Ads & Promotions, Other OpEx)          │
└──────────────────────────────────────────────────────────────────┘
```

### Star Schema Data Model

```
                    ┌─────────────┐
                    │  dim_market  │
                    │─────────────│
                    │ market (PK) │
                    │ sub_zone    │
                    │ region      │
                    └──────┬──────┘
                           │
┌──────────────┐    ┌──────┴──────────────────┐    ┌──────────────────┐
│ dim_product   │    │  fact_sales_monthly     │    │  dim_customer    │
│──────────────│    │─────────────────────────│    │──────────────────│
│product_code  │◄───│ date                    │───►│ customer         │
│ division     │    │ product_code (FK)       │    │ market           │
│ segment      │    │ market (FK)             │    │ platform         │
│ category     │    │ customer_code (FK)      │    │ channel          │
│ product      │    │ sold_quantity           │    │ customer_code(PK)│
│ variant      │    └─────────────────────────┘    └──────────────────┘
└──────┬───────┘    ┌─────────────────────────┐
       │            │  fact_forecast_monthly   │
       │            │─────────────────────────│
       └───────────►│ date                    │
                    │ product_code (FK)       │
                    │ market (FK)             │
                    │ customer_code (FK)      │
                    │ forecast_quantity       │
                    └─────────────────────────┘

┌──────────────────┐  ┌──────────────────────┐  ┌────────────────────────┐
│  gross_price     │  │ manufacturing_cost   │  │ post_invoice_deductions│
│──────────────────│  │──────────────────────│  │────────────────────────│
│ product_code(FK) │  │ product_code (FK)    │  │ customer_code (FK)     │
│ fiscal_year      │  │ cost_year            │  │ product_code (FK)      │
│ gross_price      │  │ manufacturing_cost   │  │ date                   │
└──────────────────┘  └──────────────────────┘  │ discounts_pct          │
                                                 │ other_deductions_pct   │
┌──────────────────────┐  ┌──────────────────┐  └────────────────────────┘
│ pre_invoice_deductions│  │  freight_cost   │
│──────────────────────│  │──────────────────│
│ customer_code (FK)   │  │ market           │
│ fiscal_year          │  │ fiscal_year      │
│ pre_invoice_disc_pct │  │ freight_pct      │
└──────────────────────┘  │ other_cost_pct   │
                          └──────────────────┘
```

### P&L Calculation Flow

```
Gross Sales
  └── (-) Pre-Invoice Deductions
       └── = Net Invoice Sales
            └── (-) Post-Invoice Deductions (Discounts + Other Deductions)
                 └── = Net Sales
                      └── (-) COGS (Manufacturing Cost + Freight + Other Costs)
                           └── = Gross Margin
                                └── (-) Operational Expenses (Ads & Promotions + Other OpEx)
                                     └── = Net Profit
```

---

## 📊 Dashboard Views

### 1. 🏠 Home Page (Landing Page)

**Purpose:** Central navigation hub with quick access to all analytical views.

**Design Elements:**
- AtliQ Hardware branding with "Business Insight 360" title
- Six navigation tiles in a 2×3 grid layout
- Each tile includes an icon, title, and brief description
- Last data refresh timestamp display
- Info/Support section for documentation

---

### 2. 💰 Finance View

**Purpose:** Comprehensive Profit & Loss analysis for financial planning and performance tracking.

**Key Visuals:**

| Visual | Type | Description |
|--------|------|-------------|
| **Net Sales KPI** | Card | Current period Net Sales with YoY trend |
| **Gross Margin % KPI** | Card | GM% with sparkline and LY comparison |
| **Net Profit % KPI** | Card | NP% with variance indicator |
| **P&L Trend** | Area/Line Chart | Revenue, COGS, Expenses over time |
| **Segment Breakdown** | Donut Chart | Revenue contribution by segment |
| **P&L Statement** | Matrix Table | Full P&L with Actual vs LY vs Target |

**Filters:** Fiscal Year, Quarter, YTD/YTG, Region, Market, Customer, Segment

**Key Measures Used:**
- `Net Sales`, `Gross Margin`, `Gross Margin %`
- `Net Profit`, `Net Profit %`
- `NS LY` (Last Year), `NS Target`, `NS vs LY %`, `NS vs Target %`
- `GM % LY`, `GM % Target`, `GM % Variance`

---

### 3. 📈 Sales View

**Purpose:** Analyze customer and product sales performance to identify growth opportunities.

**Key Visuals:**

| Visual | Type | Description |
|--------|------|-------------|
| **Customer Performance** | Scatter Plot | NS vs GM% by customer |
| **Product Performance** | Bar Chart | Top 10 products by Net Sales |
| **Performance Matrix** | Matrix Table | Customer × Product performance grid |
| **Unit Economics** | KPI Cards | Net Sales, GM%, COGS trends |

**Filters:** Date range, Region, Product Category, Customer

---

### 4. 📣 Marketing View

**Purpose:** Evaluate product and segment performance from a marketing analytics perspective.

**Key Visuals:**

| Visual | Type | Description |
|--------|------|-------------|
| **Performance Breakdown** | Waterfall Chart | GM% or NP% build-up by product |
| **Segment Analysis** | Scatter Plot | Segment performance (NS vs GM%) |
| **Region Contribution** | Donut Chart | Market/region revenue share |
| **Division Matrix** | Matrix Table | Performance by Division > Segment > Category |
| **GM%/NP% Toggle** | Button Toggle | Switch between Gross Margin and Net Profit views |

---

### 5. 🔗 Supply Chain View

**Purpose:** Monitor forecast accuracy and inventory risk to optimize supply chain operations.

**Key Visuals:**

| Visual | Type | Description |
|--------|------|-------------|
| **Forecast Accuracy** | KPI Card + Gauge | Current FA% with target comparison |
| **Net Error** | KPI Card | Over/under forecast magnitude |
| **Absolute Error** | KPI Card | Total forecast deviation |
| **Accuracy Trend** | Line Chart | Monthly FA% trend with target line |
| **Segment Accuracy** | Matrix Table | FA% by Segment and Category |
| **Risk Analysis** | Conditional Table | Excess/Out-of-stock indicators |

---

### 6. 👔 Executive View

**Purpose:** High-level strategic overview for C-suite executives combining all departmental KPIs.

**Key Visuals:**

| Visual | Type | Description |
|--------|------|-------------|
| **Revenue KPI** | Card | Total revenue with LY comparison & target |
| **Gross Margin KPI** | Card | GM% with trend |
| **Net Profit KPI** | Card | NP with variance |
| **Forecast Accuracy KPI** | Card | FA% with target |
| **Revenue by Region** | Map | Geographic revenue distribution |
| **Market Share Trend** | Ribbon/Area Chart | Competitive position over time |
| **Revenue by Division** | Treemap | Proportional division breakdown |
| **Top/Bottom 5** | Bar Charts | Best and worst products/customers |

---

## 📐 Key DAX Measures

### Core Financial Measures

```dax
// ═══════════════════════════════════════════
// GROSS SALES
// ═══════════════════════════════════════════

Gross Sales = 
SUMX(
    fact_sales_monthly,
    fact_sales_monthly[sold_quantity] *
    RELATED(gross_price[gross_price])
)

// ═══════════════════════════════════════════
// PRE-INVOICE DEDUCTIONS
// ═══════════════════════════════════════════

Pre Invoice Deduction Amount = 
SUMX(
    fact_sales_monthly,
    fact_sales_monthly[sold_quantity] *
    RELATED(gross_price[gross_price]) *
    RELATED(pre_invoice_deductions[pre_invoice_discount_pct])
)

// ═══════════════════════════════════════════
// NET INVOICE SALES
// ═══════════════════════════════════════════

Net Invoice Sales = [Gross Sales] - [Pre Invoice Deduction Amount]

// ═══════════════════════════════════════════
// POST-INVOICE DEDUCTIONS
// ═══════════════════════════════════════════

Post Invoice Deductions = 
SUMX(
    fact_sales_monthly,
    fact_sales_monthly[sold_quantity] *
    RELATED(gross_price[gross_price]) *
    (1 - RELATED(pre_invoice_deductions[pre_invoice_discount_pct])) *
    (
        RELATED(post_invoice_deductions[discounts_pct]) +
        RELATED(post_invoice_deductions[other_deductions_pct])
    )
)

// ═══════════════════════════════════════════
// NET SALES
// ═══════════════════════════════════════════

Net Sales = [Net Invoice Sales] - [Post Invoice Deductions]

// ═══════════════════════════════════════════
// COST OF GOODS SOLD (COGS)
// ═══════════════════════════════════════════

Manufacturing Cost = 
SUMX(
    fact_sales_monthly,
    fact_sales_monthly[sold_quantity] *
    RELATED(manufacturing_cost[manufacturing_cost])
)

Freight Cost = 
SUMX(
    fact_sales_monthly,
    fact_sales_monthly[sold_quantity] *
    RELATED(gross_price[gross_price]) *
    (1 - RELATED(pre_invoice_deductions[pre_invoice_discount_pct])) *
    (
        1 - RELATED(post_invoice_deductions[discounts_pct]) -
        RELATED(post_invoice_deductions[other_deductions_pct])
    ) *
    RELATED(freight_cost[freight_pct])
)

Other Cost = 
SUMX(
    fact_sales_monthly,
    fact_sales_monthly[sold_quantity] *
    RELATED(gross_price[gross_price]) *
    (1 - RELATED(pre_invoice_deductions[pre_invoice_discount_pct])) *
    (
        1 - RELATED(post_invoice_deductions[discounts_pct]) -
        RELATED(post_invoice_deductions[other_deductions_pct])
    ) *
    RELATED(freight_cost[other_cost_pct])
)

Total COGS = [Manufacturing Cost] + [Freight Cost] + [Other Cost]

// ═══════════════════════════════════════════
// GROSS MARGIN & NET PROFIT
// ═══════════════════════════════════════════

Gross Margin = [Net Sales] - [Total COGS]
Gross Margin % = DIVIDE([Gross Margin], [Net Sales], 0)

Net Profit = [Gross Margin] - [Operational Expenses]
Net Profit % = DIVIDE([Net Profit], [Net Sales], 0)
```

### Comparison Measures (LY & Target)

```dax
NS LY = CALCULATE([Net Sales], SAMEPERIODLASTYEAR(dim_date[Date]))
NS vs LY = [Net Sales] - [NS LY]
NS vs LY % = DIVIDE([NS vs LY], [NS LY], 0)

GM % LY = CALCULATE([Gross Margin %], SAMEPERIODLASTYEAR(dim_date[Date]))
GM % Change = [Gross Margin %] - [GM % LY]

NS Target = SUM(ns_target[net_sales_target])
NS vs Target = [Net Sales] - [NS Target]
NS vs Target % = DIVIDE([NS vs Target], [NS Target], 0)
```

### Supply Chain Measures

```dax
Forecast Quantity = SUM(fact_forecast_monthly[forecast_quantity])
Sales Quantity = SUM(fact_sales_monthly[sold_quantity])
Net Error = [Forecast Quantity] - [Sales Quantity]
Net Error % = DIVIDE([Net Error], [Forecast Quantity], 0)

ABS Error = 
SUMX(
    VALUES(dim_product[product_code]),
    ABS(CALCULATE([Forecast Quantity]) - CALCULATE([Sales Quantity]))
)

ABS Error % = DIVIDE([ABS Error], [Forecast Quantity], 0)
Forecast Accuracy % = 1 - [ABS Error %]

Risk = 
IF(
    [Net Error] > 0, "Excess Inventory (EI)",
    IF([Net Error] < 0, "Out of Stock (OOS)", "Balanced")
)
```

### Utility Measures

```dax
// Dynamic metric switching for Marketing View
Selected Metric = 
SWITCH(
    SELECTEDVALUE(Metric[Metric]),
    "Gross Margin %", [Gross Margin %],
    "Net Profit %", [Net Profit %],
    [Gross Margin %]
)

// Conditional formatting helpers
Variance Color = IF([NS vs LY %] > 0, "#00BFA6", "#FF6B6B")
```

---

## 🎨 Design System

### Color Palette

| Token | Hex Code | Usage |
|-------|----------|-------|
| **Deep Navy** | `#0F0F23` | Page background / wallpaper |
| **Dark Navy** | `#1B1B3A` | Card backgrounds, visual containers |
| **Mid Navy** | `#2D2D5E` | Borders, gridlines, separators |
| **Muted Lavender** | `#A0A0C0` | Secondary text, axis labels |
| **Light Silver** | `#E8E8F0` | Primary text, data labels |
| **White** | `#FFFFFF` | KPI callout values, emphasis text |
| **Teal** | `#00BFA6` | Primary accent, positive indicators, headers |
| **Gold** | `#FFD700` | Secondary accent, totals, highlights |
| **Coral Red** | `#FF6B6B` | Negative indicators, alerts, decreases |
| **Purple** | `#8B5CF6` | Tertiary accent, Marketing view highlight |
| **Blue** | `#3B82F6` | Neutral indicators, waterfall totals |
| **Amber** | `#F59E0B` | Warning indicators, neutral status |

### Typography

| Element | Font | Size | Color |
|---------|------|------|-------|
| KPI Callout Values | Segoe UI Semibold | 28pt | White |
| Page Titles | Segoe UI Semibold | 14pt | Light Silver |
| Section Headers | Segoe UI Semibold | 13pt | Teal |
| Table Column Headers | Segoe UI Semibold | 11pt | Teal |
| Body Text / Labels | Segoe UI | 11pt | Muted Lavender |
| Table Values | Segoe UI | 10pt | Light Silver |

---

## 🛠 Implementation Steps

### Phase 1: Apply the Theme
1. Open `Business_Insight__360.pbix` in Power BI Desktop
2. Navigate to **View** → **Themes** → **Browse for themes**
3. Select `BusinessInsight360_Theme.json`
4. Theme instantly applies dark color scheme to all visuals

### Phase 2: Page Background Setup
For each page:
- Canvas background: `#0F0F23`, 0% transparency
- Wallpaper: `#0F0F23`, 0% transparency

### Phase 3: Home Page
- Create navigation tiles (2×3 grid) linking to each view
- Add AtliQ branding and "Business Insight 360" title
- Set button hover states with `#00BFA6` accent

### Phase 4–8: Individual View Redesign
Follow the layout blueprints in the Design Guide for each view (Finance, Sales, Marketing, Supply Chain, Executive).

### Phase 9: Polish
- Configure cross-filtering behavior
- Create bookmarks for toggle states
- Add custom tooltip pages
- Enable drill-through navigation
- Optimize DAX query performance

### Phase 10: Validation
- [ ] All KPIs match source data
- [ ] LY comparisons align correctly
- [ ] Slicers filter across related visuals
- [ ] Conditional formatting is consistent
- [ ] Navigation works on all pages

---

## 🔧 Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Power BI Desktop** | Dashboard development and data modeling |
| **MySQL** | Source database (gdb041, gdb056) |
| **DAX** | Calculated measures and KPI formulas |
| **Power Query (M)** | Data transformation and ETL |
| **Excel** | Supplementary data (operating expenses) |
| **Custom JSON Theme** | Consistent visual styling |

---

## 💡 Key Insights & Outcomes

### Business Impact

1. **Revenue Visibility**: Instant access to revenue data across 27 markets, 75+ customers, and 200+ products
2. **Margin Analysis**: Identified P&A division drives highest GM%, while PC division needs pricing optimization
3. **Forecast Improvement**: Revealed 15-20% forecast error in APAC region for targeted improvement
4. **Cost Optimization**: Freight and manufacturing cost analysis pinpointed high-cost markets
5. **Executive Decision Support**: Consolidated 5+ departmental reports into one unified view

### Technical Achievements

- Star schema data model with 10 tables
- 50+ DAX measures covering complete P&L pipeline
- 6 interactive dashboard pages with cross-filtering
- Custom dark theme with 12-color professional palette
- Dynamic metric switching using disconnected parameter tables

---

## 📖 How to Use

### File Structure

```
Business Insight 360/
├── Business_Insight__360.pbix          # Main Power BI dashboard
├── BusinessInsight360_Theme.json        # Custom dark theme
├── README.md                            # This documentation
├── DESIGN_GUIDE.md                      # Detailed design specs
├── Dataset/
│   └── operating-expenses-table-1.xlsx  # Operational expenses
├── gdb041.sql/
│   └── gdb041.sql                       # Dimension & fact tables
└── gdb056.sql/
    └── gdb056.sql                       # Cost & deduction tables
```

---

## 👤 Author

**Rajat** — Data Analyst & BI Developer

This project demonstrates proficiency in Power BI dashboard design, data modeling (star schema), DAX engineering, ETL with Power Query, and data-driven storytelling for executive stakeholders.

---

*Last Updated: October 2026*
