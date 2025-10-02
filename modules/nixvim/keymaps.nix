let
  mkKeymap = mode: key: action: desc: {
    inherit mode key action;
    options = {
      inherit desc;
      silent = true;
      noremap = true;
      remap = true;
    };
  };

  # Core keymaps grouped by functionality
  coreKeymaps = [
    (mkKeymap "n" "<Space>" "<NOP>" "Disable space bar")
    (mkKeymap "n" "<esc>" ":noh<CR>" "Clear search highlights")
    (mkKeymap "n" "Y" "y$" "Yank to end of line")
    (mkKeymap "n" "<C-c>" ":b#<CR>" "Switch to previous buffer")
    (mkKeymap "n" "<C-x>" ":close<CR>" "Close current window")
    (mkKeymap [ "n" "v" "i" ] "<C-s>" ":w<CR>" "Save file")
  ];

  # File operations
  fileKeymaps = [
    # (mkKeymap "n" "<leader>s" ":w<CR>" "Save file")
    (mkKeymap "n" "<leader>q" ":q<CR>" "Quit file")
    (mkKeymap "n" "<leader>wq" ":wq<CR>" "Save and quit")
    (mkKeymap "n" "<leader>qq" ":qa!<CR>" "Quit all without saving")
  ];

  # Window navigation
  windowKeymaps = [
    (mkKeymap "n" "<leader>h" "<C-w>h" "Navigate to left window")
    (mkKeymap "n" "<leader>l" "<C-w>l" "Navigate to right window")
    (mkKeymap "n" "<leader>j" "<C-w>j" "Navigate to down window")
    (mkKeymap "n" "<leader>k" "<C-w>k" "Navigate to upper window")
    (mkKeymap "n" "<leader>sl" "<c-w>v" "Split window vertically")
    (mkKeymap "n" "<leader>sj" "<c-w>s" "Split window horizontally")
    (mkKeymap "n" "<leader>sc" "<c-w>c" "Close current window")
    (mkKeymap "n" "<leader>so" "<c-w>o" "Close other windows")
  ];

  # Line navigation
  lineKeymaps = [
    (mkKeymap "n" "L" "$" "Jump to end of line")
    (mkKeymap "n" "H" "^" "Jump to start of line")
    (mkKeymap "n" "<M-k>" ":move-2<CR>" "Move line up")
    (mkKeymap "n" "<M-j>" ":move+<CR>" "Move line down")
  ];

  # Multi-mode keymaps examples
  multiModeKeymaps = [
    (mkKeymap [ "n" "v" ] "j" "gj" "Navigate by display line")
    (mkKeymap [ "n" "v" ] "k" "gk" "Navigate by display line")
    (mkKeymap [ "n" "i" ] "<C-h>" "<Left>" "Move left in insert mode")
    (mkKeymap [ "n" "i" ] "<C-j>" "<Down>" "Move down in insert mode")
    (mkKeymap [ "n" "i" ] "<C-k>" "<Up>" "Move up in insert mode")
    (mkKeymap [ "n" "i" ] "<C-l>" "<Right>" "Move right in insert mode")
  ];

  # Linux-specific keymaps
  linuxKeymaps = [
    (mkKeymap "n" "<C-Up>" ":resize +2<CR>" "Resize window up")
    (mkKeymap "n" "<C-Down>" ":resize -2<CR>" "Resize window down")
    (mkKeymap "n" "<C-Left>" ":vertical resize +2<CR>" "Resize window left")
    (mkKeymap "n" "<C-Right>" ":vertical resize -2<CR>" "Resize window right")
  ];

  # Visual mode keymaps
  visualKeymaps = [
    (mkKeymap "v" ">" ">gv" "Indent and keep selection")
    (mkKeymap "v" "<" "<gv" "Unindent and keep selection")
    (mkKeymap "v" "K" ":m '<-2<CR>gv=gv" "Move selection up")
    (mkKeymap "v" "J" ":m '>+1<CR>gv=gv" "Move selection down")
    (mkKeymap "v" "<leader>s" ":sort<CR>" "Sort selection")
  ];

in
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  keymaps =
    coreKeymaps
    ++ windowKeymaps
    ++ visualKeymaps
    ++ multiModeKeymaps
    ++ linuxKeymaps
    ++ fileKeymaps
    ++ lineKeymaps;
}
