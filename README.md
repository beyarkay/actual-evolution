Actual Evolution - A [factorio](https://factorio.com/) mod
----------------------------------------------------------

This factorio mod changes biter and spitter behaviour to evolve over time. Each
enemy has a set of traits which define the behaviour it is genetically pre disposed to, and
spawners will create new enemies with traits that are biased towards the
success of previous enemies spawned from that spawner


For example, if a spawner spawns a biter that's predisposed to going around
walls instead of attacking walls, and that biter goes on to destroy many
factories, then the subsequent biters spawned from that spawner will _also_ be
predisposed to navigating around walls instead of attacking them.


This is very much a work in progress, and breaking changes are often introduced.


# Installation


To get the code:

```
git clone https://github.com/beyarkay/actual-evolution.git
```

To get factorio to recognise the code, you need to put everything in the `src/`
directory into a `factorio/mods/actual-evolution` folder. On MacOS this looks like:

```
cp -r actual-evolution/src/* "$HOME/Library/Application Support/factorio/mods/actual-evolution_0.1.0/"
```

I'm not sure about other systems.

