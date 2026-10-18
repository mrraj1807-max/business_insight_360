Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$sourceDir = "C:\Portfolio Website\Business Insight 360\pbix_extracted"
$destZip = "C:\Portfolio Website\Business Insight 360\Business_Insight__360_Redesigned.pbix"

if (Test-Path $destZip) { Remove-Item $destZip -Force }

$zipStream = [System.IO.File]::Create($destZip)
$archive = New-Object System.IO.Compression.ZipArchive($zipStream, [System.IO.Compression.ZipArchiveMode]::Create)

$allFiles = Get-ChildItem -Path $sourceDir -Recurse -File

foreach ($file in $allFiles) {
    $relativePath = $file.FullName.Substring($sourceDir.Length + 1).Replace("\", "/")
    
    # DataModel MUST be stored without compression
    if ($file.Name -eq "DataModel") {
        $entry = $archive.CreateEntry($relativePath, [System.IO.Compression.CompressionLevel]::NoCompression)
    } else {
        $entry = $archive.CreateEntry($relativePath, [System.IO.Compression.CompressionLevel]::Optimal)
    }
    
    $entryStream = $entry.Open()
    $fileStream = [System.IO.File]::OpenRead($file.FullName)
    $fileStream.CopyTo($entryStream)
    $fileStream.Dispose()
    $entryStream.Dispose()
}

$archive.Dispose()
$zipStream.Dispose()

$newItem = Get-Item $destZip
Write-Host "Created redesigned PBIX: $($newItem.FullName), Size: $($newItem.Length) bytes"
