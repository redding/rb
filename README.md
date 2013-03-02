# rb

```
$ rb @1.9.3 && ruby -v                           # activate '1.9.3' install
$ echo 'ree' > ./.ruby-version && rb && ruby -v  # activate current `.ruby-version` ('ree') install
$ rb @system && ruby -v                          # activate system install
$ rb help
```

Activate installed Ruby versions.

## What It Does...

**modifies env vars**: activates versions by modifying the `PATH`, `GEM_HOME` and `GEM_PATH` env vars.  To accomplish this, it...

**adds functions to your shell**: for activating, resetting, and the CLI.  These are needed to modify shell env vars.

**.ruby-version files**: supports specifying versions with `.ruby-version` files.

**auto mode**: (optional) update the version when you `cd` to a directory containing a `.ruby-version` file (does not hook `cd`).

**tab completions**: version string parameters, commands, etc.

**simple, focused**: it activates installed rubies.

## Rubies

Each installed version of ruby should live in `$HOME/.rubies/<version>`.  Install versions any way you prefer; [ruby-build](https://github.com/sstephenson/ruby-build) is recommended.

## Install

Open a terminal and run this command ([view source](http://git.io/rb--install)):

```
$ curl -L http://git.io/rb--install | sh
```

Add rb init to your shell startup script.  This installs tab completions and enables modifying the env vars.

```bash
eval "$(rb init)"
```

(optional) If you want automatic handling, add the `--auto` flag.  In additon to the normal init above, `$PROMPT_COMMAND` is updated to activate any new ruby version as you change directories.  **Again, this is optional.**

```bash
eval "$(rb init --auto)"
```

## Usage

```
$ rb help
```

### System Rubie

```
$ rb @system
```

### `.ruby-version` Files

```
$ echo "1.9.3-p0" > $HOME/.ruby-version
$ cd $HOME && rb && ruby -v  # 1.9.3-p0
```

If no explicit @<verion> parameter is specified, rb will look for the version in a file named `.ruby-version` in your current directory, its parent directories, or your home directory.  The `.ruby-version` files are expected to contain nothing but the installation requested.

```
$ cd $HOME
$ echo 'ree-1.8.7-2012.02' > /a/path/to/.ruby-version
$ rb -f /a/path/to/.ruby-version
$ ruby -v          # will use ree-1.8.7-2012.02
```

You can specify a ruby version file using the `-f` option.  This allows you to specify a version file to use without having to cd there first.

**Note**: If an `@<version>` parameter is given, it will always override any versions specified in `.ruby-version` files.

### Pow

Add a `.ruby-version` file to your project, as well as a `.powrc` file containing the following line (this will make Pow start up your project using the install in the version file):

```bash
source `which rb`
```

## Uninstall

Open a terminal and run this command ([view source](http://git.io/rb--uninstall)):

```
$ curl -L http://git.io/rb--uninstall | sh
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
