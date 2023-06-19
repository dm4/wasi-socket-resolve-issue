FROM ubuntu:22.04

RUN apt update && \
    apt install -y \
        curl \
        git \
        dnsutils \
        python3
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash
COPY ./target/wasm32-wasi/debug/socket-test.wasm /

CMD ["/root/.wasmedge/bin/wasmedge", "/socket-test.wasm"]
