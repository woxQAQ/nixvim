{
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
    vimsyn_embed = "l";
    # Whether to load netrw by default, see https://github.com/bling/dotvim/issues/4
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
    netrw_liststyle = 3;
    loaded_zipPlugin = 1;
    loaded_gzip = 1;
    loaded_tarPlugin = 1;
    loaded_sql_completion = 1;
  };
  clipboard = {
    # Use system clipboard
    register = "unnamedplus";
    providers = {
      # Use OSC 52 for SSH clipboard integration
      osc52.enable = true;
    };
  };

  opts = {
    # Faster completion
    updatetime = 500;
    # Time in milliseconds to wait for a mapped sequence to complete,
    # see https://unix.stackexchange.com/q/36882/221410 for more info
    timeoutlen = 300;

    # Relative line numbers
    relativenumber = true;
    # Display the absolute line number of the current line
    number = true;

    hidden = true; # Keep closed buffer open in the background
    mouse = "a"; # Enable mouse control
    mousemodel = "extend"; # Mouse right-click extends the current selection

    # Split window below/right when creating horizontal/vertical windows
    splitbelow = true; # A new window is put below the current one
    splitright = true; # A new window is put right of the current one
    # Avoid the flickering when splitting window horizontal
    splitkeep = "screen";
    # Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
    swapfile = false; # Disable the swap file
    # broken after white space to get this width.
    fillchars = {
      vert = "┃";
      eob = " ";
      diff = "╱";
      fold = " ";
      foldsep = " ";
      foldopen = "";
      foldclose = "";
      msgsep = "‾";
    };
    # Ignore certain files and folders when globbing
    wildignore = [
      "*.o"
      "*.obj"
      "*.dylib"
      "*.bin"
      "*.dll"
      "*.exe"
      "*/.git/*"
      "*/.svn/*"
      "*/__pycache__/*"
      "*/build/**"
      "*.jpg"
      "*.png"
      "*.jpeg"
      "*.bmp"
      "*.gif"
      "*.tiff"
      "*.svg"
      "*.ico"
      "*.pyc"
      "*.pkl"
      "*.DS_Store"
      "*.aux"
      "*.bbl"
      "*.blg"
      "*.brf"
      "*.fls"
      "*.fdb_latexmk"
      "*.synctex.gz"
      "*.xdv"
    ];
    wildignorecase = true;

    # tab settings
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;

    matchpairs = [
      "<:>"
      "「:」"
      "『:』"
      "【:】"
      "\":\""
      "':'"
      "《:》"
    ];

    ignorecase = true;
    smartcase = true;
    fileencoding = "utf-8";
    fileencodings = [
      "ucs-bom"
      "utf-8"
      "cp936"
      "gb18030"
      "big5"
      "euc-jp"
      "euc-kr"
      "latin1"
    ];

    # Break line at predefined characters
    linebreak = true;
    # Character to show before the lines that have been soft-wrapped
    showbreak = "↪";

    #List all matches and complete till longest common string
    wildmode = "list:longest";

    # Minimum lines to keep above and below cursor when scrolling
    scrolloff = 3;

    fileformats = [
      "unix"
      "dos"
    ]; # Fileformats to use for new files

    visualbell = true;
    errorbells = false; # Do not use visual and errorbells
    history = 500;

    list = true;
    listchars = {
      tab = "▸ ";
      extends = "❯";
      precedes = "❮";
      nbsp = "␣";
    };

    #Auto-write the file based on some condition
    autowrite = true;

    # Auto reload file if changed outside nvim
    autoread = true;

    # Show hostname, full path of file and last-mod time on the window title.
    # The meaning of the format str for strftime can be found in
    # http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
    # lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
    title = true;
    # titlestring = "%{v:lua.require('utils').get_titlestr()}";

    #Persistent undo even after you close a file and re-open it
    undofile = true;

    messagesopt = "hit-enter,history:500";

    pumheight = 10; # Maximum number of items to show in popup menu
    pumblend = 5; # Pseudo transparency for completion menu

    winblend = 0; # Pseudo transparency for floating window
    winborder = "single";

    spelllang = [
      "en"
    ];

    # Align indent to next multiple value of shiftwidth. For its meaning,
    # see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
    shiftround = true;

    virtualedit = "block"; # Virtual edit is useful for visual block edit

    #Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
    tildeop = true;

    synmaxcol = 250; # Text after this column number is not highlighted
    startofline = false;
    grepprg = "rg --vimgrep --no-heading --smart-case";
    grepformat = "%f:%l:%c:%m";

    termguicolors = true;

    #Set up cursor color and shape in various mode, ref:
    # https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
    guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20";

    signcolumn = "yes:1";

    diffopt = [
      "vertical"
      "filler"
      "closeoff"
      "context:3"
      "internal"
      "indent-heuristic"
      "algorithm:histogram"
    ];

    wrap = false; # Do not wrap
    ruler = false;

    showcmdloc = "statusline";

    completeitemalign = "abbr,kind,menu";
    # completepopup = "height:12,width:60,border:single";
    jumpoptions = "stack";
    pumborder = "single";
    pummaxwidth = 100;
    completetimeout = 100;
  };
}
