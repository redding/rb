#!/bin/sh

set -e

RB_HOME_DIR="$HOME/.rb"
RB_RUBIES_DIR="$HOME/.rubies"
RB_RELEASE="1.0.5"

# make sure the bin path is in place

      [ -n "$PREFIX" ] || PREFIX="/usr/local"
      BIN_PATH="$PREFIX/bin"
      mkdir -p "$BIN_PATH"

# download the release tag and link to the bin path

      mkdir -p "$RB_HOME_DIR"
      pushd "$RB_HOME_DIR" > /dev/null &&
        rm -rf "rb-$RB_RELEASE"
        curl -L "https://github.com/redding/rb/tarball/$RB_RELEASE" | tar xzf - "*/libexec/*"
        mv *-rb-* "rb-$RB_RELEASE"
        ln -sf "rb-$RB_RELEASE/libexec"
      popd > /dev/null

# install in the bin path

      ln -sf "$RB_HOME_DIR/libexec/rb" "$BIN_PATH"

# make the rubies dir

      mkdir -p "$RB_RUBIES_DIR"

# done!

      echo "Installed at ${BIN_PATH}/rb"
