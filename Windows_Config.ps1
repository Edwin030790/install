 #$servername = "AZR-EdwinTestVM"



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



#Initialize drives, Create GPT Volume with drive letter and friendly name

Initialize-Disk -number 2 -PartitionStyle GPT -PassThru | New-Volume -FileSystem NTFS -DriveLetter F -FriendlyName 'Database'

Initialize-Disk -number 3 -PartitionStyle GPT -PassThru | New-Volume -FileSystem NTFS -DriveLetter G -FriendlyName 'Backup'

Initialize-Disk -number 4 -PartitionStyle GPT -PassThru | New-Volume -FileSystem NTFS -DriveLetter H -FriendlyName 'Logs'


  # Update these variables as needed
$CID = "91AA454D371C4AAAAFF43FC13D1B6E69-1A"
$SensorShare = "\\192.168.170.203\ITDepartment\Crowdstrike\WindowsSensor.exe"

# The sensor is copied to the following directory
$SensorLocal = "C:\Install\WindowsSensor.exe"

# Create a TEMP directory if one does not already exist
if (!(Test-Path -Path "C:\Install" -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path "C:\Install" -Force

}
# Now copy the sensor installer if the share is available
if (Test-Path -Path $SensorShare) {

    Copy-Item -Path $SensorShare -Destination $SensorLocal -Force

}
# Now check to see if the service is already present and if so, don't bother running installer.
if (!(Get-Service -Name 'CSFalconService' -ErrorAction SilentlyContinue)) {

    & $SensorLocal /install /quiet /norestart CID=$CID

}  


#DotNet
  # Update these variables as needed
$CID = "91AA454D371C4AAAAFF43FC13D1B6E69-1A"
$DotnetSensorShare = "\\192.168.170.203\ITDepartment\dot_Net Core 8\dotnet-sdk-8.0.101-win-x64.exe"

# The sensor is copied to the following directory
$DotnetSensorLocal = "C:\Install\dotnet-sdk-8.0.101-win-x64.exe"

# Create a TEMP directory if one does not already exist
if (!(Test-Path -Path "C:\Install" -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path "C:\Install" -Force

}
# Now copy the sensor installer if the share is available
if (Test-Path -Path $DotnetSensorShare) {

    Copy-Item -Path $DotnetSensorShare -Destination $DotnetSensorLocal -Force

}
C:\Install\dotnet-sdk-8.0.101-win-x64.exe /install /quiet /norestart

#mkdir -p $HOME/dotnet -and tar zxf dotnet-sdk-8.0.101-win-x64.exe -C $HOME/dotnet
#export DOTNET_ROOT=$HOME/dotnet
#export PATH='$PATH:$HOME/dotnet' 



#FIleZilla

  # Update these variables as needed

$FZSensorShare = "\\192.168.170.203\ITDepartment\Filezilla\FileZilla_3.63.1_win64-setup.exe"

# The sensor is copied to the following directory
$FZSensorLocal = "C:\Install\FileZilla_3.63.1_win64-setup.exe"

# Create a TEMP directory if one does not already exist
if (!(Test-Path -Path "C:\Install" -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path "C:\Install" -Force

}
# Now copy the sensor installer if the share is available
if (Test-Path -Path $FZSensorShare) {

    Copy-Item -Path $FZSensorShare -Destination $FZSensorLocal -Force

}

C:\Install\FileZilla_3.63.1_win64-setup.exe /S  



#Notepad+

  # Update these variables as needed

$NPSensorShare = "\\192.168.170.203\ITDepartment\Notepad++\npp.8.6.2.Installer.x64.exe"

# The sensor is copied to the following directory
$NPSensorLocal = "C:\Install\npp.8.6.2.Installer.x64.exe"

# Create a TEMP directory if one does not already exist
if (!(Test-Path -Path "C:\Install" -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path "C:\Install" -Force

}
# Now copy the sensor installer if the share is available
if (Test-Path -Path $NPSensorShare) {

    Copy-Item -Path $NPSensorShare -Destination $NPSensorLocal -Force

}

C:\Install\npp.8.6.2.Installer.x64.exe /S  



#WINSCP

  # Update these variables as needed

$SCPSensorShare = "\\192.168.170.203\ITDepartment\WinSCP\WinSCP-6.1.2-Setup.exe"

# The sensor is copied to the following directory
$SCPSensorLocal = "C:\Install\WinSCP-6.1.2-Setup.exe"

# Create a TEMP directory if one does not already exist
if (!(Test-Path -Path "C:\Install" -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path "C:\Install" -Force

}
# Now copy the sensor installer if the share is available
if (Test-Path -Path $SCPSensorShare) {

    Copy-Item -Path $SCPSensorShare -Destination $SCPSensorLocal -Force

}


C:\Install\WinSCP-6.1.2-Setup.exe /ALLUSERS /VERYSILENT /NORESTART 





 
