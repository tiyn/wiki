# Counter-Strike 2

[Counter-Strike 2](https://www.counter-strike.net/cs2) is a tactical first-person shooter
[game](/wiki/game.md) developed by [Valve](https://www.valvesoftware.com/en/).
It is distributed via [Steam](./steam.md).

## Troubleshooting

This section addresses various errors that can happen when playing Counter-Strike 2.

### Problems launching on [Steam](/wiki/game/steam.md)

On [Linux](/wiki/linux.md) systems launching can run into problems.
To fix those the following line should be set as launch options in the general tab of steams game
related settings:

```sh
gamemoderun %command% -vulkan -sdlaudiodriver pipewire -novid -high -fullscreen -nojoy
```
