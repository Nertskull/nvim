#if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here


-- Read this: https://github.com/AstroNvim/AstroNvim/issues/344
--  and this: https://github.com/AstroNvim/AstroNvim/issues/648
--  to get the neo-tree to open on startup
  
-- old, not using now
--    vim.api.nvim_create_augroup("neotree", {})
--    vim.api.nvim_create_autocmd("UiEnter", {
--      desc = "Open Neotree automatically",
--      group = "neotree",
--      callback = function()
--          vim.cmd "Neotree toggle"
--      end,
--    })
  
-- Working to get neo-tree to open correctly on startup
vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("BufRead", { -- Changed from BufReadPre
  desc = "Open neo-tree on enter",
  group = "neotree_autoopen",
  once = true,
  callback = function()
    if not vim.g.neotree_opened then
      vim.cmd "Neotree show"
      vim.g.neotree_opened = true
    end
  end,
})
