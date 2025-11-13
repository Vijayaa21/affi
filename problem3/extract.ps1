# Download the NAVAll.txt file
Invoke-WebRequest -Uri "https://www.amfiindia.com/spages/NAVAll.txt" -OutFile "NAVAll.txt"

# Read the file content
$content = Get-Content -Path "NAVAll.txt"

# Find the header line and determine the indices of Scheme Name and Net Asset Value columns
$headerLine = $content | Where-Object { $_ -match "^Scheme Code;" } | Select-Object -First 1
$headers = $headerLine -split ';'

$schemeNameIndex = $headers.IndexOf('Scheme Name')
$navIndex = $headers.IndexOf('Net Asset Value')

if ($schemeNameIndex -eq -1 -or $navIndex -eq -1) {
    Write-Error "Required headers not found!"
    exit 1
}

# Extract Scheme Name and Net Asset Value from all relevant lines (skip blank lines and headers)
$extractedLines = $content | Where-Object { ($_ -notmatch '^\s*$') -and ($_ -notmatch '^Scheme Code;') -and ($_ -notmatch '^$') } | ForEach-Object {
    $columns = $_ -split ';'
    # Some lines may not have enough columns, so check before extracting
    if ($columns.Length -gt $navIndex) {
        "$($columns[$schemeNameIndex])`t$($columns[$navIndex])"
    }
}

# Save to nav.tsv
$extractedLines | Out-File -FilePath "nav.tsv" -Encoding utf8

Write-Output "Extraction complete! Data saved in nav.tsv"
