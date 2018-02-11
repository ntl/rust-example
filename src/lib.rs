#[no_mangle]
pub extern "C" fn rust_hello_world() -> *const u8 {
  "Hello, world (rust)!\0".as_ptr()
}
