# Check for Administrator privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Requesting Administrative Privileges..." -ForegroundColor Cyan
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"") -Verb RunAs
    exit
}

# Administrator privileges confirmed
Write-Host "Administrator privileges confirmed." -ForegroundColor Green
Write-Host "-----------------------------------"
Write-Host "Toggling Touchscreen Status..." -ForegroundColor White

# Find the touchscreen device
$device = Get-PnpDevice | Where-Object { $_.FriendlyName -like '*touch*' -and $_.FriendlyName -like '*screen*' } | Select-Object -First 1

if ($device) {
    if ($device.Status -eq 'OK') {
        Write-Host "Disabling Touchscreen..." -ForegroundColor Yellow
        Disable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false -ErrorAction Stop
        Write-Host "Touchscreen is now DISABLED." -ForegroundColor Red
    }
    else {
        Write-Host "Enabling Touchscreen..." -ForegroundColor Cyan
        Enable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false -ErrorAction Stop
        Write-Host "Touchscreen is now ENABLED." -ForegroundColor Green
    }
}
else {
    Write-Host "Error: Touchscreen device not found." -ForegroundColor Red
}

Write-Host "`nClosing in 3 seconds..."
Start-Sleep -Seconds 3
