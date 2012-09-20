# ra

*a tool to manage multiple ruby installations for bash shells.*

```
$ ra @1.8.7 ruby -v  # execute using 1.8.7 rubie
$ ra @1.9.3          # set shell to 1.9.3 rubie
$ ra ruby -v         # execute using current `.ruby-version` rubie
$ ra                 # set shell to current `.ruby-version` rubie
```

Add this to your shell startup script to initialize.  This installs some bash tab completions.

```bash
eval "$(ra --init)"
```

There is an **automatic mode** that activates the current .ruby-version rubie as you change directories.  This involves overriding `cd` and is **optional**.  To enable, add the `--auto` flag to your shell startup script.

```bash
eval "$(ra --init --auto)"
```

## What It Does

**modifies env vars**: ra implements the ruby switching by modifying the `PATH`, `GEM_HOME` and `GEM_PATH` environment variables.

**explicit invocation**: execute commands using a specific rubie from the command line

**.ruby-version files**: supports specifying the rubie versions with `.ruby-version` files.

**tab completions**: tab complete version string parameters

**simple, focused**: doesn't do much other than change the variables mentioned above.

No non-bash shells, no gemsets, no installed rubie handling, etc.

It does one thing, well.

## Install

Download/clone the source

```
$ git clone git://github.com/rootedwest/ra.git
$ cd ra
```

Copy the `ra` executable to `/usr/local/bin` (specify an alternate location using the `PREFIX` env var).  Be sure `PREFIX` is in your `$PATH`.

```
$ ./install.sh
```

(optional) Add initialization to your shell startup script

```bash
eval "$(ra --init)"
```

If you want automatic handling, add the `--auto` flag

```bash
eval "$(ra --init --auto)"
```

### Install Rubies

An installed rubie should live in `$HOME/.ra/rubies/$VERSION`.  Install rubies any way you prefer; [ruby-build](https://github.com/sstephenson/ruby-build) is recommended.

## Using With `.ruby-version` Files

If no explicit @<verion> parameter is specified, ra will look for the version in a file named `.ruby-version` in your current directory and its parent directories, followed by your home directory

The `.ruby-version` files are expected to contain nothing but the rubie version requested

```
$ echo "1.9.3-p0" > $HOME/.ruby-version
$ ra ruby -v    # will use 1.9.3-p0
```

If the `@<version>` parameter is given, it will always override whatever versions are specified in available `.ruby-version` files.

## Using With Pow

Add a `.ruby-version` file to your project, as well as a `.powrc` file containing the following line (this will make Pow start up your project using ra using the rubie in the version file):

```bash
source ra
```

## Using The System Rubie

```
$ ra @system
```

## Uninstall

Delete the executable

```
$ rm /usr/local/bin/ra
```

Delete the `$HOME/.ra` dir (this will delete all installed rubies including all of their installed gems).

```
$ rm -rf $HOME/.ra
```

Finally, remove the `eval "$(ra --init)"` line from your shell startup script and reload your shell.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
