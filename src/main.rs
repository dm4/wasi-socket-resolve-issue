use wasmedge_wasi_socket::ToSocketAddrs;

fn main() {
    let host_port = match std::env::var("HOST_PORT") {
        Ok(var) => var,
        Err(_) => "localhost:3306".to_string(),
    };
    println!("HOST_PORT {}", host_port);
    match host_port.to_socket_addrs() {
        Err(e) => eprintln!("Err {:?}", e),
        Ok(s) => println!("Ok {:?}", s),
    }
}
