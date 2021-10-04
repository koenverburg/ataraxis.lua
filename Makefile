# allows running lua modules directly
export PATH := lua_modules/bin:$(PATH)

# allows running rust crates directly
export PATH := rust_modules/bin:$(PATH)

init: setup-git-hooks install-lua-deps install-rust-deps

setup-git-hooks:
	git config core.hooksPath .githooks

install-lua-deps:
	luarocks --tree=lua_modules install --only-deps ataraxis-dev-1.rockspec

install-rust-deps:
	cargo install stylua --root rust_modules

stylua:
	stylua lua/ataraxis

lint:
	luacheck --config .luacheckrc ./lua/**/*.lua
