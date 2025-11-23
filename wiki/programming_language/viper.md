# Viper

[Viper](https://www.pm.inf.ethz.ch/research/viper.html) is a verification language among other
tools.

## Setup

For the Viper language to work a verifier needs to be set up.
The two possibilities are [Carbon](https://github.com/viperproject/carbon) and
[Silicon](https://github.com/viperproject/silicon).

This section explains the installation for [Linux-based systems](/wiki/linux.md), but they are also
available for [Windows](/wiki/windows.md) systems though the steps to setup differ.
For this navigate download the code from [Silicons Github](https://github.com/viperproject/silicon)
and/or [Carbon Github](https://github.com/viperproject/carbon).

There are some dependencies.
For both Carbon and Silicon to work correctly Z3 has to be installed.
This can easily be done, for example by installing the `z3` package, which is available from
various [package managers](/wiki/linux/package_manager/pacman_and_aur.md).
For Carbon Boogie has to be installed too.
This is best done by installing a .NET SDK which is often packaged in a package called `dotnet-sdk`
or a similar named one.
Afterwards boogie can be installed using the following command.

```sh
dotnet tool install -g boogie
```

Afterwards the building of Silicon and/or Carbon can follow.

The easiest way to build one or both verifiers locally is creating a `.jar` file via
[Docker](/wiki/docker.md) using the
[viperproject image](/wiki/docker/viperproject_-_viperserver.md).

Start the Docker container as explained in the
[corresponding wiki entry](/wiki/docker/viperproject_-_viperserver.md).
Make sure to change the setting as described.
Then in the Docker container build Silicon by running the following commands.

```sh
cd /mnt/silicon
sbt assembly
```

For Carbon similarly run the following commands.

```sh
cd /mnt/carbon
sbt assembly
```

Afterwards leave the Docker container.
It is no longer needed.

The `.jar` files are now available in `<path-to-carbon>/target/scala-<version>/carbon.jar` or
`<path-to-silicon>/target/scala-2.13/silicon.jar` and are ready to be used outside the docker
container from the host machine.

Afterwards Carbon and/or Silicon are ready to be [used](#usage).

## Usage

This section addresses the usage of Viper.

### Basic Verifier Usage

After [Silicon](https://github.com/viperproject/silicon) and/or
[Carbon](https://github.com/viperproject/carbon) have been setup according to the
[setup section](#setup), they can be used.

For Silicon run the following command.
`<path-to-silicon-jar>` describes the path of the Silicon jar which was set in the [setup](#setup).
`<path-to-viper-file>` is the path to the Viper file to verify.

```sh
java -jar <path-to-silicon-jar> <path-to-viper-file>
```

For Carbon run the following command.
`<path-to-carbon-jar>` describes the path of the Carbon jar which was set in the [setup](#setup).
`<path-to-z3>` is the path to the Z3 binary (for example `/bin/z3`) and `<path-to-boogie>` is the
path to the boogie binary (for example `~/.dotnet/tools/boogie` when set up with .NET).

```sh
java -jar <path-to-carbon-jar> --z3Exe <path-to-z3> --boogieExe <path-to-boogie> <path-to-viper-file>
```
