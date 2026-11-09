using Microsoft.Extensions.Hosting;
using SmartBackup.Worker;
var builder = Host.CreateApplicationBuilder(args);
builder.Services.AddWindowsService(o => o.ServiceName = "SmartBackup Service");
builder.Services.Configure<BackupOptions>(builder.Configuration.GetSection("Backup"));
builder.Services.AddHostedService<BackupWorker>();
await builder.Build().RunAsync();