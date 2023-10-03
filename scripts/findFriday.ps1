# .AUTHOR
#     PRIYA RANJAN KUMAR.
# .LASTEDIT
#     Date: 10/09/2020.
# .SYNOPSIS
#     This script copies files from one directory to another if today is Friday and the file name contains "CAPSIL" and either "DL_FL" or "DL_FR".
# .DESCRIPTION
#     This script checks if today is Friday and if so, it copies files from one directory to another if the file name contains "CAPSIL" and either "DL_FL" or "DL_FR".
# .PARAMETER path1
#     The path of the directory where the files to be copied are located.
# .PARAMETER path2
#     The path of the directory where the files will be copied to.
# .EXAMPLE
#     PS C:\> findLastFriday.ps1 "C:\Users\user1\Documents\test1" "C:\Users\user1\Documents\test2"
#     This example runs the script with the specified paths.

$path1 = $args[0]
$path2 = $args[1]

$date = Get-Date
$day = $date.DayOfWeek

if ($day -eq "Friday") {
    $files = Get-ChildItem -Path $path1  
    foreach ($file in $files) {
        $destfile = $path2 + $file.FullName
        if ($destfile.Contains("CAPSIL") -And ($destfile.Contains("DL_FL") -or $destfile.Contains("DL_FR"))) {
            Copy-Item $FILE.FullName $destfile
        }
    }   
}
else {
    Write-Output "Aaj Friday nahi hai"
}