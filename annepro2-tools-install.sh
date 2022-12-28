# Create the standard environment.
source $stdenv/setup
# Create place to store the binaries.
mkdir -p $out/bin
# Copy the binary to the output binary directory.
cp $src $out/bin/annepro2_tools
# Allow execution of the binary.
chmod +x $out/bin/annepro2_tools
