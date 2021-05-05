# Windows 10

[Windows 10](https://windows.com/) is an operating system developed by
[Microsoft](https://www.microsoft.com/).

## Telemetry

Windows 10 has a `Windows Compatibility Telemetry` process running in the background.
To disable it follow this [guide](https://answers.microsoft.com/en-us/windows/forum/windows_10-performance/permanently-disabling-windows-compatibility/6bf71583-81b0-4a74-ae2e-8fd73305aad1):

- Start the `Task Scheduler`
- In the `Task Scheduler` navigate to the path
`Task Scheduler Library\Microsoft\Windows\Application Experience`
- Look for the `Microsoft Compatibility Appraiser` on the `Application Experience`
folder, right-click it and select `Disable`.
