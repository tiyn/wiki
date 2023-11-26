# Hyperfine

[Hyperfine](https://github.com/sharkdp/hyperfine) is a [benchmarking](/wiki/benchmark.md) tool.

## Usage

### Benchmark One or More Programs

To benchmark a program it is recommended to warm up the cache before.
This can be done as shown in the following command.

```sh
hyperfine --warmup 5 'sleep 0.3'
```

Unless specified otherwise at least 10 runs will be made to benchmark a program.
To change this the `--runs` flag can be used.
An example of it is given in the following command.

```sh
hyperfine --warmup 5 --runs 3 'sleep 0.3'
```

To compare two programs simply append the program to compare to as shown in the following command.

```sh
hyperfine --warmup 5 'sleep 0.3' 'sleep 0.4'
```
