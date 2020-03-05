#!/bin/sh

RB_RELEASE='1.0.5-test1'

# check uncommitted changes

      if ! git diff-index --quiet HEAD --; then
        echo "There are files that need to be committed first."
      else
        # tag the release

              if git tag -a -m "Release $RB_RELEASE" "$RB_RELEASE"; then
                echo "Tagged $RB_RELEASE release."

        # push the changes and tags

                if git push && git push --tags; then
                  echo "Pushed git commits and tags"
                else
                  echo "Release aborted."
                fi
              else
                echo "Release aborted."
              fi
      fi
