# WSL

[WSL](https://learn.microsoft.com/en-us/windows/wsl/) - short for Windows Subsystem for Linux - is
a Tool of [Windows](/wiki/windows.md) that allows users and developers to run a
[Linux](/wiki/linux.md) environment.

## Setup

WSL ist preinstalled on the newer Windows versions.
Then the distribution to run may have to be [installed](#installing-a-distribution).

## Usage

### Installing a Distribution

First make sure to update WSL.
This can be done by running the following command.

```powershell
wsl --update
```

If the Microsoft Store is disabled on the system the command needs to be adapted.

```powershell
wsl --update --web-download
```

Then the distribution will be installed.
First get the name of the distribution to be installed.
This can be done by running the following command.

```powershell
wsl.exe -l -o
```

Afterwards install the distribution.
`<Distribution Name>` is the name of the distribution obtained in the previous stepa.

```powershell
wsl.exe --install -d <Distribution Name>
```

On systems that have the Microsoft store disabled the distribution needs to be imported instead.
For this a file system image of the distribution inside a tar archive is needed.
These archives can be found on the websites of the distribution.
For example Ubuntu file system images can be found
[on their cloud image site](https://cloud-images.ubuntu.com/wsl/noble/current/).
`<Distribution Name>` should be set to the name of the distribution.
`<Install Location>` is the path where the systems files will be stored.
`<Install TarFile>` is the path to the file obtained from the distributions website.

```powershell
wsl --import <Distribution Name> <Install Location> <Install TarFile>
```

Afterwards the default distribution may have to be set.
Once again `<DistributionName>` is the name of the distribution to make the new default.

```powershell
wsl --setdefault <DistributionName>
```
