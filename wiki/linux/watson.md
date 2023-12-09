# Watson

[Watson](https://tailordev.github.io/Watson) is a free and open-source time-tracker for
[Linux](/wiki/linux.md) that uses the [command-line interface](/wiki/linux/shell.md).

## Setup

On most Linux distributions Watson can be installed with the `watson` package.
Additionally Watson can be installed using Pythons pip package manager.
The pip package is called ´td-watson`.
Alternatively it can be installed via [GitHub](https://github.com/TailorDev/Watson).

## Usage

The following section describes various ways of usage of Watson.

### Tracking Time and Displaying Tracked Time

Time can be tracked by running the following command.
This example tracks time to a project called `world-domination` and uses the tag `cats` and `dogs`.
Additional tags can be appended or tags can be ommited if not needed.
This should be adapted to specific needs.

```sh
watson start world-domination +cats +dogs
```

Alternatively the start time can be set in the past by adding the `--at` flag with a time.

```sh
watson start world-domination +cats +dogs --at 13:37
```

The tracking of the time can be stopped by running the following command.

```sh
watson stop
```

Afterwards the summary of the tracked time can be displayed by running the following command.

```sh
watson report
```

### Adding a Time Frame in Retrospect

It can be useful to add time frames in retrospect if the starting and stopping of that task was
forgotten at that time.
For this the following command can be run.
It works similarly to starting a time frame as explained in the
[section above](#tracking-time-and-displaying-tracked-time).
Additionally the start and stop time are specified with the `--from` and `--to` flags.

```sh
watson add --from "2018-03-20 12:00:00" --to "2018-03-20 13:00:00" programming +addfeature
```
