<#
  Name: get_devicetype
  Version: 1.0
  Created:	October, 2022
  Created By: Vinodh G gvinodh@vmware.com

  Description: This Script returns the type of device (Laptop or Desktop)

  Execution Context: System
  Execution Architecture: Auto
  Response Type: String
#>

##############################################################################

$ChassisType = (Get-CimInstance -ClassName Win32_SystemEnclosure).ChassisTypes
if ($ChassisType -eq 8 -or $ChassisType -eq 9 -or $ChassisType -eq 10 -or $ChassisType -eq 11 -or $ChassisType -eq 12 -or $ChassisType -eq 14 -or $ChassisType -eq 18 -or $ChassisType -eq 21) {
    $output = "Laptop"
}
else {
    $output = "Desktop"
}
$output