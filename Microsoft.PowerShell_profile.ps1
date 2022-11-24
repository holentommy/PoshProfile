# Initialize Sharship prompt.
Invoke-Expression (&starship init powershell)

# Initialize oh-my-posh.
oh-my-posh init pwsh | 
    Invoke-Expression