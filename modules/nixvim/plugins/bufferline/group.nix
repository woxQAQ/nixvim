{
  options = {
    toggle_hidden_on_enter = true;
  };

  items = [
    {
      name = "Tests";
      highlight = {
        underline = true;
        fg = "#a6da95";
        sp = "#494d64";
      };
      priority = 2;
      # icon = "";
      matcher.__raw = ''
        function(buf)
          return buf.name:match('%test') or buf.name:match('%.spec')
        end
      '';
    }
    {
      name = "Docs";
      highlight = {
        undercurl = true;
        fg = "#ffffff";
        sp = "#494d64";
      };
      auto_close = false;
      matcher.__raw = ''
        function(buf)
          return buf.name:match('%.md') or buf.name:match('%.txt')
        end
      '';
    }
  ];
}
