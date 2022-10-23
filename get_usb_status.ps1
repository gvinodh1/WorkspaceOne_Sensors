<#
  Name: get_usb_status
  Version: 1.0
  Created: September, 2022
  Created By: Vinodh G gvinodh@vmware.com

  Description: The Script returns the status of USB on the end device (Enabled or Disabled)

  Execution Context: System
  Execution Architecture: Auto
  Response Type: String
#>

##############################################################################


$UsbStatus=Get-ItemProperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices" -ErrorAction SilentlyContinue
if($UsbStatus.Deny_All -eq 1)
{
	$Output="Disabled"
}
else
{
	$Output="Enabled"
}
$Output