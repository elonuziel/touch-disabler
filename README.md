# Touch Disabler

A simple, safe, and robust set of scripts (Windows Batch and PowerShell) that toggle your laptop's touchscreen on and off.

## Features
- **One-Click Toggle**: Double-click the file to disable or enable the touchscreen.
- **Auto-Elevation**: Automatically requests Administrator privileges (UAC prompt), which are required by Windows to change hardware states.
- **Safe & Official**: Uses built-in Windows PowerShell cmdlets (`Get-PnpDevice`, `Enable-PnpDevice`, `Disable-PnpDevice`). It does not uninstall drivers or use any third-party tools.

## How to Use

### Using the Batch Script (`.bat`)
1. Download the `ToggleTouchscreen.bat` file.
2. Double-click the file.
3. Windows will present a User Account Control (UAC) prompt asking "Do you want to allow this app to make changes to your device?". Click **Yes**.
4. The script will quickly check if the touchscreen is enabled or disabled and flip its state. A console window will flash briefly displaying the action it took.
5. Try touching your screen!

### Using the PowerShell Script (`.ps1`)
1. Download the `ToggleTouchscreen.ps1` file.
2. Right-click the file and select **"Run with PowerShell"**.
3. If prompted, click **Yes** to grant Administrator privileges.
4. The script will toggle the touchscreen status and close after 3 seconds.

### Creating a Desktop Shortcut (Recommended)

For even faster access, you can create a shortcut on your desktop:

1. Right-click the `ToggleTouchscreen.bat` (or `ToggleTouchscreen.ps1`) file.
2. Select **"Send to" > "Desktop (create shortcut)"**.
3. (Optional) Right-click the new shortcut on your desktop, select **Properties**, click in the **Shortcut key** box, and press a key combination (like `Ctrl + Alt + T`). Now you can toggle your touchscreen using your keyboard!

## Requirements
- Windows 10 or Windows 11.
- A touchscreen device (specifically looking for "HID-compliant touch screen").
- You must click "Yes" on the Administrator permission prompt when running the script.
