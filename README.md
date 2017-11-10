# amazon-rust

[![Docker Stars](https://img.shields.io/docker/pulls/vice/amazon-rust.svg?style=flat-square)](https://github.com/VICEMedia/amazon-rust)

A thin [Rust](https://www.rust-lang.org/) layer on top of the official [Amazon Linux](https://hub.docker.com/_/amazonlinux/) docker image. Suitable for both local development and continuous deployment/integration workflows. Perfect for pre-building building binaries that target various [AWS](https://aws.amazon.com) services.

## Usage

In most cases you can get away with running the following in the root of your crate:

```sh
docker pull vicemedia/amazon-rust
docker run -t vicemedia/amazon-rust cargo run
```

If are compiling against nightly you can alternatively run:

```sh
docker run -t vicemedia/amazon-rust cargo +nightly run
```

You can also further customize your environment with a [Dockerfile](https://docs.docker.com/engine/reference/builder):

```Dockerfile
FROM vice/amazon-rust

# Set the default toolchain to nightly.
RUN rustup default nightly

# Copy your crate's source code into the container.
COPY . /usr/src/app

# Set the container's working directory to root of your crate.
WORKDIR /usr/src/app

# Create a mount point to the working directory.
VOLUME ["/usr/src/app"]

# Execute `cargo run` when files are changed.
CMD ["cargo", "watch", "-x", "run"]
```

## Pre-Installed Software

This docker image favors convenience over image size. The following system dependencies and cargo plugins are pre-installed:

#### System Dependencies

- GCC/G++
- Git
- Make
- OpenSSL

#### Cargo Plugins

- [cargo-make](https://crates.io/crates/cargo-make)
- [cargo-watch](https://crates.io/crates/cargo-watch)
- [clippy](https://crates.io/crates/clippy)
- [rustfmt-nightly](https://crates.io/crates/rustfmt-nightly)
