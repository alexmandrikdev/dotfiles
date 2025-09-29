if vim.g.vscode then
    require("vscode-config.options")
    require("vscode-config.lazy")
    require("vscode-config.keymaps")
else
    require("config.options")
    require("config.keymaps")
    require("config.lazy")
end
