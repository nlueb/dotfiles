-- Checkout github.com/nvim-lua/kickstart.nvim for the source of these functions
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep({
      search_dirs = {git_root},
    })
  end
end

return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                "^backup/",
                "^undo/",
                "^swap/",
            }
        }
    },
    config = function(_, opts)
        local telescope = require 'telescope'
        telescope.setup(opts)
        telescope.load_extension('fzf')
        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
        -- vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
        vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files({ hidden = true, follow = true }) end, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>fG', live_grep_git_root, { desc = '[S]earch by [G]rep on Git Root' })
        vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    end
}
