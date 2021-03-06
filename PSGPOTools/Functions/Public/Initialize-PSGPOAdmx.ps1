function Initialize-PSGPOAdmx {
    [cmdletbinding()]
    Param(
        [ValidateScript( { Test-Path -Path $_ })]
        [String]$Path = "$Env:windir\PolicyDefinitions\",

        [cultureinfo]$UICulture = [cultureinfo]::CurrentUICulture
    )

    ### VAR ###
    ### MAIN ###
    # Empty Statics properties
    [GPOToolsUtility]::RemoveAll()
    [GpotoolsUtility]::InitiateAdmxAdml($ADMXFolder,$Culture)
}