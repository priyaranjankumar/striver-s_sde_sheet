-$path=$args[0]
$path1=$args[1]

$t1= get-date -Format yyyyMMdd
$ts="_"+$t1+"_"+$t1+"_"

$files = Get-ChildItem -Path $path  ### Reading files from Temp1Folder
foreach ($file in $files){
$ilength = $file.Name.Length-29
$elength = 10
$sfile = $file.Name.Substring(0,$ilength)
$efile = $file.Name.Substring($file.Name.length-$elength,$elength)
$destfile= $path1+$sfile + $ts + $efile
if ($destfile.Contains("CAPSIL") -And ($destfile.Contains("DL_FL") -or $destfile.Contains("DL_FR")))
 {
   Copy-Item $FILE.FullName $destfile
 }
}
