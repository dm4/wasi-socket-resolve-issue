## Reproduce Steps

```
git clone https://github.com/dm4/wasi-socket-resolve-issue.git
cd wasi-socket-resolve-issue
docker compose up -d
docker compose exec -it app bash

# in container
nslookup target-service
nslookup secondstate.io
wasmedge --env HOST_PORT=target-service:80 /socket-test.wasm
wasmedge --env HOST_PORT=secondstate.io:80 /socket-test.wasm
```
