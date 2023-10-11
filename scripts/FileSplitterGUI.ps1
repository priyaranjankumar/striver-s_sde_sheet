Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create form
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "File Splitter Tool"
$form.Width = 450
$form.Height = 250
$Form.StartPosition = "CenterScreen"

# Create input file panel
$InputFilePanel = New-Object System.Windows.Forms.Panel
$InputFilePanel.Location = New-Object System.Drawing.Point(10, 10)
$InputFilePanel.Size = New-Object System.Drawing.Size(400, 30)
$Form.Controls.Add($InputFilePanel)

$InputFileLabel = New-Object System.Windows.Forms.Label
$InputFileLabel.Location = New-Object System.Drawing.Point(0, 5)
$InputFileLabel.Size = New-Object System.Drawing.Size(100, 20)
$InputFileLabel.Text = "Input File Name:"
$InputFilePanel.Controls.Add($InputFileLabel)

$InputFileTextBox = New-Object System.Windows.Forms.TextBox
$InputFileTextBox.Location = New-Object System.Drawing.Point(110, 5)
$InputFileTextBox.Size = New-Object System.Drawing.Size(200, 20)
$InputFilePanel.Controls.Add($InputFileTextBox)

$InputFileBrowseButton = New-Object System.Windows.Forms.Button
$InputFileBrowseButton.Location = New-Object System.Drawing.Point(320, 5)
$InputFileBrowseButton.Size = New-Object System.Drawing.Size(80, 20)
$InputFileBrowseButton.Text = "Browse"
$InputFileBrowseButton.Add_Click({
        $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
        $fileDialog.Filter = "All Files (*.*)|*.*"
        $fileDialog.InitialDirectory = [Environment]::GetFolderPath("Desktop")
        $fileDialog.Title = "Select a file"
        $fileDialog.Multiselect = $false

        if ($fileDialog.ShowDialog() -eq "OK") {
            $InputFileTextBox.Text = $fileDialog.FileName
        }
    })
$InputFilePanel.Controls.Add($InputFileBrowseButton)

# Create output location panel
$OutputLocationPanel = New-Object System.Windows.Forms.Panel
$OutputLocationPanel.Location = New-Object System.Drawing.Point(10, 50)
$OutputLocationPanel.Size = New-Object System.Drawing.Size(400, 30)
$Form.Controls.Add($OutputLocationPanel)

$OutputLocationLabel = New-Object System.Windows.Forms.Label
$OutputLocationLabel.Location = New-Object System.Drawing.Point(0, 5)
$OutputLocationLabel.Size = New-Object System.Drawing.Size(100, 20)
$OutputLocationLabel.Text = "Output Location:"
$OutputLocationPanel.Controls.Add($OutputLocationLabel)

$OutputLocationTextBox = New-Object System.Windows.Forms.TextBox
$OutputLocationTextBox.Location = New-Object System.Drawing.Point(110, 5)
$OutputLocationTextBox.Size = New-Object System.Drawing.Size(200, 20)
$OutputLocationPanel.Controls.Add($OutputLocationTextBox)

$OutputLocationBrowseButton = New-Object System.Windows.Forms.Button
$OutputLocationBrowseButton.Location = New-Object System.Drawing.Point(320, 5)
$OutputLocationBrowseButton.Size = New-Object System.Drawing.Size(80, 20)
$OutputLocationBrowseButton.Text = "Browse"
$OutputLocationBrowseButton.Add_Click({
        $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
        $OpenFileDialog.InitialDirectory = [Environment]::GetFolderPath('Desktop')
        $OpenFileDialog.Filter = "Folders|*.none"
        $OpenFileDialog.FileName = "Select Folder"
        $OpenFileDialog.CheckFileExists = $false
        $OpenFileDialog.CheckPathExists = $true
        $OpenFileDialog.Multiselect = $false
        $OpenFileDialog.ShowHelp = $true
        $OpenFileDialog.Title = "Select a folder"

        if ($OpenFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            $OutputLocationTextBox.Text = Split-Path $OpenFileDialog.FileName
        }
    })
$OutputLocationPanel.Controls.Add($OutputLocationBrowseButton)

# Create split lines panel
$SplitLinesPanel = New-Object System.Windows.Forms.Panel
$SplitLinesPanel.Location = New-Object System.Drawing.Point(10, 90)
$SplitLinesPanel.Size = New-Object System.Drawing.Size(400, 30)
$Form.Controls.Add($SplitLinesPanel)

$SplitLinesLabel = New-Object System.Windows.Forms.Label
$SplitLinesLabel.Location = New-Object System.Drawing.Point(0, 5)
$SplitLinesLabel.Size = New-Object System.Drawing.Size(100, 20)
$SplitLinesLabel.Text = "Split Lines:"
$SplitLinesPanel.Controls.Add($SplitLinesLabel)

$SplitLinesTextBox = New-Object System.Windows.Forms.TextBox
$SplitLinesTextBox.Location = New-Object System.Drawing.Point(110, 5)
$SplitLinesTextBox.Size = New-Object System.Drawing.Size(200, 20)
$SplitLinesPanel.Controls.Add($SplitLinesTextBox)

# Create split button
$SplitButton = New-Object System.Windows.Forms.Button
$SplitButton.Location = New-Object System.Drawing.Point(170, 140)
$SplitButton.Size = New-Object System.Drawing.Size(100, 30)
$SplitButton.Text = "Split"
$SplitButton.Enabled = $true
$SplitButton.Add_Click({
        # Get input values
        $InputFileName = $InputFileTextBox.Text
        $OutputLocation = $OutputLocationTextBox.Text
        $SplitLines = [int]$SplitLinesTextBox.Text

        # Verify input values
        if ($InputFileName -eq "") {
            [System.Windows.Forms.MessageBox]::Show("Input file name cannot be empty.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            return
        }
        if (-not (Test-Path $InputFileName)) {
            [System.Windows.Forms.MessageBox]::Show("Input file does not exist.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            return
        }
        if ($OutputLocation -eq "") {
            [System.Windows.Forms.MessageBox]::Show("Output location cannot be empty.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            return
        }
        if (-not (Test-Path $OutputLocation)) {
            [System.Windows.Forms.MessageBox]::Show("Output location does not exist.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            return
        }
        if ($SplitLines.GetType().Name -ne "Int32") {
            [System.Windows.Forms.MessageBox]::Show("Split lines must be an integer.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            return
        }
        if ($SplitLines -le 0) {
            [System.Windows.Forms.MessageBox]::Show("Split lines must be greater than 0.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            return
        }

        # Call split script
        # & ".\fileSplitter.ps1" -InputFileName "$InputFileName" -OutputLocation "$OutputLocation" -SplitLines $SplitLines -Wait -RedirectStandardOutput log.log
        $arguments = @($InputFileName, $OutputLocation, $SplitLines)
        # write-host $arguments
        # Call split script
        # & ".\fileSplitter.ps1" -InputFileName "$InputFileName" -OutputLocation "$OutputLocation" -SplitLines $SplitLines -Wait -RedirectStandardOutput log.log
        # $process = Start-Process powershell.exe -ArgumentList "-File", ".\fileSplitter.exe", "-InputFileName", "$InputFileName", "-OutputLocation", "$OutputLocation", "-SplitLines", "$SplitLines"
        # $process.WaitForExit()
        $process = Start-Process -FilePath ".\fileSplitter.exe" -ArgumentList $arguments -PassThru 
        $process.WaitForExit()
        [System.Windows.Forms.MessageBox]::Show("Find Splitted Files at $OutputLocation.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        
    })

$Form.Controls.Add($SplitButton)

# Create about button
$AboutButton = New-Object System.Windows.Forms.Button
$AboutButton.Location = New-Object System.Drawing.Point(170, 170)
$AboutButton.Size = New-Object System.Drawing.Size(100, 30)
$AboutButton.Text = "About"
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
        $aboutLabel.Text = "This is a simple file splitter tool. which splits the file based on number of lines.

Author : PriyaRanjan Kumar.

 https://github.io/priyaranjankumar"
        $aboutLabel.TextAlign = "MiddleCenter"
        $aboutLabel.AutoSize = $true
        $aboutLabel.Left = 50
        $aboutLabel.Top = 30

        # Add the about label to the form
        $aboutForm.Controls.Add($aboutLabel)
        # Show the about form
        $aboutForm.ShowDialog() | Out-Null
    })


$Form.Controls.Add($AboutButton)

# Set accept button to split button
$Form.AcceptButton = $SplitButton

# Show form
$Form.ShowDialog() | Out-Null