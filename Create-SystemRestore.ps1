#### ========================
#### Create a System restore point before we break a bunch of stuff.
#### ------------------------
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v DisableSR /t REG_DWORD /d 0 /f
	Enable-ComputerRestore -Drive "C:\"
	Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint --% "%DATE%", 100, 1
#### ========================