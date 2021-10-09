# allows running lua rocks directly
export PATH := lua_modules/bin:$(PATH)

# allows running rust crates directly
export PATH := rust_modules/bin:$(PATH)

init: setup-git-hooks install-deps

setup-git-hooks:
	git config core.hooksPath .githooks

install-lua-deps:
	luarocks --tree=lua_modules install luacheck
	luarocks --tree=lua_modules --server=https://luarocks.org/dev install luaformatter

install-rust-deps:
	cargo install stylua --root rust_modules
	cargo install selene --root rust_modules

install-node-deps:
	npm i

install-deps: install-lua-deps install-rust-deps install-node-deps

stylua:
	stylua lua/ataraxis

luacheck:
	luacheck --config .luacheckrc ./lua/**/*.lua

luaformatter:
	lua-format -i lua/ataraxis/*.lua

selene:
	selene lua/ataraxis

lint: stylua luacheck luaformatter selene
