# todo-comments.nvim - 高亮和导航代码中的 TODO、FIXME、HACK、NOTE 等注释标记，
# 支持按关键词搜索、列出所有待办事项，
# 并可与 Trouble 集成在诊断面板中显示
{
  plugins.todo-comments = {
    enable = true;
    keymaps = {
      todoTrouble.key = "<leader>xq";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ft";
      action = ''<CMD>lua Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" }})<CR>'';
      options = {
        desc = "Find TODOs";
      };
    }
  ];
}
