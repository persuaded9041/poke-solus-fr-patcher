# Automated patch creator for poke-solus-fr-rse

## Prerequisites

You will need the US versions of Pokémon Red and Blue in the root folder of this project, named:

- `pokemonred.gb`
- `pokemonblue.gb`

## Initialize the project

Grant execution permissions to the `init.sh` and `patcher.sh` files:

```bash
chmod u+x init.sh
chmod u+x patcher.sh
```

Initialize the project by running `init.sh`:

```bash
./init.sh
```

This will:
- Clone the `poke-solus-fr-rse` repository
- Download the latest version of `rgbds` (to build the GBC files)
- Download the latest version of `flips` (to generate patches)

## Generate the patches

Run the `patcher.sh` script:

```bash
./patcher.sh
```

The patches will be generated in the `patches` folder.
