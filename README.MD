# PSGPOTools

![Build Status](https://build.status.url.here)

## Description

This module read the content of ADMX and ADML files. It instantiate object with GPOTools* classes.
You can search a policy parameter with PowerShell functions and find the registry key.

Authored by NicolasBn

## RoadMap

What do we want for the first version ?
Checklist :

* [x]  Have the simpliest policies with thier key
* [x]  Check if the simpliest policies are configured
* [x]  Cover a minimum of code with pester test
* [ ]  Have a CI
* [ ]  ...

What do we want in futures versions ?

* [ ]  Read the content of .pol file to compare with ADMX content and determine the configured paramter in .pol file.
* [ ]  Have a provider to explore the parameters like than gpedit.msc
* [ ]  Experiment the module to compare hundred GPO in .pol files
* [ ]  Have a provider to explorer the domain GPO
* [ ]  Transaction compatibility for to easy rollback
* [ ]  Warn the user when the parameter is not compatible with de target system
* [ ]  Better speed the initialization of admx/adml (multi runspace ?)

Another ideas are welcome.


## Testing Module

At this state of developpement, there are no task to build the module.
If you want to test it, you need to download the source. Adn then do this :
```Powershell
    cd .\PSGPOTools\
    using module '.\Classes\GPOToolsUtility.psm1'
    $Culture = [cultureinfo]'en-US'
    $ADMXFolder = Get-Item -Path "..\sources\PolicyDefinitions\"
    [GpotoolsUtility]::InitiateAdmxAdml($ADMXFolder,$Culture)
```

After that, the static properties of GPOToolsUtility Class stock the ADMX elements :
```Powershell
# The policies :
[GPOToolsUtility]::Policies
Path        : Machine\Windows Components\ActiveX Installer Service\
Name        : Approved Installation Sites for ActiveX Controls
DisplayName : Approved Installation Sites for ActiveX Controls
Description : This policy setting determines which ActiveX installation sites standard users in your organization can use to install ActiveX controls on their computers. When this setting is enabled, the administrator
              can create a list of approved Activex Install sites specified by host URL.

              If you enable this setting, the administrator can create a list of approved ActiveX Install sites specified by host URL.

              If you disable or do not configure this policy setting, ActiveX controls prompt the user for administrative credentials before installation.

              Note: Wild card characters cannot be used when specifying the host URLs.

ID          : ApprovedActiveXInstallSites
Registry    : GPOToolsRegistry
Scope       : Machine
FileName    : ActiveXInstallService.admx

Path        : Machine\Windows Components\ActiveX Installer Service\
Name        : Establish ActiveX installation policy for sites in Trusted zones
DisplayName : Establish ActiveX installation policy for sites in Trusted zones
Description : This policy setting controls the installation of ActiveX controls for sites in Trusted zone.

              If you enable this policy setting, ActiveX controls are installed according to the settings defined by this policy setting.

              If you disable or do not configure this policy setting, ActiveX controls prompt the user before installation.

              If the trusted site uses the HTTPS protocol, this policy setting can also control how ActiveX Installer Service responds to certificate errors. By default all HTTPS connections must supply a server
              certificate that passes all validation criteria. If you are aware that a trusted site has a certificate error but you want to trust it anyway you can select the certificate errors that you want to ignore.

              Note: This policy setting applies to all sites in Trusted zones.

ID          : AxISURLZonePolicies
Registry    : GPOToolsRegistry
Scope       : Machine
FileName    : ActiveXInstallService.admx

Path        : User\Control Panel\Add or Remove Programs\
Name        : Specify default category for Add New Programs
DisplayName : Specify default category for Add New Programs
Description : Specifies the category of programs that appears when users open the "Add New Programs" page.

              If you enable this setting, only the programs in the category you specify are displayed when the "Add New Programs" page opens. Users can use the Category box on the "Add New Programs" page to display
              programs in other categories.

              To use this setting, type the name of a category in the Category box for this setting. You must enter a category that is already defined in Add or Remove Programs. To define a category, use Software
              Installation.

              If you disable this setting or do not configure it, all programs (Category: All) are displayed when the "Add New Programs" page opens.

              You can use this setting to direct users to the programs they are most likely to need.

              Note: This setting is ignored if either the "Remove Add or Remove Programs" setting or the "Hide Add New Programs page" setting is enabled.
ID          : DefaultCategory
Registry    : GPOToolsRegistry
Scope       : User
FileName    : AddRemovePrograms.admx

Path        : User\Control Panel\Add or Remove Programs\
Name        : Hide the "Add a program from CD-ROM or floppy disk" option
DisplayName : Hide the "Add a program from CD-ROM or floppy disk" option
Description : Removes the "Add a program from CD-ROM or floppy disk" section from the Add New Programs page. This prevents users from using Add or Remove Programs to install programs from removable media.

              If you disable this setting or do not configure it, the "Add a program from CD-ROM or floppy disk" option is available to all users.

              This setting does not prevent users from using other tools and methods to add or remove program components.

              Note: If the "Hide Add New Programs page" setting is enabled, this setting is ignored. Also, if the "Prevent removable media source for any install" setting (located in User Configuration\Administrative
              Templates\Windows Components\Windows Installer) is enabled, users cannot add programs from removable media, regardless of this setting.
ID          : NoAddFromCDorFloppy
Registry    : GPOToolsRegistry
Scope       : User
FileName    : AddRemovePrograms.admx
...

# The Categories :
[GPOToolsUtility]::Categories
Name                                            DisplayName                                                        ExplainText
----                                            -----------                                                        -----------
System                                          System                                                             Allows configuration of various system component settings.
InternetManagement                              Internet Communication Management
Troubleshooting                                 Troubleshooting and Diagnostics
InternetManagement_Settings                     Internet Communication settings
WindowsComponents                               Windows Components                                                 Contains settings for operating system components.
WindowsExplorer                                 File Explorer                                                      Manages File Explorer settings. These include shell properties, folder options, file menus, and avail...
TabletPC                                        Tablet PC
DataCollectionAndPreviewBuilds                  Data Collection and Preview Builds
Network                                         Network                                                            Allows configuration of components of the operating syst
...

#The SupportedOn :
[GPOToolsUtility]::SupportOnTable
Name                                                         DisplayName
----                                                         -----------
SUPPORTED_Win2KWithWindowsInstaller20                        Windows 2000 with Windows Installer v2
SUPPORTED_WindowsPreVistaWithWindowsSearch                   Windows Server 2003 or Windows XP with Windows Search installed
SUPPORTED_AllowWebPrinting                                   Windows 2000 or later, running IIS. Not supported on Windows Server 2003.
SUPPORTED_IE6SP1                                             At least Internet Explorer 6 Service Pack 1
SUPPORTED_Win2k                                              At least Windows 2000
SUPPORTED_Win2kOnly                                          Windows 2000 only
SUPPORTED_Win2kSP1                                           At least Windows 2000 Service Pack 1
SUPPORTED_Win2kSP3                                           At least Windows 2000 Service Pack 3
...
```

## Installing (Not supported today)

~~The easiest way to get PSGPOTools is using the [PowerShell Gallery](https://powershellgallery.com/packages/PSGPOTool/)!~~

### Inspecting the module (Not supported today)

~~Best practice is that you inspect modules prior to installing them. You can do this by saving the module to a local path:~~

``` PowerShell
PS> Save-Module -Name PSGPOTools -Path <path>
```

### Installing the module (Not supported today)

~~Once you trust a module, you can install it using:~~

``` PowerShell
PS> Install-Module -Name PSGPOTools
```

### Updating PSGPOTool (Not supported today)

~~Once installed from the PowerShell Gallery, you can update it using:~~

``` PowerShell
PS> Update-Module -Name PSGPOTools
```

### Uninstalling PSGPOTools (Not supported today)

~~To uninstall PSGPOTools:~~

``` PowerShell
PS> Uninstall-Module -Name PSGPOTools
```

## Contributing to PSGPOTools (Need update)

Interested in contributing? Read how you can [Contribute](contributing.md) to PSGPOTool

This project maintains a [Code of Conduct](code-of-conduct.md) that establishes how the project is governed and how everyone involved is expected to behave. You can report unacceptable behavior to [baudin.nicolas@outlook.fr](mailto:baudin.nicolas@outlook.fr).

## Release History

A detailed release history is contained in the [Change Log](CHANGELOG.md).

## License

PSGPOTools is provided under the [MIT license](LICENSE.md).
