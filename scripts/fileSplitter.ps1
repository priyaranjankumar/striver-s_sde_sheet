#split test
param(
    [Parameter(Mandatory = $true)]
    [string]$InputFileName,
    [Parameter(Mandatory = $true)]
    [string]$OutputLocation,
    [Parameter(Mandatory = $true)]
    [int]$SplitLines
)

$sw = new-object System.Diagnostics.Stopwatch
$sw.Start()
$filename = $InputFileName
$rootName = $OutputLocation
$ext = [System.IO.Path]::GetExtension($InputFileName)

$linesperFile = $SplitLines
$filecount = 1
$reader = $null
try {
    $reader = [io.file]::OpenText($filename)
    try {
        "Creating file number $filecount"
        $writer = [io.file]::CreateText("{0}{1}.{2}" -f ($rootName, $filecount.ToString("000"), $ext))
        $filecount++
        $linecount = 0

        while ($reader.EndOfStream -ne $true) {
            "Reading $linesperFile"
            while ( ($linecount -lt $linesperFile) -and ($reader.EndOfStream -ne $true)) {
                $writer.WriteLine($reader.ReadLine());
                $linecount++
            }

            if ($reader.EndOfStream -ne $true) {
                "Closing file"
                $writer.Dispose();

                "Creating file number $filecount"
                $writer = [io.file]::CreateText("{0}{1}.{2}" -f ($rootName, $filecount.ToString("000"), $ext))
                $filecount++
                $linecount = 0
            }
        }
    }
    finally {
        $writer.Dispose();
    }
}
finally {
    $reader.Dispose();
}
$sw.Stop()

Write-Host "Split complete in " $sw.Elapsed.TotalSeconds "seconds"