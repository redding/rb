#!/bin/sh

RB_RELEASE='1.0.1'

# check uncommitted changes

      if ! git diff-index --quiet HEAD --; then
        echo "There are files that need to be committed first." && return 1
      fi

# tag the release

      if git tag -a -m "Release $RB_RELEASE" "$RB_RELEASE"; then
        echo "Tagged $RB_RELEASE release."

# push the changes and tags

        git push
        git push --tags

        echo "Pushed git commits and tags"
      else
        echo "Release aborted."
      fi


