# viperproject - viperserver

This is a [Docker](/wiki/docker.md) container for a [Viper](/wiki/programming_language/viper.md)
server, which is used for building the Viper verifiers
[Silicon and Carbon](/wiki/programming_language/viper.md#setup).
The official container and documentation was made by
[viperproject](https://hub.docker.com/r/viperproject/viperserver).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.
Due to this container being used to build the Silicon and Carbon verifiers it is recommended to be
started in interactive mode as demonstrated in the [rebuild section](#rebuildsh).
Make sure to substitute `<path-to-carbon>` and `<path-to-silicon>`.
If only one of them is to be built, omit the other.
Additionally the version of viperproject has to be added for `<viperproject-version>`.
It also depends on the Z3 version which will be used later.
For example the version `v4_z3_4.8.7` is working for Z3 versions `4.8.7` and later.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description                               |
| ------------------------- | --------------- | ----------------------------------------- |
| `<path-to-silicon>`       | `/mnt/silicon`  | (optional) mount Silicon for installation |
| `<path-to-carbon>`        | `/mnt/carbon`   | (optional) mount Carbon for installation  |

## rebuild.sh

```sh
docker run -it --name viperserver \
  -v <path-to-silicon>:/mnt/silicon \
  -v <path-to-carbon>:/mnt/carbon \
  viperproject/viperserver:<viperproject-version>
```
