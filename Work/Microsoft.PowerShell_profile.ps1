If (-Not (((Get-Host).Version).Major -gt ([version]"5.1").Major )) {
    # Windows PowerShell 5.1 stuff.

    # Overwriting Profile for Windows PowerShell 5.1
    $Profile = "$($env:USERPROFILE)Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
}
ElseIf (-Not (((Get-Host).Version).Major -gt ([version]"7.3").Major )) {
    # PowerShell 7 stuff.
    $WindowsOperationsProd = "C:\Git\WindowsOperations"
    $WindowsOperationsDev = "C:\git\WindowsOperationsDev"

    # Adding PSModulePath
    $env:PSModulePath += ";$($WindowsOperationsDev)\tori\COSRemote\Modules\"
    $env:PSModulePath += ";$($WindowsOperationsProd)\Modules"
    $env:PSModulePath += ";$($env:USERPROFILE)\Documents\WindowsPowerShell\Modules"

    # Forcing import of Posh Git
    Import-Module -Name posh-git -MaximumVersion 1.0.0
    Set-Location -Path $WindowsOperationsProd

    # PS Readline configuration.
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    Set-PSReadLineOption -PredictionViewStyle listview

    # Setting up COS Operator function wrapper
    Function Connect-COSOperatorWindowsPowerShellWrapper {
        Set-Location -Path "$($env:windir)\System32\WindowsPowerShell\v1.0"
        .\powershell.exe -Command {Connect-COSOperator -NOExtGateway Default -SEExtGateway None -NOIntGateways SG1,SG2 -COSApplications None -UserLocation Onshore}
    }

    # Setting alias for Connect-COSOperatorWindowsPowerShellWrapper
    Set-Alias -Name COSOperator -Value Connect-COSOperatorWindowsPowerShellWrapper
}