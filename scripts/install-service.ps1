$ErrorActionPreference="Stop"
$exe=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot "..\\publish\\SmartBackup.Worker.exe"))
if(!(Test-Path $exe)){throw "Executable not found: $exe. Publish first and adjust path if needed."}
if(Get-Service SmartBackup -ErrorAction SilentlyContinue){throw "Service already exists; uninstall first."}
New-Service -Name SmartBackup -DisplayName "SmartBackup Service" -BinaryPathName "`"$exe`"" -StartupType Automatic
Start-Service SmartBackup
Write-Host "SmartBackup installed and started."
