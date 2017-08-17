# Where Would I Even Start?: Compilers

This repository contains a simple interpreter for algebraic expressions, built to demonstrate some core compiler concepts. This is a companion to the [blog post I wrote](link don't exist yet).


## Installation

You will need [Crystal](https://crystal-lang.com) installed, which can easily be done on the command line. Installing with `brew` is as simple as running `brew install`:

```bash
brew install crystal-lang
```

Installing on linux depends on your distribution, so check the [installation guide](https://crystal-lang.org/docs/installation/) for more information.

With Crystal installed, getting this project installed is as simple as a `git clone`:

```bash
git clone https://github.com/faultyserver/compilers-intro
```


## Usage

With the project installed locally, running the interpreter is as simple as running `crystal run`:

```bash
crystal run src/runner.cr
```

You can also build a standalone binary to run at anytime with `crystal build`:

```bash
crystal build src/runner.cr
# Then later on, run it
./runner
```

To change the input to the interpreter, edit the string passed to `Parser.new` in `runner.cr`, then rerun/rebuild.


## Development

I don't expect this repository to change much, as it is just demonstrating initial concepts.


## Contributing

1. Fork it ( https://github.com/faultyserver/compilers-intro/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Contributors

- [faultyserver](https://github.com/faultyserver) Jon Egeland - creator, maintainer
