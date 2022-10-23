<#
  Name: get_license_status
  Version: 1.0
  Created: August, 2022
  Created By: Vinodh G gvinodh@vmware.com

  Description: The Script returns the Windows license status. We used this script for a customer to get the KMS Activation Status.

  Execution Context: System
  Execution Architecture: Auto
  Response Type: String
#>

######################################################################################################################

$KMSActivationStatus=Get-CimInstance SoftwareLicensingProduct -Filter "Name like 'Windows%'" | where { $_.PartialProductKey } | select Description, LicenseStatus
$KMSActivationStatus.Description