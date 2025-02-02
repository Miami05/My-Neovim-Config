# Noevim-Confings
A personalized Neovim setup tailored for efficient development with a focus on performance, usability, and minimal distractions. It includes key plugins for syntax highlighting, linting, autocompletion, file navigation, and Git integration. Optimized for speed with custom keybindings and a clean, minimal UI.


## Directory Structure

```
├── init.lua                    # Main configuration file
├── lazy-lock.json              # Dependency lock file for Lazy.nvim
└── lua/
    ├── config/                 
    │   └── lazy.lua            # Lazy.nvim configuration
    └── plugins/                
        ├── 42header.lua        # Custom header for 42-themed Neovim setup
        ├── alpha.lua           # Startup dashboard
        ├── autopairs.lua       # Autopair configuration for parentheses, quotes, etc.
        ├── auto-save.lua       # Auto-save configuration
        ├── completions.lua     # Autocompletion setup
        ├── debugging.lua       # Debugging setup
        ├── devicons.lua        # File icon configuration
        ├── format.lua          # Code formatting settings
        ├── ft_count_lines.lua # Line count for file types
        ├── gitsigns.lua        # Git integration for signs
        ├── lsp-config.lua      # LSP (Language Server Protocol) configuration
        ├── lualine.lua         # Statusline configuration
        ├── luarocks.lua        # LuaRocks plugin setup
        ├── neo-tree.lua        # File explorer setup
        ├── none-ls.lua         # None-ls setup for LSP integration
        ├── norminette.lua      # Norminette configuration for 42
        ├── nvim-tmux-navigator.lua # Tmux and Neovim navigator
        ├── overseer.lua        # Task management setup
        ├── telescope.lua       # Fuzzy file finder setup
        ├── terminal.lua        # Terminal configuration
        ├── treesitter.lua      # Treesitter setup for better syntax highlighting
        └── ui.lua              # UI customizations and settings
```

## Features

-   **Lazy.nvim**: Handles plugin management with automatic installation and updating.
-   **Custom Header**: 42-themed startup header for a personalized touch.
-   **Autocompletion**: Powered by `nvim-cmp` with LSP and snippets support.
-   **File Navigation**: Seamlessly navigate your files using `telescope.nvim` and `neo-tree`.
-   **Git Integration**: Visualize Git changes with `gitsigns.nvim`.
-   **LSP Support**: Fully configured LSP with built-in support for multiple languages.
-   **UI Customizations**: Clean and minimalistic UI with a custom status line powered by `lualine.nvim`.
-   **Additional Plugins**: A variety of other tools such as `treesitter`, `auto-save`, `autopairs`, and more.
- 
## Installation

1.  Clone this repository:
```
git clone https://github.com/yourusername/Neovim-Configurations.git ~/.config/nvim
```

2. Install dependencies using [Lazy.nvim](https://github.com/folke/lazy.nvim) by running:
```
nvim
:Lazy sync
```
3.  Enjoy your enhanced Neovim setup!
    

## Customizing Your Setup

Feel free to modify any of the plugin configurations located in `lua/plugins/` or add new ones. Key settings are located in `lua/config/lazy.lua` and `init.lua`. The repository is designed to be modular, so it's easy to update or change the setup to fit your needs.

## Contributing

If you have suggestions for new features or improvements, feel free to open an issue or submit a pull request.

