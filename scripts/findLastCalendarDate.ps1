$path1 = "C:\Users\user1\Documents\test1"
$path2 = "C:\Users\user1\Documents\test2"
$today = Get-Date
$lastDayOfMonth = ((Get-Date -Day 1 -Month $today.Month -Year $today.Year).AddMonths(1).AddDays(-1)).Day

if ($today.Day -eq $lastDayOfMonth) {
    #perform copy operation
    $files = Get-ChildItem -Path $path1
    foreach ( $file in $files ) {
        
        Copy-Item -Path $file.FullName -Destination $path2
    }
}
else {
    "not the lastdate of the month"
}