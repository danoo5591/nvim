local capabilities = require("lspconfig").capabilities
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/danilo/.workspace-java/' .. project_name
local jdtls = require "jdtls"

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
  root_dir = jdtls.setup.find_root({ '.git', 'mvnw', 'pom.xml','gradlew' }),
  on_attach = function(client, bufnr) lsp:on_attach(client, bufnr) end,
  -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = { java = {} },
  init_options = { bundles = {} },
}

jdtls.start_or_attach(config)
