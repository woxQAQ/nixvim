{
  config,
  pkgs,
  lib,
  nvlib,
  ...
}:
let
  inherit (nvlib.keys { inherit lib; })
    normal
    visual
    insert
    actionWithDesc
    ;
  normalSet =
    normal {
      "<Space>" = "<NOP>";

      # Esc to clear search results
      "<esc>" = ":noh<CR>";

      "j" = actionWithDesc "v:count==0? 'gj': 'j'" "move down";
      "k" = actionWithDesc "v:count==0? 'gk': 'k'" "move up";

      # fix Y behaviour
      Y = "y$";

      # back and fourth between the two most recent files
      "<C-c>" = ":b#<CR>";

      # close by Ctrl+x
      "<C-x>" = ":close<CR>";

      # save by Space+s or Ctrl+s
      "<leader>s" = actionWithDesc ":w<CR>" "save file";
      "<C-s>" = ":w<CR>";

      # navigate to left/right window
      "<leader>h" = actionWithDesc "<C-w>h" "navigate to left window";
      "<leader>l" = actionWithDesc "<C-w>l" "navigate to right window";
      "<leader>j" = actionWithDesc "<C-w>j" "navigate to down window";
      "<leader>k" = actionWithDesc "<C-w>k" "navigate to upper window";

      "|" = actionWithDesc "<CMD>vsplit<CR>" "split window vertical";
      "-" = actionWithDesc "<CMD>split<CR>" "split window horizontal";

      # Press 'H', 'L' to jump to start/end of a line (first/last character)
      L = actionWithDesc "$" "jump to start of line";
      H = actionWithDesc "^" "jump to end of line";

      # move current line up/down
      # M = Alt key
      "<M-k>" = ":move-2<CR>";
      "<M-j>" = ":move+<CR>";

      "<leader>W" = actionWithDesc ":w!<CR>" "force save";
      "<leader>Q" = actionWithDesc ":q!<CR>" "force quit";

      "<TAB>" = actionWithDesc ":bnext<CR>" "next buffer";
      "<S-TAB>" = actionWithDesc ":bprevious<CR>" "previous buffer";

      # "<leader>rp" = ":!remi push<CR>";
    }
    ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux (normal {
      # resize with arrows
      "<C-Up>" = actionWithDesc ":resize +2<CR>" "resize larger horizontal";
      "<C-Down>" = actionWithDesc ":resize -2<CR>" "resize smaller horizontal";
      "<C-Left>" = ":vertical resize +2<CR>";
      "<C-Right>" = ":vertical resize -2<CR>";
    });
  visualSet = visual {
    ">" = ">gv";
    "<" = "<gv";
    "<TAB>" = ">gv";
    "<S-TAB>" = "<gv";

    # move selected line / block of text in visual mode
    "K" = ":m '<-2<CR>gv=gv";
    "J" = ":m '>+1<CR>gv=gv";

    # sort
    "<leader>s" = ":sort<CR>";
    "<BS>" = "x";
  };
  insertSet = insert {
    "<C-k>" = "<C-o>gk";
    "<C-h>" = "<Left>";
    "<C-l>" = "<Right>";
    "<C-j>" = "<C-o>gj";
  };
in
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  keymaps = lib.nixvim.keymaps.mkKeymaps {
    options.silent = true;
  } (normalSet ++ visualSet ++ insertSet);
}
