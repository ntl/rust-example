require_relative '../test_init'

context "Example Test" do
  test "Hello World (ruby)" do
    RustExample.hello_ruby
  end

  test "Hello World (rust)" do
    RustExample.hello_rust
  end
end
