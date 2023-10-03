#create a powershell script to find if the today is friday or not from given date
$date = Get-Date
$day = $date.DayOfWeek
if ($day -eq "Friday") {
    Write-Host "Yes, today is Friday"
}
else {
    Write-Host "No, today is not Friday"
}