<#
  Name: check_configuration_manager_client
  Version: 1.0
  Created: October, 2022
  Created By: Vinodh G gvinodh@vmware.com

  Description: The Script returns the installation status of Configuration Manager Client

  Execution Context: System
  Execution Architecture: Auto
  Response Type: String
#>

##############################################################################

$app = Get-WmiObject -Class Win32_Product | where name -EQ "configuration manager client" | where vendor -EQ "Microsoft Corporation" 
if ($app.name -ne $null)
{
$app.name
}
else
{
$Output = "Configuration Manager Client is Not Installed"
$Output
}