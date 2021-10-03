# allows running lua modules directly
export PATH := lua_modules/bin:$(PATH)

init: setup-git-hooks install-lua-deps

setup-git-hooks:
	git config core.hooksPath .githooks

install-lua-deps:
	luarocks --tree=lua_modules install --only-deps ataraxis-dev-1.rockspec

lint:
	luacheck --config .luacheckrc ./lua/**/*.lua
