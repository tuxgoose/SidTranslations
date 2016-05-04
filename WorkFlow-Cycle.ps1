Workflow Cycle{
$list = get-content C:\Mozy\dberror.txt
foreach -parallel($i in $list)
{



if( -Not (test-connection $i -count 1 -ErrorAction SilentlyContinue))
{
if(Get-WmiObject win32_computersystem)
{
#[string[]]$computers += $i
Write-Output "$i" | Out-file -filepath "C:\Mozy\Online.txt" -append
}
}
}
} 
cycle
