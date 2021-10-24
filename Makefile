.DEFAULT_GOAL := init

init: setup-git-hooks get-lua-lint-docker-img get-commitlint-docker-img

setup-git-hooks:
	git config core.hooksPath .git-hooks

get-lua-lint-docker-img:
	docker pull henriquehbr/lua-lint-tools

get-commitlint-docker-img:
	docker pull henriquehbr/commitlint

lint:
	docker run --rm -v $(PWD):/app henriquehbr/lua-lint-tools

lint-commit-msg:
	docker run --rm -i -v $(PWD):/app henriquehbr/commitlint
