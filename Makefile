STATIC_LIBRARY = librust_example.a

RUBY_LIBRARY_NAME = rust_example
RUBY_EXT_DIR = rubygem/ext/$(RUBY_LIBRARY_NAME)
RUBY_MAKEFILE = $(RUBY_EXT_DIR)/Makefile
RUBY_SHARED_OBJECT = $(RUBY_EXT_DIR)/$(RUBY_LIBRARY_NAME).so

compile: cargo-build $(RUBY_SHARED_OBJECT)

$(RUBY_SHARED_OBJECT): $(RUBY_MAKEFILE)
	make -C $(RUBY_EXT_DIR) all

$(RUBY_MAKEFILE): $(RUBY_EXT_DIR)/$(STATIC_LIBRARY)
	ruby -C $(RUBY_EXT_DIR) extconf.rb

$(RUBY_EXT_DIR)/$(STATIC_LIBRARY): cargo-build
	cp -v target/release/$(STATIC_LIBRARY) $(RUBY_EXT_DIR)/$(STATIC_LIBRARY)

recompile: clean compile

cargo-build:
	cargo build --release

clean:
	cargo clean
	rm -rf target/release
	test -f $(RUBY_MAKEFILE) && make -C $(RUBY_EXT_DIR) clean
	rm -f $(RUBY_MAKEFILE) $(RUBY_SHARED_OBJECT)
