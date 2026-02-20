(
  let
    mkSelect = key: query: group: {
      mode = [
        "x"
        "o"
      ];
      inherit key;
      action.__raw = "function() require('nvim-treesitter-textobjects.select').select_textobject('${query}', '${group}') end";
    };
  in
  [
    (mkSelect "am" "@function.outer" "textobjects")
    (mkSelect "im" "@function.inner" "textobjects")
    (mkSelect "ac" "@class.outer" "textobjects")
    (mkSelect "ic" "@class.inner" "textobjects")
    (mkSelect "as" "@local.scope" "locals")
  ]
)
