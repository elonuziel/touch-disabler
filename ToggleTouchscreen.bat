@echo off
setlocal

:: Check if the script is running with Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrative Privileges...
    :: Re-launch this script as Administrator via PowerShell
    powershell -Command "Start-Process '%~dpnx0' -Verb RunAs"
    exit /b
)

:: We are now running as Administrator
echo Administrator privileges confirmed. 
echo -----------------------------------
echo Toggling Touchscreen Status...

powershell -NoProfile -ExecutionPolicy Bypass -Command "$device = Get-PnpDevice | Where-Object { $_.FriendlyName -like '*touch*' -and $_.FriendlyName -like '*screen*' } | Select-Object -First 1; if ($device) { if ($device.Status -eq 'OK') { Write-Host 'Disabling Touchscreen...' -ForegroundColor Yellow; Disable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false -ErrorAction Stop; Write-Host 'Touchscreen is now DISABLED.' -ForegroundColor Red; } else { Write-Host 'Enabling Touchscreen...' -ForegroundColor Cyan; Enable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false -ErrorAction Stop; Write-Host 'Touchscreen is now ENABLED.' -ForegroundColor Green; } } else { Write-Host 'Error: Touchscreen device not found.' -ForegroundColor Red; }; Start-Sleep -Seconds 3;"
