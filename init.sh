# clone poke-solus-fr
git submodule init 
git submodule update

# Download the latest release of Flips
curl -s https://api.github.com/repos/Alcaro/Flips/releases/latest | awk -F\" '/browser_download_url.*.flips-linux.zip/{system("curl -OL " $(NF-1))}'
# Decompress the build of Flips
unzip -j flips-linux.zip "$(unzip -Z1 flips-linux.zip | grep -E '(^|/)flips$')" -d .
chmod u+x flips

# Download the latest release of rgbds
curl -s https://api.github.com/repos/gbdev/rgbds/releases/latest | awk -F\" '/browser_download_url.*.tar.xz/{system("curl -OL " $(NF-1))}'
# Decompress the release into a 'rgbds' folder
tar -xvf rgbds-*.tar.xz --one-top-level=rgbds
