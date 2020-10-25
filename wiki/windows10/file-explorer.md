# File explorer

## Cleanup

The windows file explorer comes with OneDrive and Shortcuts attached to the left-hand side of the window.
There is no easy way to remove it, so you have to make changes to the registry.

### Remove Onedrive Shortcut

- `win-r` - open the run command
- insert `regedit` to the opened window
- in the registry-editor navigate to `Computer/HKEY_CLASSES_ROOT/CLSID/018D5C66-4533-4307-9B53-224DE2ED1FE6`
- Change `System.isPinnedToNameSpaceTree` to `0`

Of course you can change it back to `1` to reenable it.

### Remove Quickaccess

- `win-r` - open the run command
- insert `regedit` to the opened window
- in the registry-editor navigate to `Computer/HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer`
- Add a new DWORD-Entry with the name `HubMode` and set its value to `0`

Of course you can change it back to `1` or just remove the entry to reenable it.
