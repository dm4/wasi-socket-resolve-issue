FROM rust AS build
WORKDIR /app
RUN rustup target add wasm32-wasi
COPY . /app/
RUN cargo build --target wasm32-wasi

FROM ubuntu:22.04
RUN apt update && \
    apt install -y \
        curl \
        git \
        dnsutils \
        python3
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash
COPY --link --from=build /app/target/wasm32-wasi/debug/socket-test.wasm /
CMD ["/root/.wasmedge/bin/wasmedge", "/socket-test.wasm"]
