local code = require('vscode')

-- Tabs
vim.keymap.set("n", "<leader>1", function() code.action("workbench.action.openEditorAtIndex1") end)
vim.keymap.set("n", "<leader>2", function() code.action("workbench.action.openEditorAtIndex2") end)
vim.keymap.set("n", "<leader>3", function() code.action("workbench.action.openEditorAtIndex3") end)
vim.keymap.set("n", "<leader>4", function() code.action("workbench.action.openEditorAtIndex4") end)
vim.keymap.set("n", "<leader>5", function() code.action("workbench.action.openEditorAtIndex5") end)
vim.keymap.set("n", "<leader>6", function() code.action("workbench.action.openEditorAtIndex6") end)
vim.keymap.set("n", "<leader>7", function() code.action("workbench.action.openEditorAtIndex7") end)
vim.keymap.set("n", "<leader>8", function() code.action("workbench.action.openEditorAtIndex8") end)
vim.keymap.set("n", "<leader>9", function() code.action("workbench.action.openEditorAtIndex9") end)
-- vim.keymap.set("n", "<leader>0", ":tablast<cr>")
-- vim.keymap.set("n", "<C-w>", function() code.action("workbench.action.closeActiveEditor") end)

-- Telescope
vim.keymap.set("n", "<leader>f", function() code.action("workbench.action.quickOpen") end)

vim.keymap.set("n", "<leader>d", function() code.action("rust-analyzer.openDocs") end)