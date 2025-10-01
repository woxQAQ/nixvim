[
  {
    key = "s";
    action.__raw = ''function() require("flash").jump() end'';
    mode = [
      "n"
      "x"
      "o"
    ];
    options.desc = "Flash";
  }
  {
    key = "S";
    action.__raw = ''function() require("flash").treesitter() end'';
    mode = [
      "n"
      "x"
      "o"
    ];
    options.desc = "Flash Treesitter";
  }
  {
    key = "r";
    action.__raw = ''function() require("flash").remote() end'';
    mode = [
      "o"
    ];
    options.desc = "Remote Flash";
  }
  {
    key = "R";
    action.__raw = ''function() require("flash").treesitter_search() end'';
    mode = [
      "o"
    ];
    options.desc = "Treesitter Search";
  }
  {
    key = "gl";
    action.__raw = ''
      function()
        require("flash").jump {
          search = { mode = 'search', max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = '^',
        }
      end
    '';
    mode = [
      "n"
      "x"
      "o"
    ];
    options.desc = "Flash Line";
  }
  # { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
]
