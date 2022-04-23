local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

    buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
    buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})
    buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
    buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
    buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>",{silent = true})


    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> LspFormatting
         augroup END
         ]], true)
    end


    -- protocol.CompletionItemKind = {
        -- '', -- Text
        -- '', -- Method
        -- '', -- Function
        -- '', -- Constructor
        -- '', -- Field
        -- '', -- Variable
        -- '', -- Class
        -- 'ﰮ', -- Interface
        -- '', -- Module
        -- '', -- Property
        -- '', -- Unit
        -- '', -- Value
        -- '', -- Enum
        -- '', -- Keyword
        -- '﬌', -- Snippet
        -- '', -- Color
        -- '', -- File
        -- '', -- Reference
        -- '', -- Folder
        -- '', -- EnumMember
        -- '', -- Constant
        -- '', -- Struct
        -- '', -- Event
        -- 'ﬦ', -- Operator
        -- '', -- TypeParameter
      -- }

end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
--[[ capabilities.textDocument.codeAction = {
   [     dynamicRegistration = true,
   [     codeActionLiteralSupport = {
   [         codeActionKind = {
   [             valueSet = (function()
   [                 local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
   [                 table.sort(res)
   [                 return res
   [             end)()
   [         }
   [     }
   [ } ]]

capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "html", "tsserver", "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end


nvim_lsp["clangd"].setup {
    cmd = { "clangd-13" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    on_attach = on_attach ,
    capabilities = capabilities
}


nvim_lsp["cssls"].setup {
    cmd = { "css-languageserver", "--stdio" },
    filetypes = { "css", "scss", "less" },
    settings = {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    },
    on_attach = on_attach,
    capabilities = capabilities
} 




local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/danilo/.workspace-java/' .. project_name
local config = {
  capabilities = capabilities,
  flags = { debounce_text_changes = 500 },
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/home/danilo/.local/opt/jdtls-launcher/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/home/danilo/.local/opt/jdtls-launcher/jdtls/config_linux',
    '-data', '/home/danilo/' .. workspace_dir,
  },
  root_dir = nvim_lsp.util.root_pattern('.git', 'mvnw', 'pom.xml','gradlew'),
  on_attach = on_attach,
  -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = { java = {} },
  init_options = { bundles = {} },
}
-- Jdtls Java LSP set-up
nvim_lsp["jdtls"].setup(config)




-- local pylance = require('pylance')
-- pylance.setup()
-- nvim_lsp.pylance.setup({
	-- -- https://github.com/microsoft/pylance-release#settings-and-customization
	-- settings = {
		-- python = {
			-- analysis = {
				-- indexing = true,
				-- typeCheckingMode = 'basic',
			-- }
		-- }
	-- },
	-- on_attach = on_attach,
	-- capabilities = capabilities
-- })


-- nvim_lsp.diagnosticls.setup {
  -- on_attach = on_attach,
  -- filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  -- init_options = {
    -- linters = {
      -- eslint = {
        -- command = 'eslint_d',
        -- rootPatterns = { '.git' },
        -- debounce = 100,
        -- args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        -- sourceName = 'eslint_d',
        -- parseJson = {
          -- errorsRoot = '[0].messages',
          -- line = 'line',
          -- column = 'column',
          -- endLine = 'endLine',
          -- endColumn = 'endColumn',
          -- message = '[eslint] ${message} [${ruleId}]',
          -- security = 'severity'
        -- },
        -- securities = {
          -- [2] = 'error',
          -- [1] = 'warning'
        -- }
      -- },
    -- },
    -- filetypes = {
      -- javascript = 'eslint',
      -- javascriptreact = 'eslint',
      -- typescript = 'eslint',
      -- typescriptreact = 'eslint',
    -- },
    -- formatters = {
      -- eslint_d = {
        -- command = 'eslint_d',
        -- args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        -- rootPatterns = { '.git' },
      -- },
      -- prettier = {
        -- command = 'prettier',
        -- args = { '--stdin-filepath', '%filename' }
      -- }
    -- },
    -- formatFiletypes = {
      -- css = 'prettier',
      -- javascript = 'eslint_d',
      -- javascriptreact = 'eslint_d',
      -- json = 'prettier',
      -- scss = 'prettier',
      -- less = 'prettier',
      -- typescript = 'eslint_d',
      -- typescriptreact = 'eslint_d',
      -- json = 'prettier',
      -- markdown = 'prettier',
      -- html = 'prettier'
    -- }
  -- }
-- }
--

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

-- Telescope config
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

