Add-Type -AssemblyName System.Windows.Forms

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "File Comparison Tool - PriyaRanjan Kumar"
$form.Width = 500
$form.Height = 250
$form.StartPosition = "CenterScreen"

# Create the file1path label and textbox
$file1pathLabel = New-Object System.Windows.Forms.Label
$file1pathLabel.Text = "File 1 Path:"
$file1pathLabel.AutoSize = $true
$file1pathLabel.Left = 50
$file1pathLabel.Top = 30

$file1pathTextbox = New-Object System.Windows.Forms.TextBox
$file1pathTextbox.Left = 150
$file1pathTextbox.Top = 30
$file1pathTextbox.Width = 250

# Create the file1path browse button
$file1pathBrowseButton = New-Object System.Windows.Forms.Button
$file1pathBrowseButton.Text = "Browse"
$file1pathBrowseButton.Left = 410
$file1pathBrowseButton.Top = 30
$file1pathBrowseButton.Width = 75

# Add an event handler for the file1path browse button
$file1pathBrowseButton.Add_Click({
    $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $fileDialog.Filter = "All Files (*.*)|*.*"
    $fileDialog.InitialDirectory = [Environment]::GetFolderPath("Desktop")
    $fileDialog.Title = "Select a file"
    $fileDialog.Multiselect = $false

    if ($fileDialog.ShowDialog() -eq "OK") {
        $file1pathTextbox.Text = $fileDialog.FileName
    }
})

# Add the file1path label, textbox, and browse button to the form
$form.Controls.Add($file1pathLabel)
$form.Controls.Add($file1pathTextbox)
$form.Controls.Add($file1pathBrowseButton)

# Create the file2path label and textbox
$file2pathLabel = New-Object System.Windows.Forms.Label
$file2pathLabel.Text = "File 2 Path:"
$file2pathLabel.AutoSize = $true
$file2pathLabel.Left = 50
$file2pathLabel.Top = 70

$file2pathTextbox = New-Object System.Windows.Forms.TextBox
$file2pathTextbox.Left = 150
$file2pathTextbox.Top = 70
$file2pathTextbox.Width = 250

# Create the file2path browse button
$file2pathBrowseButton = New-Object System.Windows.Forms.Button
$file2pathBrowseButton.Text = "Browse"
$file2pathBrowseButton.Left = 410
$file2pathBrowseButton.Top = 70
$file2pathBrowseButton.Width = 75

# Add an event handler for the file2path browse button
$file2pathBrowseButton.Add_Click({
    $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $fileDialog.Filter = "All Files (*.*)|*.*"
    $fileDialog.InitialDirectory = [Environment]::GetFolderPath("Desktop")
    $fileDialog.Title = "Select a file"
    $fileDialog.Multiselect = $false

    if ($fileDialog.ShowDialog() -eq "OK") {
        $file2pathTextbox.Text = $fileDialog.FileName
    }
})

# Add the file2path label, textbox, and browse button to the form
$form.Controls.Add($file2pathLabel)
$form.Controls.Add($file2pathTextbox)
$form.Controls.Add($file2pathBrowseButton)

# Create the maxLineNumber label and textbox
$maxLineNumberLabel = New-Object System.Windows.Forms.Label
$maxLineNumberLabel.Text = "Max Char in Line:"
$maxLineNumberLabel.AutoSize = $true
$maxLineNumberLabel.Left = 50
$maxLineNumberLabel.Top = 110

$maxLineNumberTextbox = New-Object System.Windows.Forms.TextBox
$maxLineNumberTextbox.Left = 150
$maxLineNumberTextbox.Top = 110
$maxLineNumberTextbox.Width = 250

# Add validation to the maxLineNumber textbox
$maxLineNumberTextbox.Add_KeyPress({
    if (-not [char]::IsDigit($_.KeyChar)) {
        $_.Handled = $true
    }
})

# Add the maxLineNumber label and textbox to the form
$form.Controls.Add($maxLineNumberLabel)
$form.Controls.Add($maxLineNumberTextbox)

# Create the compare button
$compareButton = New-Object System.Windows.Forms.Button
$compareButton.Text = "Compare"
$compareButton.Left = 200
$compareButton.Top = 150
$compareButton.Width = 100

# Add an event handler for the compare button
$compareButton.Add_Click({
    if ([string]::IsNullOrWhiteSpace($file1pathTextbox.Text) -or [string]::IsNullOrWhiteSpace($file2pathTextbox.Text) -or $maxLineNumberTextbox.Text -le 0) {
        # [System.Windows.Forms.MessageBox]::Show("Please enter a file path for both files.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        if([string]::IsNullOrWhiteSpace($file1pathTextbox.Text)){
            [System.Windows.Forms.MessageBox]::Show("Please enter a file path for file 1.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
        if([string]::IsNullOrWhiteSpace($file2pathTextbox.Text)){
            [System.Windows.Forms.MessageBox]::Show("Please enter a file path for file 2.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
        if($maxLineNumberTextbox.Text -le 0){
            [System.Windows.Forms.MessageBox]::Show("Please enter a max line number greater than 0.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    } else {
        # Compare the files
        # ...
        # Write-Host "./compare.exe" $file1pathTextbox.Text $file2pathTextbox.Text $maxLineNumberTextbox.Text
        $arguments = @($file1pathTextbox.Text, $file2pathTextbox.Text, $maxLineNumberTextbox.Text)
        # write-host $arguments
        $process = Start-Process -FilePath "compare.exe" -ArgumentList $arguments -PassThru -NoNewWindow -Wait -RedirectStandardOutput result.log
        if($process.ExitCode -eq 0){
            [System.Windows.Forms.MessageBox]::Show("Find Result.log .", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        }
        else{
            [System.Windows.Forms.MessageBox]::Show("Error.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    }
})

# Add the compare button to the form
$form.Controls.Add($compareButton)

# Create a new button control for the about button
$aboutButton = New-Object System.Windows.Forms.button
$aboutButton.Text = "About"
$aboutButton.Left = 50
$aboutButton.Top = 150
$aboutButton.Width = 100

# Add an event handler for the about button
$aboutButton.Add_Click({
    # Create the about form
    $aboutForm = New-Object System.Windows.Forms.Form
    $aboutForm.Text = "File Comparison - About"
    $aboutForm.Width = 500
    $aboutForm.Height = 250
    $aboutForm.StartPosition = "CenterScreen"

    # Create the about label
    $aboutLabel = New-Object System.Windows.Forms.Label
    $aboutLabel.Text = "This is a simple file comparison tool. which compares two files and 
    generates a report of the differences.

    Created by: PriyaRanjan Kumar.

    If you find this helpful, please follow me at https://github.io/priyaranjankumar"
    $aboutLabel.TextAlign= "MiddleCenter"
    $aboutLabel.AutoSize = $true
    $aboutLabel.Left = 50
    $aboutLabel.Top = 30

    # Add the about label to the form
    $aboutForm.Controls.Add($aboutLabel)
    # Show the about form
    $aboutForm.ShowDialog() | Out-Null
})


# Add the about button to the form
$form.Controls.Add($aboutButton)
# Show the form
$form.ShowDialog() | Out-Null