#!/usr/bin/env bash
set -e

tempfile=/tmp/dotfiles.zip
workspace=/tmp/dotfiles

# Download zipped installer
curl -LSfs -o ${tempfile} https://github.com/rejasupotaro/dotfiles/archive/master.zip

# Unzip installer into workspace
unzip -oq ${tempfile} -d ${workspace}

# Move to repository root path
pushd ${workspace}/dotfiles-master > /dev/null

# Run installer
bin/install

# Move to original path
popd > /dev/null

# Cleanup
rm -rf ${tempfile} ${workspace}
