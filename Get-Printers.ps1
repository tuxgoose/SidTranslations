[CmdLetBinding()]
    Param(
    [Parameter(Mandatory=$True,HelpMessage="Please Enter User Name(s)")]
              [string]$UserName,
          

    [Parameter(Mandatory=$True,HelpMessage="Please Enter ComputerName(s)")]
              [string]$ComputerName
          )


$drive=New-PSDrive -Name HKU   -PSProvider Registry -Root Registry::HKEY_USERS
cd HKU:
[string[]]$Names=(Get-ChildItem C:\Users).name

$objUser = New-Object System.Security.Principal.NTAccount($Username)
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$SIDTranslation=$strSID.Value


Get-ChildItem Registry::\HKEY_Users\$SIDTranslation\network | Get-ItemProperty -Name Remotepath | ft remotepath, PSChildName
Get-ChildItem Registry::\HKEY_Users\$SIDTranslation\Printers\Connections 
