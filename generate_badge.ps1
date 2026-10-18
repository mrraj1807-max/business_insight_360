Add-Type -AssemblyName System.Drawing

$assetsDir = "c:\Portfolio Website\Business Insight 360\assets"
$logoPath = Join-Path $assetsDir "atliq_logo.png"
$logo = [System.Drawing.Image]::FromFile($logoPath)

$bmp = New-Object System.Drawing.Bitmap(500, 120)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit

# Transparent background
$g.Clear([System.Drawing.Color]::Transparent)

# Draw AtliQ Logo
$g.DrawImage($logo, 10, 10, 100, 100)

# Draw Brand Typography
$brandFont = New-Object System.Drawing.Font("Segoe UI", 26, [System.Drawing.FontStyle]::Bold)
$subFont = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Regular)
$brandBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 87, 34))
$whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(248, 250, 252))
$subBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(148, 163, 184))

$g.DrawString("AtliQ", $brandFont, $brandBrush, 120, 20)
$g.DrawString("Hardware", $brandFont, $whiteBrush, 215, 20)
$g.DrawString("Business Insight 360", $subFont, $subBrush, 124, 66)

$outputPath = Join-Path $assetsDir "atliq_logo_badge.png"
$bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$brainDir = "C:\Users\mrraj\.gemini\antigravity-ide\brain\8fe5b43e-3f77-46c7-b3dd-383434ce2970"
Copy-Item $outputPath $brainDir -Force

$brandFont.Dispose()
$subFont.Dispose()
$brandBrush.Dispose()
$whiteBrush.Dispose()
$subBrush.Dispose()
$g.Dispose()
$bmp.Dispose()
$logo.Dispose()

Write-Host "Created AtliQ logo badge: $outputPath"
