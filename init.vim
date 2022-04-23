" Default Configuration: vim-plug + general + plugins + key mapping configs.
"
" init.vimrc holds my vim-plug section, which initializes all my other plugins.
source $HOME/.config/nvim/config/init.vimrc
" general.vimrc holds a bunch of general settings which didn’t fit in the other categories.
source $HOME/.config/nvim/config/general.vimrc
" plugins.vimrc holds all my plugin-specific settings.
source $HOME/.config/nvim/config/plugins.vimrc
" keys.vimrc holds all my custom key-bindings.
source $HOME/.config/nvim/config/keys.vimrc
" line.vimrc holds my statusline configuration.
source $HOME/.config/nvim/config/line.vimrc
" lspsaga-config.vimrc holds my LSP Saga config 
" source $HOME/.config/nvim/config/lspsaga-config.vimrc

source $HOME/.config/nvim/plug-config/java-run.vimrc
" LSP: Language server protocol configurations.
" source $HOME/.config/nvim/plug-config/lsp-config.vim
" nvim-compe completion config file
" source $HOME/.config/nvim/plug-config/compe.vim

" LUA Plugins: Addos .lua configurations file.
luafile $HOME/.config/nvim/lua/plugins/lsp-config.lua
luafile $HOME/.config/nvim/lua/plugins/compe-config.lua
" luafile $HOME/.config/nvim/config/ftplugin/java.lua
" luafile $HOME/.config/nvim/lua/plugins/lspsaga-config.lua


" LUA LSP: Language lua config files for completion
" luafile $HOME/.config/nvim/lua/lsp/tsserver-ls.lua
" luafile $HOME/.config/nvim/lua/lsp/html-ls.lua
" luafile $HOME/.config/nvim/lua/lsp/css-ls.lua
" luafile $HOME/.config/nvim/lua/lsp/pyright.lua
