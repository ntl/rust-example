# Rust Example Project

An example rust project. Contains a ruby native extension and test suite written in ruby, using [Test Bench](https://github.com/ntl/test-bench).

## Setting up Project

    bin/setup

## Compiling Rust Library

    cargo clean
    cargo build --release

## Building Ruby Native Extension

    cp target/release/librust_example.a rubygem/ext/rust_example/

    ruby -C rubygem/ext/rust_example extconf.rb

    make -C rubygem/ext/rust_example clean all

## Automated compilation via make

Incremental compilation:

    make

Full recompile:

    make recompile

## Testing

See help:

    bin/test --help

Run all tests:

    bin/test
