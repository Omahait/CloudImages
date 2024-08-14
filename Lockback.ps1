mkdir C:\LockScreenImage
Invoke-WebRequest https://raw.githubusercontent.com/Omahait/CloudImages/main/ADPAPT%20screen%20saver.png -outfile C:\LockScreenImage\adapt.png
$regKey = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'
if (!(Test-Path -Path $regKey)) {
   $null = New-Item -Path $regKey
}
Set-ItemProperty -Path $regKey -Name LockScreenImage -value "C:\LockScreenImage\adapt.png"
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d C:\LockScreenImage\adapt.png /f
Start-Sleep -s 10
rundll32.exe user32.dll, UpdatePerUserSystemParameters