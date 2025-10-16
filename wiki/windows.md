# Windows

[Windows](https://windows.com/) is an operating system developed by
[Microsoft](https://www.microsoft.com/).

## Setup

The files and programs needed for the installation of Windows 11 are available on the
[Windows website](https://www.microsoft.com/de-de/software-download/windows11).

### Bypass Network Setup During Installation 

For Windows 10 to bypass the setup of a network during the installation process `Shift` and `F10`
need to be pressed.
By putting in `oobe/bypassnro` into the command line and pressing `Enter` the computer will restart
and will display an option to bypass the network setup during the corresponding step.

## Usage

This section addresses the usage of Windows.

### Disable Telemetry

Windows 10 has a `Windows Compatibility Telemetry` process running in the
background.
To disable it follow this
[guide](https://answers.microsoft.com/en-us/windows/forum/windows_10-performance/permanently-disabling-windows-compatibility/6bf71583-81b0-4a74-ae2e-8fd73305aad1):

- Start the `Task Scheduler`
- In the `Task Scheduler` navigate to the path
  `Task Scheduler Library\Microsoft\Windows\Application Experience`
- Look for the `Microsoft Compatibility Appraiser` on the `Application Experience`
  folder, right-click it and select `Disable`.

### Make Windows Compatible with UTC

Making Windows 10 use UTC can be useful for dual-boot systems that also feature
[Linux-based operating systems](/wiki/linux.md).
This can be done by running the following command in the Windows command prompt.

```txt
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f
```

Disabling of UTC time is done with the same command with a `0` instead of a `1`.
