# .AUTHOR
#     PRIYA RANJAN KUMAR.
# .LASTEDIT
#     Date: 10/09/2020
# .SYNOPSIS
#     This script checks if today is the last day of the month and performs a copy operation if it is.
# .DESCRIPTION
#     This script checks if today is the last day of the month and performs a copy operation if it is. It copies files from one directory to another if the file name contains "CAPSIL" and either "DL_FL" or "DL_FR".
# .PARAMETER path1
#     The source directory path.
# .PARAMETER path2
#     The destination directory path.
# .EXAMPLE
#     PS C:\> findLastCalendarDate.ps1 "C:\Users\user1\Documents\test1" "C:\Users\user1\Documents\test2"
#     This example runs the script with the specified paths.

$path1 = $args[0]
$path2 = $args[1]
$today = Get-Date
$lastDayOfMonth = ((Get-Date -Day 1 -Month $today.Month -Year $today.Year).AddMonths(1).AddDays(-1)).Day

if ($today.Day -eq $lastDayOfMonth) {
    $files = Get-ChildItem -Path $path1  
    foreach ($file in $files) {
        $destfile = $path2 + $file.FullName
        if ($destfile.Contains("CAPSIL") -And ($destfile.Contains("DL_FL") -or $destfile.Contains("DL_FR"))) {
            Copy-Item $FILE.FullName $destfile
        }
    }
}
else {
    "apne ko kya hai"
}