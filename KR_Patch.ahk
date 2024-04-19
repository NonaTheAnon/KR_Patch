#Requires AutoHotkey v2.0
#NoTrayIcon

;@Ahk2Exe-Set FileVersion, 1.0
;@Ahk2Exe-Set ProductVersion, 1.0.0.0
;@Ahk2Exe-ExeName KR_Patch.exe
;@Ahk2Exe-SetMainIcon KR_Patch.ico

if not FileExist("Game.exe")
{
	MsgBox "An install of Kubinashi Recollection could not be found"
	ExitApp
}

if DirExist(A_Temp "\KR_Patch") {
	DirDelete A_Temp "\KR_Patch", 1
}

DirCreate A_Temp "\KR_Patch"

FileInstall "7za.exe", A_Temp "\KR_Patch\7za.exe", 1
FileInstall "7za.dll", A_Temp "\KR_Patch\7za.dll", 1

RunWait A_Temp "\KR_Patch\7za.exe" " x " "Game.exe -o" '"' A_Temp "\KR_Patch" '"', , "Hide"

FileDelete A_Temp "\KR_Patch\7za.exe"
FileDelete A_Temp "\KR_Patch\7za.dll"

FileInstall "steam_api.dll", A_Temp "\KR_Patch\steam_api.dll", 1

RunWait A_Temp "\KR_Patch\DullahanRecollection.exe"

if DirExist(A_Temp "\KR_Patch") {
	DirDelete A_Temp "\KR_Patch", 1
}