local cursors = require 'vscode-multi-cursor'

vim.keymap.set({ 'n', 'x', 'i' }, '<c-d>', function()
    cursors.addSelectionToNextFindMatch()
end)

vim.keymap.set({ 'n', 'x', 'i' }, '<cs-d>', function()
    cursors.addSelectionToPreviousFindMatch()
end)

vim.keymap.set({ 'n', 'x', 'i' }, '<cs-l>', function()
    cursors.selectHighlights()
end)
