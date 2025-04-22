# Custom Neovim Configuration

A personalized Neovim setup built on top of LazyVim with custom plugins, keymaps, and settings for efficient coding. This configuration is specifically tailored for C/C++ development with 42 School integration.

![Screenshot of Neovim](./assets/dashboard-preview.png) <!-- Optional: Add your screenshot path here -->

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration Structure](#configuration-structure)
- [Key Features](#key-features)
  - [42 School Integration](#42-school-integration)
- [Color Schemes](#color-schemes)
- [LSP Support](#lsp-support)
- [Custom UI Elements](#custom-ui-elements)
- [Auto-Save Feature](#auto-save-feature)
- [Troubleshooting](#troubleshooting)
- [Customization](#customization)
- [Default Settings](#default-settings)
- [Acknowledgements](#acknowledgements)

## Features

- **LazyVim Foundation**: Built on the excellent [LazyVim](https://github.com/LazyVim/LazyVim) distribution for a solid base configuration
- **42 School Integration**: 42header plugin for official headers and Norminette support
- **Auto-Save**: Automatically saves your work as you edit
- **Enhanced UI**: Customized bufferline, statusline, and tabline
- **Multiple Colorschemes**: Catppuccin, Tokyo Night, and Rose Pine themes
- **Debugging Support**: Integrated debugging for C/C++ with nvim-dap
- **File Navigation**: Telescope file browser for fuzzy navigation
- **Tmux Integration**: Seamless navigation between Neovim and Tmux
- **Custom Dashboard**: Personalized start screen with ASCII art
- **Git Integration**: Visualize git changes and status
- **LSP Support**: Language Server Protocol for code intelligence

## Requirements

- Neovim >= 0.9.0
- [FiraCode Nerd Font](https://www.nerdfonts.com/) (for icons)
- Git
- A terminal with true color support
- For 42 School features:
  - Norminette installed and in your PATH
  - 42header configured with your username

## Installation

1. Back up your existing Neovim configuration if necessary:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```
2. Clone this repository:
	```
	git clone https://github.com/Miami05/nvim-config.git ~/.config/nvim
	```
3. Start Neovim:
	```
	nvim
	```
	Plugins will be automatically installed on first launch.
    

## Configuration Structure

-   `init.lua` - Main configuration with core settings
    
-   `lazy.lua` - Plugin manager setup
    
-   `lua/config/` - Configuration files:
    
    -   `keymaps.lua` - Custom key bindings
        
    -   `options.lua` - Neovim options
        
    -   `autocmds.lua` - Auto commands
        
-   `lua/plugins/` - Plugin configurations:
    
    -   `42header.lua` - 42 School header plugin
        
    -   `autosave.lua` - Auto-save functionality
        
    -   `bufferline.lua` - Buffer and tab management
        
    -   `colorscheme.lua` - Theme configuration
        
    -   `debugging.lua` - DAP setup for C/C++
        
    -   `file-browser.lua` - Telescope file browser
        
    -   `ft_count_lines.lua` - Line count display
        
    -   `incline.lua` - Window title bar customization
        
    -   `inc-rename.lua` - Incremental rename utility
        
    -   `lsp.lua` - Language Server Protocol setup
        
    -   `lualine.lua` - Status line configuration
        
    -   `miami.lua` - Custom dashboard
        
    -   `norminette.lua` - 42 School norm checker
        
    -   `notifications.lua` - Enhanced notifications
        
    -   `nvim-tmux-navigator.lua` - Seamless Tmux integration
        
    -   `telescope.lua` - Fuzzy finder configuration
        
    -   `treesitter.lua` - Syntax highlighting and parsing
    
    ## Key Features

### 42 School Integration

-   **42header**: Press `<F1>` to insert the 42 header in your files
    
-   **Norminette**: Integrated norm checking with `:Norminette` or `<leader>nn`
    
-   **Auto-norm check**: Automatically runs norm check on file save
    
## Color Schemes

This configuration comes with three beautiful color schemes:

-   **Catppuccin** (default)
    
-   **Tokyo Night**
    
-   **Rose Pine**
    

To change the color scheme, modify the `lua/plugins/colorscheme.lua` file.

## LSP Support

The following language servers are installed and configured:

-   `lua_ls` - Lua language server
    
-   `clangd` - C/C++ language server
    
-   `pyright` - Python language server
    
-   `sqlls` - SQL language server
    
-   `cmake` - CMake language server
    
-   `bashls` - Bash language server
    

## Custom UI Elements

-   **Incline**: Enhanced window title bars with file information, git status, and diagnostics
    
-   **Line Counter**: Shows line count information
    
-   **Custom Dashboard**: Personalized start screen with ASCII art
    
-   **LuaLine**: Customized status line
    
-   **BufferLine**: Enhanced buffer tabs
    

## Auto-Save Feature

Files are automatically saved when:

-   Leaving insert mode
    
-   Text is changed
    
-   All buffers are saved to ensure consistency
    

## Troubleshooting

If you encounter issues:

1.  Check `:checkhealth` for any missing dependencies
    
2.  Update plugins with `:Lazy update`
    
3.  Try restarting with minimal configuration: `nvim --clean`
    
4.  Ensure Norminette is installed if using 42 School features
    

## Customization

To customize this configuration:

1.  Modify `init.lua` for core settings
    
2.  Edit `lua/config/keymaps.lua` for custom key bindings
    
3.  Add or modify plugins in the `lua/plugins/` directory
    
4.  Adjust `lua/config/options.lua` for Neovim options
    

## Default Settings

-   Tabs set to 4 spaces (non-expanded)
    
-   Line numbers and relative line numbers enabled
    
-   Scrolloff set to 8 lines
    
-   Swap files disabled, undofile enabled
    
-   Cursorline enabled for better visibility
    
-   Smart case search enabled
    

## Acknowledgements

-   [LazyVim](https://github.com/LazyVim/LazyVim) for the excellent base configuration
    
-   [Lazy.nvim](https://github.com/folke/lazy.nvim) for the plugin manager
    
-   [42Paris/42header](https://github.com/42Paris/42header) for the 42 School header
    
-   [norminette-vim](https://github.com/alexandregv/norminette-vim) for Norminette integration
    
-   All plugin authors for their amazing contributions

