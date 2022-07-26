$servername = "AZR-EdwinTestVM"



#$username = $AdmincredsUserName
#$password = ConvertTo-SecureString -AsPlainText $_Admincreds_Password -Force
#$Cred = New-Object System.Management.Automation.PSCredential ($username, $password)




#Install and Scripts folder
New-Item -Path 'C:\Install' -ItemType Directory -verbose
New-Item -Path 'C:\Scripts' -ItemType Directory -verbose

#Set Time Zone
Set-TimeZone -Id "Central Standard Time" -verbose

#Rename Server
#Rename-Computer -NewName "$servername" -verbose


#Allows RDP
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0 -verbose

#Unchecks NLA Requirement for RDP
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -name "UserAuthentication" -Value 0 -verbose
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -name "SecurityLayer" -Value 0 -verbose

#Disables UAC
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0 -verbose

#Sets CD-ROM drive to  Z

Get-CimInstance -ClassName Win32_Volume -Filter "DriveLetter = 'E:'" | Set-CimInstance -Property @{DriveLetter ='Z:'}

