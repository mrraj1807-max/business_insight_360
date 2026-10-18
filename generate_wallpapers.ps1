Add-Type -AssemblyName System.Drawing

$assetsDir = "c:\Portfolio Website\Business Insight 360\assets"
$logoPath = Join-Path $assetsDir "atliq_logo.png"
$logo = [System.Drawing.Image]::FromFile($logoPath)

function New-RoundedRectangle($g, $pen, $brush, [float]$x, [float]$y, [float]$w, [float]$h, [float]$radius) {
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $diameter = $radius * 2
    $path.AddArc($x, $y, $diameter, $diameter, 180, 90)
    $path.AddArc($x + $w - $diameter, $y, $diameter, $diameter, 270, 90)
    $path.AddArc($x + $w - $diameter, $y + $h - $diameter, $diameter, $diameter, 0, 90)
    $path.AddArc($x, $y + $h - $diameter, $diameter, $diameter, 90, 90)
    $path.CloseFigure()
    if ($null -ne $brush) { $g.FillPath($brush, $path) }
    if ($null -ne $pen) { $g.DrawPath($pen, $path) }
    $path.Dispose()
}

function New-DashboardWallpaper($title, $subtitle, $pageType, $outputPath) {
    $bmp = New-Object System.Drawing.Bitmap(1920, 1080)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic

    # 1. Main Canvas Deep Navy Background (#0B0F19)
    $bgBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(11, 15, 25))
    $g.FillRectangle($bgBrush, 0, 0, 1920, 1080)
    $bgBrush.Dispose()

    # Top gradient glow
    $accentBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        (New-Object System.Drawing.Point(0, 0)),
        (New-Object System.Drawing.Point(1920, 110)),
        [System.Drawing.Color]::FromArgb(40, 255, 87, 34),
        [System.Drawing.Color]::FromArgb(20, 0, 210, 180)
    )
    $g.FillRectangle($accentBrush, 0, 0, 1920, 110)
    $accentBrush.Dispose()

    # 2. Header Bar Container (#111728)
    $headerPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(40, 52, 80), 1)
    $headerBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(17, 23, 40))
    New-RoundedRectangle $g $headerPen $headerBrush 24 16 1872 90 12

    # Draw AtliQ Logo in Header
    $g.DrawImage($logo, 42, 24, 74, 74)

    # Title & Subtitle
    $titleFont = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
    $subFont = New-Object System.Drawing.Font("Segoe UI", 10.5, [System.Drawing.FontStyle]::Regular)
    $whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(248, 250, 252))
    $mutedBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(148, 163, 184))
    $brandBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 87, 34))

    $g.DrawString("AtliQ Hardware", $titleFont, $brandBrush, 130, 26)
    $g.DrawString("Business Insight 360", $titleFont, $whiteBrush, 325, 26)
    $g.DrawString($subtitle + "  |  Interactive Analytics Hub", $subFont, $mutedBrush, 132, 62)

    # Navigation Pills in Header
    $navPages = @("Home", "Finance", "Sales", "Market", "Supply Chain", "Executive")
    $startX = 980
    $pillFont = New-Object System.Drawing.Font("Segoe UI", 9.5, [System.Drawing.FontStyle]::Bold)
    for ($i = 0; $i -lt $navPages.Length; $i++) {
        $pName = $navPages[$i]
        $isActive = ($pName -eq $pageType)
        $pWidth = 142
        $px = $startX + ($i * 150)
        
        if ($isActive) {
            $pBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 87, 34))
            $pTextBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
            $pPen = $null
        } else {
            $pBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(22, 30, 48))
            $pTextBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(180, 195, 215))
            $pPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(45, 58, 88), 1)
        }
        New-RoundedRectangle $g $pPen $pBrush $px 38 $pWidth 44 8
        
        $sf = New-Object System.Drawing.StringFormat
        $sf.Alignment = [System.Drawing.StringAlignment]::Center
        $sf.LineAlignment = [System.Drawing.StringAlignment]::Center
        $g.DrawString($pName, $pillFont, $pTextBrush, (New-Object System.Drawing.RectangleF($px, 38, $pWidth, 44)), $sf)
        
        if ($pBrush) { $pBrush.Dispose() }
        if ($pTextBrush) { $pTextBrush.Dispose() }
        if ($pPen) { $pPen.Dispose() }
    }

    # Card background styling
    $cardPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(35, 47, 74), 1)
    $cardBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(19, 27, 46))

    if ($pageType -eq "Finance") {
        # Slicer Bar Container
        New-RoundedRectangle $g $cardPen $cardBrush 24 118 1872 64 10
        # Left P&L Matrix Card
        New-RoundedRectangle $g $cardPen $cardBrush 24 194 720 864 12
        # Top Right Area Chart Card
        New-RoundedRectangle $g $cardPen $cardBrush 758 194 1138 480 12
        # Bottom Right Card 1 (Market Breakdown)
        New-RoundedRectangle $g $cardPen $cardBrush 758 686 560 372 12
        # Bottom Right Card 2 (Product Segment Breakdown)
        New-RoundedRectangle $g $cardPen $cardBrush 1332 686 564 372 12
    }
    elseif ($pageType -eq "Sales") {
        # Slicer Bar Container
        New-RoundedRectangle $g $cardPen $cardBrush 24 118 1872 64 10
        # Customer Performance Table Card
        New-RoundedRectangle $g $cardPen $cardBrush 24 194 890 530 12
        # Performance Scatter Chart Card
        New-RoundedRectangle $g $cardPen $cardBrush 930 194 966 530 12
        # Donut Chart 1 Card
        New-RoundedRectangle $g $cardPen $cardBrush 24 736 580 322 12
        # Donut Chart 2 Card
        New-RoundedRectangle $g $cardPen $cardBrush 620 736 580 322 12
        # Product Matrix Card
        New-RoundedRectangle $g $cardPen $cardBrush 1216 736 680 322 12
    }
    elseif ($pageType -eq "Market") {
        # Slicer Bar Container
        New-RoundedRectangle $g $cardPen $cardBrush 24 118 1872 64 10
        # Left Market Matrix Card
        New-RoundedRectangle $g $cardPen $cardBrush 24 194 680 520 12
        # Center-Right Scatter Chart Card
        New-RoundedRectangle $g $cardPen $cardBrush 718 194 1178 520 12
        # Bottom Donut Card
        New-RoundedRectangle $g $cardPen $cardBrush 24 726 580 332 12
        # Bottom Waterfall Card
        New-RoundedRectangle $g $cardPen $cardBrush 620 726 580 332 12
        # Bottom Matrix Card
        New-RoundedRectangle $g $cardPen $cardBrush 1216 726 680 332 12
    }
    elseif ($pageType -eq "Supply Chain") {
        # Slicer Bar Container
        New-RoundedRectangle $g $cardPen $cardBrush 24 118 1872 64 10
        # KPI Card 1 (Net Error)
        New-RoundedRectangle $g $cardPen $cardBrush 24 194 280 120 10
        # KPI Card 2 (Absolute Error)
        New-RoundedRectangle $g $cardPen $cardBrush 320 194 280 120 10
        # KPI Card 3 (Forecast Accuracy)
        New-RoundedRectangle $g $cardPen $cardBrush 616 194 280 120 10
        # Combo Chart (Forecast vs Sales Trend)
        New-RoundedRectangle $g $cardPen $cardBrush 912 194 984 480 12
        # Customer Table Card
        New-RoundedRectangle $g $cardPen $cardBrush 24 326 872 732 12
        # Product Table Card
        New-RoundedRectangle $g $cardPen $cardBrush 912 686 984 372 12
    }
    elseif ($pageType -eq "Executive") {
        # Slicer Bar Container
        New-RoundedRectangle $g $cardPen $cardBrush 24 118 1872 64 10
        # 4 Large KPI Cards
        New-RoundedRectangle $g $cardPen $cardBrush 24 194 450 140 12
        New-RoundedRectangle $g $cardPen $cardBrush 498 194 450 140 12
        New-RoundedRectangle $g $cardPen $cardBrush 972 194 450 140 12
        New-RoundedRectangle $g $cardPen $cardBrush 1446 194 450 140 12
        # Trend Chart
        New-RoundedRectangle $g $cardPen $cardBrush 24 348 1180 380 12
        # Revenue by Segment
        New-RoundedRectangle $g $cardPen $cardBrush 1220 348 676 380 12
        # Top 5 Customers
        New-RoundedRectangle $g $cardPen $cardBrush 24 742 926 316 12
        # Top 5 Products
        New-RoundedRectangle $g $cardPen $cardBrush 974 742 922 316 12
    }
    elseif ($pageType -eq "Home") {
        # Large Hero Section
        New-RoundedRectangle $g $cardPen $cardBrush 24 130 1872 260 16
        # Draw Big AtliQ Logo in Hero
        $g.DrawImage($logo, 70, 160, 200, 200)
        
        $heroTitleFont = New-Object System.Drawing.Font("Segoe UI", 32, [System.Drawing.FontStyle]::Bold)
        $heroSubFont = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Regular)
        $g.DrawString("AtliQ Hardware 360 Analytics Suite", $heroTitleFont, $whiteBrush, 300, 180)
        $g.DrawString("Unified Business Intelligence across Finance, Sales, Marketing, Supply Chain, and Executive Strategy.", $heroSubFont, $mutedBrush, 305, 250)
        $g.DrawString("Select an analytics module below to launch deep-dive business diagnostics.", $heroSubFont, $brandBrush, 305, 290)

        # 5 Large Nav Cards
        $modules = @(
            @{Name="Finance View"; Sub="P and L Statement, Revenue, Margins and Gross Profit Trends"},
            @{Name="Sales View"; Sub="Customer and Product Performance, Unit Sales and Net Growth"},
            @{Name="Market View"; Sub="Market Share, Segment Contribution and Regional Breakdown"},
            @{Name="Supply Chain View"; Sub="Forecast Accuracy, Net Error and Inventory Risk Analysis"},
            @{Name="Executive View"; Sub="High-level C-Suite KPI cockpit and Strategic Performance"}
        )
        $cardW = 356
        $cardH = 260
        for ($i = 0; $i -lt 5; $i++) {
            $cx = 24 + ($i * 379)
            $cy = 420
            New-RoundedRectangle $g $cardPen $cardBrush $cx $cy $cardW $cardH 14
            
            # Module Title
            $mFont = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
            $mSubFont = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Regular)
            $g.DrawString($modules[$i].Name, $mFont, $whiteBrush, ($cx + 20), ($cy + 30))
            
            $textRect = New-Object System.Drawing.RectangleF(($cx + 20), ($cy + 80), ($cardW - 40), 110)
            $g.DrawString($modules[$i].Sub, $mSubFont, $mutedBrush, $textRect)
            
            # Button pill at bottom
            $btnBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 87, 34))
            New-RoundedRectangle $g $null $btnBrush ($cx + 20) ($cy + 200) 140 36 6
            $btnFont = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
            $g.DrawString("Open View ->", $btnFont, $whiteBrush, ($cx + 26), ($cy + 208))
            $btnBrush.Dispose()
            $mFont.Dispose()
            $mSubFont.Dispose()
            $btnFont.Dispose()
        }

        # Footer
        New-RoundedRectangle $g $cardPen $cardBrush 24 710 1872 340 16
        $footTitleFont = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
        $g.DrawString("About AtliQ Hardware", $footTitleFont, $whiteBrush, 50, 740)
        $infoText = "AtliQ Hardware is a rapidly growing multinational hardware electronics company selling PCs, accessories, networking, and storage devices across Americas, APAC, and EU regions. This Business Insight 360 system integrates over 1.8M sales records, dynamic fiscal calendar tracking, cost models, and predictive forecasting to empower decision makers with actionable, data-driven clarity."
        $infoRect = New-Object System.Drawing.RectangleF(50, 785, 1780, 120)
        $infoFont = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Regular)
        $g.DrawString($infoText, $infoFont, $mutedBrush, $infoRect)
        
        $footTitleFont.Dispose()
        $infoFont.Dispose()
    }

    # Save Bitmap
    $bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    # Cleanup
    $titleFont.Dispose()
    $subFont.Dispose()
    $whiteBrush.Dispose()
    $mutedBrush.Dispose()
    $brandBrush.Dispose()
    $headerPen.Dispose()
    $headerBrush.Dispose()
    $cardPen.Dispose()
    $cardBrush.Dispose()
    $g.Dispose()
    $bmp.Dispose()
    Write-Host "Created wallpaper: $outputPath"
}

New-DashboardWallpaper "Business Insight 360" "Finance Performance and P&L Statement" "Finance" (Join-Path $assetsDir "wallpaper_finance.png")
New-DashboardWallpaper "Business Insight 360" "Sales Analytics and Customer Performance" "Sales" (Join-Path $assetsDir "wallpaper_sales.png")
New-DashboardWallpaper "Business Insight 360" "Market Diagnostics and Segment Distribution" "Market" (Join-Path $assetsDir "wallpaper_market.png")
New-DashboardWallpaper "Business Insight 360" "Supply Chain Accuracy and Inventory Risk" "Supply Chain" (Join-Path $assetsDir "wallpaper_supply_chain.png")
New-DashboardWallpaper "Business Insight 360" "Executive Overview and Strategic KPIs" "Executive" (Join-Path $assetsDir "wallpaper_executive.png")
New-DashboardWallpaper "Business Insight 360" "Welcome and Module Selection" "Home" (Join-Path $assetsDir "wallpaper_home.png")

# Also copy wallpapers to brain directory for markdown artifacts embedding
$brainDir = "C:\Users\mrraj\.gemini\antigravity-ide\brain\8fe5b43e-3f77-46c7-b3dd-383434ce2970"
Copy-Item (Join-Path $assetsDir "wallpaper_*.png") $brainDir -Force

$logo.Dispose()
Write-Host "All wallpapers generated successfully!"
