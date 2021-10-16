# allows running lua rocks directly
export PATH := lua_modules/bin:$(PATH)

# allows running rust crates directly
export PATH := bin_modules:$(PATH)

selene_version = 0.14.0
stylua_version = 0.11.0

init: setup-git-hooks install-deps

setup-git-hooks:
	git config core.hooksPath .githooks

install-lua-deps: install-luaformatter
	luarocks --tree lua_modules install luacheck

install-luaformatter:
	curl \
		--create-dirs \
		--output-dir bin_modules \
		-O \
		-L \
		-S \
		https://github.com/Koihik/vscode-lua-format/raw/master/bin/linux/lua-format && \
	chmod +x bin_modules/lua-format

install-rust-deps: install-stylua install-selene

install-stylua:
	curl \
		--create-dirs \
		--output-dir bin_modules \
		-O \
		-L \
		-S \
		https://github.com/JohnnyMorganz/StyLua/releases/download/v${stylua_version}/stylua-${stylua_version}-linux.zip && \
	unzip bin_modules/stylua-${stylua_version}-linux.zip -d bin_modules && \
	rm bin_modules/stylua-${stylua_version}-linux.zip && \
	chmod +x bin_modules/stylua

install-selene:
	curl \
		--create-dirs \
		--output-dir bin_modules \
		-O \
		-L \
		-S \
		https://github.com/Kampfkarren/selene/releases/download/${selene_version}/selene-light-${selene_version}-linux.zip && \
	unzip bin_modules/selene-light-${selene_version}-linux.zip -d bin_modules && \
	rm bin_modules/selene-light-${selene_version}-linux.zip && \
	chmod +x bin_modules/selene

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

lint: luacheck selene

style: stylua luaformatter
