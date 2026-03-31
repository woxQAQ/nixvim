# Claude Code - Anthropic 的 Claude AI 编程助手在 Neovim 中的集成，
# 在侧边窗口中提供交互式 AI 对话和代码辅助
# { ... }:
{
  plugins.claude-code = {
    enable = false;
    lazyLoad.settings.cmd = [
      "ClaudeCode"
      "ClaudeCodeContinue"
      "ClaudeCodeResume"
      "ClaudeCodeVerbose"
    ];

    settings = {
      window = {
        position = "vertical";
      };
    };
  };
  # keymaps = import ./keymaps.nix;
}
