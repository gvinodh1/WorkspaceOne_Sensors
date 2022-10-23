<#
  Name: get_loggedin_user
  Version: 1.0
  Created: August, 2022
  Created By: Vinodh G gvinodh@vmware.com

  Description: The Script returns the current loggedin User on the machine.

  Execution Context: System
  Execution Architecture: Auto
  Response Type: String
#>

######################################################################################################################

$current_user = Get-WMIObject -class Win32_ComputerSystem | select username
$current_user.username
