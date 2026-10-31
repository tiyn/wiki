# BOINC

[BOINC](https://boinc.berkeley.edu/) - short for Berkeley Open Infrastructure for Network
Computing - is a free and open-source platform for volunteer distributed computing.
It allows scientific and mathematical projects to distribute computing tasks to users who donate
processing time from their CPUs and GPUs.
The actual research is handled by separate projects to which a client can be connected.

## Setup

BOINC consists mainly of [a client](#client), the [manager](#manager) and
[project servers](#server).
The client performs the computations and communicates with the project servers.
The manager is a graphical interface used to control one or more clients.
Project servers distribute tasks and receive results and are normally operated by the individual
projects rather than by the user.

### Client

BOINC is available for Windows, macOS, Linux and Android from the
[official download page](https://boinc.berkeley.edu/download.php).
On most [Linux distributions](/wiki/linux.md#distributions) it is also available through the package
manager.
On [Arch Linux](/wiki/linux/arch-linux.md) it can be installed with the `boinc` package.

The client can also be setup via [Docker](/wiki/docker.md) with the
[BOINC client image](/wiki/docker/boinc.md).
This is useful if the computing client should run independently of the desktop system while the
[manager](#manager) is used separately.

### Manager

The manager is the graphical interface for controlling a [client](#client).
It can connect to a client running on the same computer or to a remote client.
On Linux it can usually be started with the following command.

```sh
boincmgr
```

After starting, the manager should be [connected to a client](#connecting-to-a-client)

### Server

Projects are hosted on servers which distribute tasks to connected [clients](#client) and receive
the computed results.
They also handle project-specific user accounts, statistics, validation and the applications used
for the computations.

For normal usage no server has to be set up by the user.
The servers are operated by the individual projects, for example
[PrimeGrid](https://www.primegrid.com/).

After setting up client and [manager](#manager) correctly, the [client](#client) only has to be
[attached to the corresponding project](#adding-a-project), which is usually done by through the
[manager](#manager).

## Usage

This section addresses the basic usage of BOINC.

### Connecting to a Client

The [manager](#manager) can connect to a [client](#client) running on the same computer or on
another computer.

Select `File` and `Select computer...`.
For a client running on the same computer use `127.0.0.1` as the host.
For a remote client use its hostname or IP address.
The password has to match the GUI RPC password configured on the client.
GUI RPC normally uses TCP port `31416`.

A manager can connect as follows, where `<password>` is a placeholder for the used password and
`<ip>` is the IP address of the client.

```txt
Host: <ip>
Password: <password>
```

From the Docker host the client can also be controlled directly with the following command.

```sh
docker exec boinc boinccmd --get_state
```

### Adding a Project

The [client](#client) performs work for individual projects from a [server](#server).
To add one select `Tools` and `Add project...` in the [manager](#manager).
Choose a project from the list or enter its project URL and then create an account or sign in with
an existing one.

Multiple projects can be attached to the same client at the same time.
Each project decides which applications and tasks are made available for the computer.

Some preferences and settings can be changed using the manager.
Other settings are configured on the corresponding project's website.
