#!/bin/sh

set -e
RB_HOME_DIR=".rb"
RB_RELEASE="beta1"

# TODO: pull from the appropriate tag
# clone the repo (overwriting existing, pulling from release tag)

      pushd "$HOME" > /dev/null && rm -rf "$RB_HOME_DIR" && git clone git://github.com/rootedwest/rb.git "$RB_HOME_DIR" && popd > /dev/null

# add the binpath

      [ -n "$PREFIX" ] || PREFIX="/usr/local"
      BIN_PATH="$PREFIX/bin"
      mkdir -p "$BIN_PATH"

# link in the binary

      ln -sf "$HOME/$RB_HOME_DIR/libexec/rb" "$BIN_PATH"

# done!

      echo "Installed at ${BIN_PATH}/rb"
