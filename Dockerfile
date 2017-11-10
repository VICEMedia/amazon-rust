FROM amazonlinux

ENV PATH=/usr/local/cargo/bin:$PATH \
    CARGO_HOME=/usr/local/cargo \
    RUSTUP_HOME=/usr/local/rustup

RUN yum update -y \
    && yum install -y gcc g++ git make openssl-devel \
    && curl https://sh.rustup.rs -sSf | sh -s -- \
        --default-toolchain nightly \
        --no-modify-path \
        -y \
    && cargo install cargo-make \
    && cargo install cargo-watch \
    && cargo install clippy \
    && cargo install rustfmt-nightly \
    && yum clean all
