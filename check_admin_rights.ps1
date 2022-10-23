<#
  Name: check_admin_rights
  Version: 1.0
  Created: September, 2022
  Created By: Vinodh G gvinodh@vmware.com

  Description: The Script returns if the loggedin user on the machine is a Standard User or Admin User. The script returns the login rights of both local account and domain accounts.

  Execution Context: System
  Execution Architecture: Auto
  Response Type: String
  Script: Replace the domain name of the loggedin Users to which they belong to.
#>

##############################################################################

$currentuser = Get-WMIobject -class Win32_ComputerSystem | select username
$user=$currentuser.username
$UserName = $User.Split("\")[0]
#Update the name of the domain inside the double coat. Example if the logged in users on the device belongs to VMware domain then the below line looks like this 'if ($UserName -ne "Vmware")'
if ($UserName -ne "Replace_Domain_Name_here")
{
    $user = $User.Split("\")[1]
}
$Members = net localgroup Administrators | where {$_ -AND $_ -notmatch "command completed successfully"} | select -skip 4

$Output = "Standard User"
if ($Members.Count -eq 0)
{
    $Output = "Standard User"
}
elseif ($Members.Count -eq 1)
{
    If ($user -eq $Members) 
    {
    $Output = "Admin User"
    }
}
else
{
for ($i=0; $i -lt $Members.Count; $i++)
{
    if ($user -eq $Members[$i])
    {
        $Output = "Admin User"
        break
    }
}
}

$Output
