#!/bin/sh

set -e
RB_HOME_DIR=".rb"

# remove the bin

      [ -n "$PREFIX" ] || PREFIX="/usr/local"
      BIN_PATH="$PREFIX/bin"
      rm -f "$BIN_PATH/rb" > /dev/null

# remove the installed source

      pushd "$HOME" > /dev/null && rm -rf "$RB_HOME_DIR" && popd > /dev/null

# done!  print out some optional removal instructions

      echo "Done.\n"
      echo "Be sure to remove the \`eval \"\$(rb init)\"\` line from your shell startup script and reload your shell!\n"
      echo "Optional: \`rm -rf $HOME/.rubies\` (this will remove all installed ruby versions including all of their gems)."
