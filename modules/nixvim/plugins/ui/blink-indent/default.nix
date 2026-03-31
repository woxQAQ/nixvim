{
  plugins.blink-indent = {
    enable = true;
    lazyLoad.settings = {
      event = [
        "BufReadPost"
        "BufNewFile"
      ];
    };
  };
}
