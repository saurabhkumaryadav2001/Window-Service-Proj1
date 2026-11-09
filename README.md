# SmartBackup Windows Service

A configurable .NET 8 Worker Service that automatically backs up folders on Windows.

## Features
- Scheduled folder backups (configurable interval)
- Timestamped ZIP archives
- Retention cleanup
- Windows Service integration and structured logs
- Configuration via appsettings.json

## Requirements
Windows 10/11 or Windows Server; .NET 8 SDK to build.

## Configure
Edit appsettings.json. Use paths accessible to the service account. Never back up the destination into itself.

## Build and run
```powershell
dotnet restore
dotnet build -c Release
dotnet run
```

## Publish and install (Administrator PowerShell)
```powershell
dotnet publish -c Release -r win-x64 --self-contained true
.\scripts\install-service.ps1
```

## Production notes
Use a dedicated least-privilege service account; verify restore tests; this sample does not encrypt archives. For network paths configure UNC permissions for the service identity. Review logs and monitor backup success.

MIT License
