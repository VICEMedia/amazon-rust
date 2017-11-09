FROM amazonlinux

ENV PATH /root/.cargo/bin:$PATH

RUN yum update -y \
    && yum install -y gcc g++ git make openssl-dev \
    && curl https://sh.rustup.rs -sSf | bash -s -- -y --default-toolchain nightly \
    && cargo install cargo-make \
    && cargo install cargo-watch \
    && cargo install rustfmt-nightly \
    && yum clean all

COPY . /usr/src/api-keys
WORKDIR /usr/src/api-keys

VOLUME ["/usr/src/api-keys"]

ENTRYPOINT ["scripts/entry.sh"]
