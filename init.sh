# clone poke-solus-fr-rse
git submodule init 
git submodule update

# Download the latest release of Flips
curl -s https://api.github.com/repos/Alcaro/Flips/releases/latest | awk -F\" '/browser_download_url.*.flips-linux.zip/{system("curl -OL " $(NF-1))}'
# Decompress the build of Flips
unzip -o -j flips-linux.zip "builds/linux-x64-gui.zip/flips"
chmod u+x flips

# Download the latest release of rgbds
curl -s https://api.github.com/repos/gbdev/rgbds/releases/latest | awk -F\" '/browser_download_url.*.tar.xz/{system("curl -OL " $(NF-1))}'
# Decompress the release into a 'rgbds' folder
tar -xvf rgbds-*.tar.xz --one-top-level=rgbds
