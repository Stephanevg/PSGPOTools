function Get-PSGPOPolicy {
    [cmdletbinding()]
    Param(
        [cultureinfo]$Culture,
        [System.IO.DirectoryInfo]$Path
    )

    ### VAR ###
    ### MAIN ###
    $Policies =  [GpoToolsUtility]::Policies
    If ($null -eq $Policies){
        Write-Warning "Initiate ADMX and ADML files with Initialize-PSGPOAdmx cmdlet."
    }Else{
        $Policies = [GpotoolsUtility]::InitiateAdmxAdml($Path,$Culture)
        return $Policies
    }
}
