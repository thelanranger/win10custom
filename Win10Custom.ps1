
#### Win10Custom.ps1 v .5b
#### Computer Configuration
#### Written by TheLANRanger
#### 
#### Goal is to script as many basic default changes to Windows 10 desktop as possible to save clicks!


#### ========================
#### Restart Explorer and Destop Window Manager to make everything take effect now.
#### ------------------------
function Restart-Explorer
{
    taskkill /f /im explorer.exe
    start explorer.exe
    taskkill /f /im dwm.exe
    start dwm.exe
}
#### ========================





#### ========================
#### Begin script
#### ========================
Write-Host -NoNewLine "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")


#### Make System Restore
RunAs-Admin Create-SystemRestore.ps1
RunAs-Admin Enable-RegBackup.ps1
RunAs-Admin VSS-Create.ps1
RunAs-Admin Ren-VSS.ps1

#### Customize!
RunAs-Admin Win10-Custom-LM.ps1
Win10-Custom-CU.ps1
##Remove-ChromeuBlock
Install-ChromeuBlock.ps1


Write-Host -NoNewLine "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
#### ========================