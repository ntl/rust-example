#include <stdio.h>
#include <ruby.h>

extern char *rust_hello_world(void);

VALUE hello_rust(void) {
  char *hello = rust_hello_world();
  printf("%s\n", hello);

  return Qnil;
}

void Init_rust_example(void) {
  VALUE rust_example = rb_define_module("RustExample");

  rb_define_singleton_method(rust_example, "hello_rust", hello_rust, 0);
}
