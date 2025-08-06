{
  config,
  ...
}:
let
  inherit (config.nixvimlib.keys) mkKeymaps;

  # Core keymaps grouped by functionality
  coreKeymaps = [
    (mkKeymaps "n" "<Space>" "<NOP>" "Disable space bar")
    (mkKeymaps "n" "<esc>" ":noh<CR>" "Clear search highlights")
    (mkKeymaps "n" "Y" "y$" "Yank to end of line")
    (mkKeymaps "n" "<C-c>" ":b#<CR>" "Switch to previous buffer")
    (mkKeymaps "n" "<C-x>" ":close<CR>" "Close current window")
    (mkKeymaps [ "n" "v" "i" ] "<C-s>" ":w<CR>" "Save file")
  ];

  # File operations
  fileKeymaps = [
    (mkKeymaps "n" "<leader>s" ":w<CR>" "Save file")
    (mkKeymaps "n" "<leader>q" ":q<CR>" "Quit file")
    (mkKeymaps "n" "<leader>wq" ":wq<CR>" "Save and quit")
    (mkKeymaps "n" "<leader>qq" ":qa!<CR>" "Quit all without saving")
  ];

  # Window navigation
  windowKeymaps = [
    (mkKeymaps "n" "<leader>h" "<C-w>h" "Navigate to left window")
    (mkKeymaps "n" "<leader>l" "<C-w>l" "Navigate to right window")
    (mkKeymaps "n" "<leader>j" "<C-w>j" "Navigate to down window")
    (mkKeymaps "n" "<leader>k" "<C-w>k" "Navigate to upper window")
    (mkKeymaps "n" "<leader>sl" "<c-w>v" "Split window vertically")
    (mkKeymaps "n" "<leader>sj" "<c-w>s" "Split window horizontally")
    (mkKeymaps "n" "<leader>sc" "<c-w>c" "Close current window")
    (mkKeymaps "n" "<leader>so" "<c-w>o" "Close other windows")
  ];

  # Line navigation
  lineKeymaps = [
    (mkKeymaps "n" "L" "$" "Jump to end of line")
    (mkKeymaps "n" "H" "^" "Jump to start of line")
    (mkKeymaps "n" "<M-k>" ":move-2<CR>" "Move line up")
    (mkKeymaps "n" "<M-j>" ":move+<CR>" "Move line down")
  ];

  # Multi-mode keymaps examples
  multiModeKeymaps = [
    (mkKeymaps [ "n" "v" ] "j" "gj" "Navigate by display line")
    (mkKeymaps [ "n" "v" ] "k" "gk" "Navigate by display line")
    (mkKeymaps [ "n" "i" ] "<C-h>" "<Left>" "Move left in insert mode")
    (mkKeymaps [ "n" "i" ] "<C-j>" "<Down>" "Move down in insert mode")
    (mkKeymaps [ "n" "i" ] "<C-k>" "<Up>" "Move up in insert mode")
    (mkKeymaps [ "n" "i" ] "<C-l>" "<Right>" "Move right in insert mode")
  ];

  # Linux-specific keymaps
  linuxKeymaps = [
    (mkKeymaps "n" "<C-Up>" ":resize +2<CR>" "Resize window up")
    (mkKeymaps "n" "<C-Down>" ":resize -2<CR>" "Resize window down")
    (mkKeymaps "n" "<C-Left>" ":vertical resize +2<CR>" "Resize window left")
    (mkKeymaps "n" "<C-Right>" ":vertical resize -2<CR>" "Resize window right")
  ];

  # Visual mode keymaps
  visualKeymaps = [
    (mkKeymaps "v" ">" ">gv" "Indent and keep selection")
    (mkKeymaps "v" "<" "<gv" "Unindent and keep selection")
    (mkKeymaps "v" "K" ":m '<-2<CR>gv=gv" "Move selection up")
    (mkKeymaps "v" "J" ":m '>+1<CR>gv=gv" "Move selection down")
    (mkKeymaps "v" "<leader>s" ":sort<CR>" "Sort selection")
  ];

in
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  keymaps =
    [ ]
    ++ coreKeymaps
    ++ windowKeymaps
    ++ visualKeymaps
    ++ multiModeKeymaps
    ++ linuxKeymaps
    ++ fileKeymaps
    ++ lineKeymaps;
}
