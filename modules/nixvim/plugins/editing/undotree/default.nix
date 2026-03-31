# undotree - 可视化撤销历史树，
# 以树形结构展示所有编辑操作的撤销/重做分支，
# 支持预览差异、切换到任意历史状态
{
  plugins = {
    undotree = {
      enable = true;

      settings = {
        CursorLine = true;
        DiffAutoOpen = true;
        DiffCommand = "diff";
        DiffpanelHeight = 10;
        HelpLine = true;
        HighlightChangedText = true;
        HighlightChangedWithSign = true;
        HighlightSyntaxAdd = "DiffAdd";
        HighlightSyntaxChange = "DiffChange";
        HighlightSyntaxDel = "DiffDelete";
        RelativeTimestamp = true;
        SetFocusWhenToggle = true;
        ShortIndicators = false;
        TreeNodeShape = "*";
        TreeReturnShape = "\\";
        TreeSplitShape = "/";
        TreeVertShape = "|";
      };
    };
  };

  keymaps = import ./keymaps.nix;
}
