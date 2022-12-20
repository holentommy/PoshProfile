If (-Not (((Get-Host).Version).Major -gt ([version]"5.1").Major )) {
    # Windows PowerShell 5.1 stuff.

    # Overwriting Profile for Windows PowerShell 5.1
    $Profile = "$($env:USERPROFILE)Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
}
ElseIf (-Not (((Get-Host).Version).Major -gt ([version]"7.3").Major )) {
    # PowerShell 7 stuff.
    # Initialize Sharship prompt.
    <#
    If (-Not (Get-Command -Name starship.exe)) {
        winget install starship -s winget
    }
    #>
    Invoke-Expression (&starship init powershell)

    # Initialize oh-my-posh.
    <#
    If (-Not (Get-Command -Name oh-my-posh.exe)) {
        winget install JanDeDobbeleer.OhMyPosh -s winget
    }
    #>
    Invoke-Expression (&oh-my-posh init powershell)

    # Configure PSReadLineOption.
    <#
    If (-Not (Get-Module -ListAvailable | Where-Object {$_.Name -eq 'PSReadLine'})) {
        Install-Module -Name PSReadline -MinimumVersion 2.2.6 -Force
    }
    Import-Module -Name PSReadline -Force
    #>
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    Set-PSReadLineOption -PredictionViewStyle listview

    # Load posh-git
    <#
    If (-Not (Get-Module -ListAvailable | Where-Object {$_.Name -eq 'posh-git'})) {
        Install-Module -Name posh-git -MinimumVersion 1.1.0 -Force
    }

    Import-Module -Name posh-git -Force
    #>

    <#
    # Configure PowerShellGet.
    If (-Not (Get-Module -ListAvailable | Where-Object {$_.Name -eq 'PowerShellGet'})) {
        Install-Module -Name PowerShellGet -MinimumVersion 2.2.5 -Force
    }
    Import-Module -Name PowerShellGet -Force
    #>

    <#
    # Configure PSWindowsUpdate.
    If (-Not (Get-Module -ListAvailable | Where-Object {$_.Name -eq 'PSWindowsUpdate'})) {
        Install-Module -Name PSWindowsUpdate -MinimumVersion 2.2.0.3 -Force
    }
    Import-Module -Name PSWindowsUpdate -Force
    #>

    <#
    # Configure Pester.
    If (-Not (Get-Module -ListAvailable | Where-Object {$_.Name -eq 'Pester'})) {
        Install-Module -Name Pester -MinimumVersion 5.3.1 -Force
    }
    Import-Module -Name Pester -Force
    #>

    <#
    # Configure PoshWSUS.
    If (-Not (Get-Module -ListAvailable | Where-Object {$_.Name -eq 'PoshWSUS'})) {
        Install-Module -Name PoshWSUS -MinimumVersion 2.3.1.6 -Force
    }
    Import-Module -Name PoshWSUS -Force
    #>

    # Adding to PSModulepath
    $env:PSModulePath += ";$($env:USERPROFILE)\Documents\WindowsPowerShell\Modules"

    # Changing to root project folder
    Set-Location -Path "$($env:USERPROFILE)\Documents\WindowsPowerShell\Projects"
}