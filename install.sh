#!/bin/sh

set -e

# set the bin path
if [ -z "${PREFIX}" ]; then
  PREFIX="/usr/local"
fi
BIN_PATH="${PREFIX}/bin"

# make the bin path
mkdir -p "${BIN_PATH}"

# copy binaries
for file in bin/*; do
  cp "${file}" "${BIN_PATH}"
done

# done!
echo "Installed at ${BIN_PATH}"
