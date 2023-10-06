
# Check if a folder path argument was provided
if ($args[0]) {
    # If a folder path argument was provided, use it
    $folder = $args[0]
} else {
    # If no folder path argument was provided, prompt the user for a folder path
    Write-Host "Error: No argument provided."
    return
}
Write-Host "Folder path: $folder"
# Check if a date argument was provided
if ($args[1]) {
    # If a date argument was provided, use it
    $dateString = $args[1].ToString()
    $format = "yyyy-MM-dd"
    $date = [DateTime]::MinValue
    if ([DateTime]::TryParseExact($dateString, $format, $null, [System.Globalization.DateTimeStyles]::None, [ref]$date)) {
        # If the date is valid, use it
        Write-Host "Valid date: $($date.ToString($format))"
    } else {
        # If the date is invalid, stop the script
        Write-Host "Error: Invalid date argument provided. Please use the format 'yyyy-MM-dd'."
        return
    }
} else {
    # If no date argument was provided, use the current system date
    
    $date = Get-Date
    $dateString = $date.ToString("yyyy-MM-dd")
    Write-Host "No date argument was provided, using the current system date." $dateString
}

$files = Get-ChildItem -Path $folderPath -Filter "*.csv"
# Iterate over the files in the folder
foreach ($file in $files) {
    Write-Host $file.FullName
    & "./replaceheader.exe" $file.FullName $dateString
}
# Display the folder path and date

