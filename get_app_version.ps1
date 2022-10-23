<#
  Name: get_app_version
  Version: 1.0
  Created: September, 2022
  Created By: Vinodh G gvinodh@vmware.com

  Description: The Script returns the version of any installed app on the device

  Execution Context: System
  Execution Architecture: Auto
  Response Type: String
  Script: Update the name of the app in the script below, for which you want to fetch the app version. Use this powershell command to get the name of the installed apps 'Get-WmiObject -Class Win32_Product'
#>

##############################################################################

#Example
#$HubVersion = Get-WmiObject -Class Win32_Product | where name -EQ "Workspace ONE Intelligent Hub Installer" | select Name, Version
#$HubVersion.Version

##############################################################################

$AppVersion = Get-WmiObject -Class Win32_Product | where name -EQ "Name of the App" | select Name, Version
$AppVersion.Version