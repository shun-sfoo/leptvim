.PHONY: install
install:
	git submodule update --init --depth 1 --recursive

.PHONY: update
update:
	git submodule update --remote --init --depth 1 --recursive

.PHONY: format
format:
	stylua $(pwd)/lua
