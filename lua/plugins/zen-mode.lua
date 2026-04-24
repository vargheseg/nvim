return {
 {"folke/zen-mode.nvim",
   opts = {
     -- Your configuration goes here
     window = {
       backdrop = 0.95,      -- shade the background (1 = no shade)
       width = 120,          -- width of the Zen window (can be a number or "80%" or function)
       height = 1,           -- height (1 = full height)
       options = {
         signcolumn = "no",        -- disable signcolumn
         number = false,           -- disable line numbers
         relativenumber = false,   -- disable relative numbers
         cursorline = false,       -- disable cursor line
         cursorcolumn = false,     -- disable cursor column
         foldcolumn = "0",         -- disable folding
         list = false,             -- disable whitespace characters
       },
     },

     plugins = {
       options = {
         enabled = true,
         ruler = false,            -- disables the ruler text in the cmd line area
         showcmd = false,          -- disables the command in the last line
       },
       twilight = { enabled = true },   -- dim inactive portions (requires twilight.nvim)
       gitsigns = { enabled = false },  -- disable git signs
       tmux = { enabled = false },      -- hide tmux status
       alacritty = { enabled = true },     -- if you use kitty terminal
       -- WezTerm, Alacritty, etc. also supported
     },

     -- Callback functions
     on_open = function(win)
       -- Run when Zen Mode opens
     end,
     on_close = function()
       -- Run when Zen Mode closes
     end,
   },
 },
}
