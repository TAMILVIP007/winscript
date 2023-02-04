# Completely written by https://github.com/AffanTheBest

$tasks = @(
    "InstallFFMPEG" , "InstallBrave" , "InstallVsCode" , "InstallTelegram" , "InstallVlc" , "Install7Zip" , "InstallMongoCompass", "InstallPython", "InstallGolang", "InstallPgAdmin3"
)
# -----------------------------------------------------------------------------------------------------------------

# Get the ID and security principal of the current user account
Write-Host 'Getting ID and security principal...........';
$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent();
$myWindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($myWindowsID);

# Get the security principal for the administrator role
Write-Host 'Getting security principal for administrative role...........';
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator;

# Check to see if we are currently running as an administrator
Write-Host "Checking if we're currently as administrator or not...........";
if ($myWindowsPrincipal.IsInRole($adminRole))
{
    # We are running as an administrator, so change the title and background colour to indicate this
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(WinScript | Administrator)";
    $Host.UI.RawUI.BackgroundColor = "DarkBlue";
    Clear-Host;
}
else {
    # We are not running as an administrator, so relaunch as administrator
    Write-Host "We are not running as an administrator, so relaunch as administrator...........";
    $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
    $newProcess.Verb = "runas";
    [System.Diagnostics.Process]::Start($newProcess);
    Exit;
}
# -----------------------------------------------------------------------------------------------------------------

Write-Host "Installing Chocolatey...."
Write-Host "===================================================="
Function InstallChocolatey {
	Write-Host " "
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
Write-Host ' '
Write-Host 'Done, Successfully installed chocolatey'

Function Install7Zip {
    Write-Host ""
    Write-Host "Installing 7zip... "
    choco install 7zip -y
    Write-Host "Done!"
    Write-Host ""
}

Function InstallFFMPEG {
    Write-Host ""
    Write-Host "Installing ffmpeg... "
    choco install ffmpeg -y
    Write-Host "Done!"
    Write-Host ""
}

Function InstallBrave {
    Write-Host "Installing Brave..."
    choco install brave -y
    Write-Host "Done!"
    Write-Host ""
}

Function InstallVscode {
    Write-Host "Installing VSCode..."
    choco install vscode -y
    Write-Host "Done!"
    Write-Host ""
}

Function InstallTelegram {
    Write-Host "Installing Telegram Desktop..."
    choco install 64gram -y
    Write-Host "Done!"
    Write-Host ""
}

Function InstallGolang {
    Write-Host "Installing Golang..."
    choco install golang -y
    Write-Host "Done!"
    Write-Host ""
}

Function InstallPython {
    Write-Host "Installing Python..."
    choco install python -y
    Write-Host "Done!"
    Write-Host ""
}

Function InstallMongoCompass {
    Write-Host "Installing MongoCompass..."
    choco install mongodb-compass -y
    Write-Host "Done!"
    Write-Host ""
}

Function InstallPgAdmin3 {
    Write-Host "Installing PgAdmin3..."
    choco install pgadmin3 -y
    Write-Host "Done!"
    Write-Host ""
}

Function InstallVlc {
    Write-Host "Installing VLC..."
    choco install vlc -y
    Write-Host "Done!"
    Write-Host ""
}

Invoke-Expression InstallChocolatey
Invoke-Expression InstallTelegram
Invoke-Expression InstallVlc
Invoke-Expression Install7Zip
Invoke-Expression InstallBrave
Invoke-Expression InstallVscode
Invoke-Expression InstallGolang
Invoke-Expression InstallPython
Invoke-Expression InstallMongoCompass
Invoke-Expression InstallPgAdmin3
Invoke-Expression InstallFFMPEG
