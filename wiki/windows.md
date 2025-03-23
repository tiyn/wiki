# Windows

[Windows](https://windows.com/) is an operating system developed by
[Microsoft](https://www.microsoft.com/).

## Telemetry

Windows has a `Windows Compatibility Telemetry` process running in the
background.
To disable it follow this
[guide](https://answers.microsoft.com/en-us/windows/forum/windows_10-performance/permanently-disabling-windows-compatibility/6bf71583-81b0-4a74-ae2e-8fd73305aad1):

- Start the `Task Scheduler`
- In the `Task Scheduler` navigate to the path
  `Task Scheduler Library\Microsoft\Windows\Application Experience`
- Look for the `Microsoft Compatibility Appraiser` on the `Application Experience`
  folder, right-click it and select `Disable`.

## Make Windows compatible with UTC

Making Windows use UTC can be useful for dual-boot systems.
This can be done by running the following command in the Windows command prompt.

```txt
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f
```

Disabling of UTC time is done with the same command with a `0` instead of a `1`.

## Installation

This section focusses on topics that are related to the installation of Windows.

### Bypass Network Setup During Installation 

To bypass the setup of a network during the installation process `Shift` and `F10` need to be
pressed.
By putting in `oobe/bypassnro` into the command line and pressing `Enter` the computer will restart
and will display an option to bypass the network setup during the corresponding step.
