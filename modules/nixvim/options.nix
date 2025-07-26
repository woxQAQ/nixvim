{ lib, pkgs, ... }:
{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        integrations = {
          # cmp = true;
          gitsigns = true;
          neotree = true;
          treesitter = true;
        };
      };
    };
  };
  luaLoader.enable = true;
  globals = {
    loaded_ruby_provider = 0; # Ruby
    loaded_perl_provider = 0; # Perl
    loaded_python_provider = 0; # Python 2
    disable_diagnostics = false;
    disable_autoformat = false;
    spell_enabled = true;
    colorizing_enabled = false;
    first_buffer_opened = false;
    whitespace_character_enabled = false;
  };
  clipboard = {
    # Use system clipboard
    register = "unnamedplus";
    providers = {
      wl-copy = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        enable = true;
        package = pkgs.wl-clipboard;
      };
    };
  };
  opts = {
    updatetime = 100; # Faster completion

    relativenumber = true; # Relative line numbers
    number = true; # Display the absolute line number of the current line
    hidden = true; # Keep closed buffer open in the background
    mouse = "a"; # Enable mouse control
    mousemodel = "extend"; # Mouse right-click extends the current selection
    splitbelow = true; # A new window is put below the current one
    splitright = true; # A new window is put right of the current one

    swapfile = false; # Disable the swap file
    modeline = true; # Tags such as 'vim:ft=sh'
    modelines = 100; # Sets the type of modelines
    undofile = true; # Automatically save and restore undo history
    incsearch = true; # Incremental search: show match for partly typed search command
    inccommand = "split"; # Search and replace: preview changes in quickfix list
    ignorecase = true; # When the search query is lower-case, match both lower and upper-case
    #   patterns
    smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
    #   case characters
    scrolloff = 8; # Number of screen lines to show around the cursor
    cursorline = false; # Highlight the screen line of the cursor
    cursorcolumn = false; # Highlight the screen column of the cursor
    signcolumn = "yes"; # Whether to show the signcolumn
    colorcolumn = "100"; # Columns to highlight
    laststatus = 3; # When to use a status line for the last window
    fileencoding = "utf-8"; # File-content encoding for the current buffer
    termguicolors = true; # Enables 24-bit RGB color in the |TUI|
    spell = false; # Highlight spelling mistakes (local to window)
    wrap = false; # Prevent text from wrapping

    # Tab options
    tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
    shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
    softtabstop = 0;
    expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
    autoindent = true; # Do clever autoindenting

    textwidth = 0; # Maximum width of text that is being inserted.  A longer line will be
    #   broken after white space to get this width.

    # Folding
    foldlevel = 99; # Folds with a level higher than this number will be closed
    foldcolumn = "1";
    foldenable = true;
    foldlevelstart = -1;
    fillchars = {
      horiz = "━";
      horizup = "┻";
      horizdown = "┳";
      vert = "┃";
      vertleft = "┫";
      vertright = "┣";
      verthoriz = "╋";

      eob = " ";
      diff = "╱";

      fold = " ";
      foldopen = "";
      foldclose = "";

      msgsep = "‾";
    };
    breakindent = true;
    cmdheight = 0;
    copyindent = true;
    history = 100;
    infercase = true;
    linebreak = true;
    showmode = false;
    showtabline = 2;
    timeoutlen = 500;
    title = true;
    virtualedit = "block";
    writebackup = false;
    lazyredraw = false;
    synmaxcol = 240;
    showmatch = true;
    matchtime = 1;
    startofline = true;
    report = 9001;
  };
}
