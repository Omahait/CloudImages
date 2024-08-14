mkdir C:\LockScreenImage
Invoke-WebRequest https://raw.githubusercontent.com/Omahait/CloudImages/main/ADPAPT%20screen%20saver.png -outfile C:\LockScreenImage\adapt.png
$regKey = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'
if (!(Test-Path -Path $regKey)) {
   $null = New-Item -Path $regKey
}
# Get the path to the wallpaper image
$imagePath = "C:\LockScreenImage\adapt.png"

# Set the wallpaper for all users
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "Wallpaper" -Value $imagePath
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "WallpaperStyle" -Value "2" # 2 = Centered

# Update the wallpaper immediately
rundll32.exe user32.dll,UpdatePerUserSystemParameters