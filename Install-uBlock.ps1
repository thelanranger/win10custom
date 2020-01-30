#### ========================
#### Install uBlock Plugin
#### ------------------------
function Remove-ChromeuBlock
{
	Remove-ItemProperty -Force -Path "HKCU:\Software\Google\Chrome\PreferenceMACs\Default\extensions.settings\" -Name "cjpalhdlnbpafiamejdnhcphjbkeiagm"
	#### Remove-ItemProperty -Force -Path "HKLM:\Software\Policies\Google\Chrome\" -Name "ExtensionInstallForcelist"
	Remove-Item -Force -Path "HKLM:\SOFTWARE\Wow6432node\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm*" -Recurse
}
function Install-ChromeuBlock
{

	New-Item -Force -Path "HKLM:\SOFTWARE\Wow6432node\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm"
	New-ItemProperty -Force -Path "HKLM:\SOFTWARE\Wow6432node\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm\" -Name "update_url" -Value "https://clients2.google.com/service/update2/crx"
	New-ItemProperty -Force -Path "HKLM:\SOFTWARE\Wow6432node\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm\" -Name "uBlock-Forced" -Value "oblockorigin-chrome"
}
Install-ChromeuBlock
#### ========================
