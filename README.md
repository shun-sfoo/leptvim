# basic plugins

- [x] nvim-lspconfig `git submodule add --name nvim-lspconfig -b master --depth 1 https://github.com/neovim/nvim-lspconfig pack/plugins/opt/nvim-lspconfig`

- [x] nvim-treesitter `git submodule add --name nvim-treesitter -b master --depth 1 https://github.com/nvim-treesitter/nvim-treesitter pack/plugins/opt/nvim-treesitter`

- [x] mini.nvim `git submodule add --name mini.nvim -b main --depth 1 https://github.com/echasnovski/mini.nvim pack/plugins/opt/mini.nvim`

## Add new plugin

```bash
git submodule add --name telescope-fzy-native -b <branch-to-track> --depth 1 https://github.com/nvim-telescope/telescope-fzy-native.nvim pack/plugins/opt/telescope-fzy-native

# Ensure that all submodules of plugin are also downloaded
git submodule update --init --depth 1 --recursive
```

## Delete plugin

```
submodule_name="telescope-fzy-native"
submodule_path="pack/plugins/opt/$submodule_name"

# Unregister submodule (this also empties plugin's directory)
git submodule deinit -f $submodule_path

# Remove the working tree of the submodule
git rm --cached $submodule_path

# Remove relevant section from '.gitmodules'
git config -f .gitmodules --remove-section "submodule.$submodule_name"

# Remove submodule's (which should be empty) directory from file system
rm -r $submodule_path

# Remove associated submodule directory in '.git/modules'.
git_dir=`git rev-parse --git-dir`
rm -rf $git_dir/modules/$submodule_path

# Optionally: add and commit changes
git add .
git commit -m "Remove $submodule_path plugin."
```
