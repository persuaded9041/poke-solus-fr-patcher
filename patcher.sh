# clean previous patches
rm patches/**.bps &>/dev/null

# build runningshoes patches
cd poke-solus-fr-rse
git switch runningshoes
make RGBDS=../rgbds/
cd ..
./flips --create pokemonred.gb poke-solus-fr-rse/pokesolusred.gbc patches/pokesolus-rse-red.bps
./flips --create pokemonred.gb poke-solus-fr-rse/pokesolusgreen.gbc patches/pokesolus-rse-green.bps
./flips --create pokemonblue.gb poke-solus-fr-rse/pokesolusblue.gbc patches/pokesolus-rse-blue.bps
find poke-solus-fr-rse -type f -name "*.o" -delete
find poke-solus-fr-rse -type f -name "*.gbc" -delete
find poke-solus-fr-rse -type f -name "*.map" -delete
find poke-solus-fr-rse -type f -name "*.sym" -delete
find poke-solus-fr-rse -type f -name "*.pic" -delete
find poke-solus-fr-rse -type f -name "*.1bpp" -delete
find poke-solus-fr-rse -type f -name "*.2bpp" -delete

# build solus-fr patches
cd poke-solus-fr-rse
git switch solus-fr
make RGBDS=../rgbds/
cd ..
./flips --create pokemonred.gb poke-solus-fr-rse/pokesolusred.gbc patches/pokesolus-fr-red.bps
./flips --create pokemonred.gb poke-solus-fr-rse/pokesolusgreen.gbc patches/pokesolus-fr-green.bps
./flips --create pokemonblue.gb poke-solus-fr-rse/pokesolusblue.gbc patches/pokesolus-fr-blue.bps
find poke-solus-fr-rse -type f -name "*.o" -delete
find poke-solus-fr-rse -type f -name "*.gbc" -delete
find poke-solus-fr-rse -type f -name "*.map" -delete
find poke-solus-fr-rse -type f -name "*.sym" -delete
find poke-solus-fr-rse -type f -name "*.pic" -delete
find poke-solus-fr-rse -type f -name "*.1bpp" -delete
find poke-solus-fr-rse -type f -name "*.2bpp" -delete

# get back to master
cd poke-solus-fr-rse
git switch master
cd ..
