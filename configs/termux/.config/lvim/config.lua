-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvimjj
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

lvim.plugins = {
    'Mofiqul/vscode.nvim',

  {
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },
}

-- Define a function to toggle auto-save
function ToggleAutoSave()
  if vim.g.auto_save_enabled == nil then
    vim.g.auto_save_enabled = false
  end

  if vim.g.auto_save_enabled then
    -- Disable auto-save
    vim.cmd("autocmd! TextChanged,TextChangedI")
    vim.g.auto_save_enabled = false
    print("Auto-save disabled")
  else
    -- Enable auto-save
    vim.cmd("autocmd TextChanged,TextChangedI * silent write")
    vim.g.auto_save_enabled = true
    print("Auto-save enabled")
  end
end

-- Create a command to toggle auto-save
vim.api.nvim_create_user_command('AS', ToggleAutoSave, {})


lvim.colorscheme = "vscode"


-- Settings in LunarVim configuration
vim.opt.timeoutlen = 100  -- Faster key repeat for movements
vim.opt.ttimeoutlen = 0   -- Disable terminal key sequence delay

lvim.lsp.automatic_servers_installation = false
-- lvim.lsp.automatic_configuration.skipped_servers /
--
-- add `pyright` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver", "typescript-language-server" })
-- remove `jedi_language_server` from `skipped_servers` lis


lvim.keys.insert_mode["<C-l>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>"

-- In lv-config.lua
-- lvim.keys.normal_mode["<leader>r"] = ":w<CR>:!g++ % -o %< && ./%<<CR>"
lvim.keys.normal_mode["<leader>r"] = ":w<CR>:!cd .. && mkdir -p build && gcc -Iinclude -o build/out $(find src/ -name '*.c') && ./build/out && cd ./src<CR>"
