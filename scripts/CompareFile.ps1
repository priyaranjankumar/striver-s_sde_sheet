Add-Type -AssemblyName System.Windows.Forms

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "File Comparison"
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

# Create the maxLineNumber label and textbox
$maxLineNumberLabel = New-Object System.Windows.Forms.Label
$maxLineNumberLabel.Text = "Max Line Number:"
$maxLineNumberLabel.AutoSize = $true
$maxLineNumberLabel.Left = 50
$maxLineNumberLabel.Top = 110

$maxLineNumberTextbox = New-Object System.Windows.Forms.TextBox
$maxLineNumberTextbox.Left = 150
$maxLineNumberTextbox.Top = 110
$maxLineNumberTextbox.Width = 250

# Create the compare button
$compareButton = New-Object System.Windows.Forms.Button
$compareButton.Text = "Compare"
$compareButton.Left = 200
$compareButton.Top = 150
$compareButton.Width = 100

# Add the controls to the form
$form.Controls.Add($file1pathLabel)
$form.Controls.Add($file1pathTextbox)
$form.Controls.Add($file2pathLabel)
$form.Controls.Add($file2pathTextbox)
$form.Controls.Add($maxLineNumberLabel)
$form.Controls.Add($maxLineNumberTextbox)
$form.Controls.Add($compareButton)

# Add an event handler for the compare button
$compareButton.Add_Click({
        # Get the file paths and max line number
        $file1path = $file1pathTextbox.Text
        $file2path = $file2pathTextbox.Text
        $maxLineNumber = $maxLineNumberTextbox.Text

        # Run compare.exe with the file paths and max line number as arguments
        $logFilePath = "comparison.log"
        Start-Process -FilePath "compare.exe" -ArgumentList "$file1path $file2path /max=$maxLineNumber /log=$logFilePath" -Wait

        # Display a message box indicating that the comparison is complete and the log file has been generated
        [System.Windows.Forms.MessageBox]::Show("Comparison complete. Log file generated at $logFilePath.")
    })

# Show the form
$form.ShowDialog() | Out-Null
