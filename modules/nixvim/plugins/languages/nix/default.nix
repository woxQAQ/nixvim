# Nix 语言支持 - 提供 Nix 文件的 LSP (nil/nixd) 集成、
# direnv 自动加载以及 nix-develop 开发 shell 支持，
# 为 Nix 配置开发提供完整的语言服务
{
  plugins = {
    direnv.enable = true;
    nix.enable = true;
    nix-develop.enable = true;
  };
}
