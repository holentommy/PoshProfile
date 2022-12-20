# Initialize Sharship prompt.
Invoke-Expression (&starship init powershell)

# Initialize oh-my-posh.
Invoke-Expression (&oh-my-posh init powershell)

# Configure PSReadLineOption.
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle listview
