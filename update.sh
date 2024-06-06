#!/bin/bash

# Ensure the script exits if any command fails
set -e

# Define the directory containing .deb files
DEB_DIR="./debs"

# Generate the Packages file
dpkg-scanpackages -m "$DEB_DIR" > Packages

# Compress the Packages file
bzip2 -fks Packages
gzip -fk Packages

# Create the Release file
cat <<EOF > Release
Origin: YourRepoName
Label: YourRepoName
Suite: stable
Version: 1.0
Codename: yourrepo
Architectures: iphoneos-arm
Components: main
Description: YourRepoDescription
EOF
