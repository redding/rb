## 1.0.1 / 2013-08-29

* simpler `--auto` implementation (#35)

## 1.0.0 / 2013-08-29

* 1.0 release - no changes from 1.0.0.rc2

## 1.0.0.rc2 / 2013-03-08

* handling reworks (#33)
 * only output status info if both the version and source are not empty
 * have rb print the status if no args are given
 * move global .ruby-version file to `"$RB_HOME_DIR"`
 * fix for a bug in looking up the parent .ruby-version file
 * rework handling when a command line version is specified

## 1.0.0.rc1 / 2013-03-04

* quiet mode - added a `--quiet` flag to the init command (#32)
* `exec` command - execute a command using a specific ruby version (#31)
* change auto handling to use the `PROMPT_COMMAND` env var (#30)
* set RUBY_ROOT env var (#29)
* resolve ruby versions symlinks when applying to the env (#28)
* more succinct help msg (#27)

## beta3 / 2013-02-27

* list cmd to show available versions, marking the currently active version (#25)
* status cmd to print current ruby version and source info (#24)
* include the release in the local install dir name (#22)
* `-f` option to specify version files to use (#13)
* reset the env when activating from the `rb` cli (#9)
* remove all whitespace when reading version string from files (#16)
* added a changelog (#15)

## beta2 / 2012-09-25

* bug fix for install script

## beta1 / 2012-09-25

* install/uninstall scripts

## alpha1 / 2012-09-25

* help cmd
* init cmd, auto mode
* .ruby-version file support
* basic activation
