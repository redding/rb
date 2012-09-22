# rb: The Ruby Auto Activator

~~ Manage Multiple Rubies ~~

```
$ rb @1.8.7 ruby -v  # execute using 1.8.7 install
$ rb @1.9.3          # set shell to 1.9.3 install
$ rb ruby -v         # execute using current `.ruby-version` install
$ rb                 # set shell to current `.ruby-version` install
$ rb --help
```

Add this to your shell startup script to initialize.  This installs some bash tab completions.

```bash
eval "$(rb --init)"
```

There is the **auto mode** that modifies your shell session when you `cd` into a directory containing a .ruby-version file.  This involves overriding `cd` and is **optional**.  To enable, add the `--auto` flag to your shell startup script.

```bash
eval "$(rb --init --auto)"
```

## What It Does

**modifies env vars**: activates installs by modifying the `PATH`, `GEM_HOME` and `GEM_PATH` env vars.

**explicit invocation**: executes commands using a specific install from the command line

**.ruby-version files**: supports specifying installs with `.ruby-version` files.

**tab completions**: tab completes version string parameters

**simple, focused**: it activates installations - well.

## Install

Download/clone the source, run the install script

```
$ git clone git://github.com/rootedwest/rb.git
$ cd rb && ./install.sh
```

(optional) Add initialization to your shell startup script

```bash
eval "$(rb --init)"
```

If you want automatic handling, add the `--auto` flag

```bash
eval "$(rb --init --auto)"
```

### Install Rubies

An installed version should live in `$HOME/.rubies/$VERSION`.  Install versions any way you prefer; [ruby-build](https://github.com/sstephenson/ruby-build) is recommended.

## Usage

```
$ rb --help
The Ruby Auto Activator (release ...)
~~ Manage Multiple Rubies ~~

  Usage:
    rb [@<version>] [command]"
    rb --init [--auto]"
    rb --help"
    rb --version

  More Info:
    https://github.com/rootedwest/rb

```

### Using With `.ruby-version` Files

If no explicit @<verion> parameter is specified, it will look for the version in a file named `.ruby-version` in your current directory and its parent directories, followed by your home directory

The `.ruby-version` files are expected to contain nothing but the install version requested.

```
$ echo "1.9.3-p0" > $HOME/.ruby-version
$ rb ruby -v    # will use 1.9.3-p0
```

If the `@<version>` parameter is given, it will always override whatever versions are specified in available `.ruby-version` files.

### Using With Pow

Add a `.ruby-version` file to your project, as well as a `.powrc` file containing the following line (this will make Pow start up your project using the install in the version file):

```bash
source rb
```

### Using The System Rubie

```
$ rb @system
```

## Uninstall

Delete the executable

```
$ rm /usr/local/bin/rb
```

** Optional ** Delete the `$HOME/.rubies` dir (this will delete all installed versions including all of their gems).

```
$ rm -rf $HOME/.rubies
```

Finally, remove the `eval "$(rb --init)"` line from your shell startup script and reload your shell.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
